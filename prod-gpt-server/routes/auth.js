const router = require('koa-router')();
const OAuth = require('wechat-oauth-middleware');
const { User, Package, Order } = require('../models');
const { userAdd } = require('../validators');
const { v4 } = require('uuid');
const { appid, appSecret, responseType, freePackageId } = require('../config');
const oauth = OAuth({
    appId: appid,
    appSecret,
    scope: OAuth.SCOPE_USER_INFO,
    response_type: responseType
});

router.get('/pro_api/users', oauth.forward(oauth.koa))

router.post('/pro_api/users', async (ctx) => {
    if (!userAdd.test(ctx.request?.body)) {
        ctx.status = 400;
        ctx.body = {
            message: '参数错误'
        };
        return;
    }

    const { openid, nickname = '', headimgurl = '' } = ctx.request.body;
    const [ user, created ] = await User.findOrCreate({
        where: { openid },
        defaults: {
            id: openid,
            name: nickname,
            openid,
            headimgurl,
            nickname
        }
    });
    // 如果是新建的用户
    if(created) {
        const package = await Package.findOne({
            raw: true,
            where: {
                id: freePackageId
            }
        })

        if(!package) {
            ctx.status = 404;
            ctx.body = {
                msg: '新用户活动已失效',
            }
            return
        }
        const  { effectiveDuration, maxQuantity, name, money }  = package;
        // 创建一个免费订单
        const orderId = v4().replaceAll('-', '').toLocaleUpperCase();
        const orderData = {
            id: orderId,
            userId: openid,
            packageId: freePackageId,
            remainDays: effectiveDuration,
            remainQuantity: maxQuantity,
            name,
            money,
            paymentId: 'free',
            status: 'SUCCESS'
        }

        const [ order ] = await Order.findOrCreate({
            raw: true,
            where: { 
                userId: openid,
                id: orderId
            },
            defaults: orderData
        });
        console.log(order);
    }

    ctx.status = 200;
    ctx.body = user;
})

module.exports = router;