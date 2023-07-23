const router = require('koa-router')();
const { Order, Package, User } = require('../models');
const { Op } = require('sequelize');
const timeFormat = require('../utils/timeFormat');
const unFlatten = require('../utils/unflatten.js');
const { v4 } = require('uuid');
const { appid, mchid, apiv3_private_key, notify_url, publicKey, privateKey } = require('../config')
const WxPay = require('wechatpay-node-v3');

const pay = new WxPay({
  appid,
  mchid,
  publicKey, // 公钥
  privateKey, // 秘钥
});

const { orderGet, orderAdd } = require('../validators');
Order.belongsTo(Package, { foreignKey: 'packageId', targetKey: 'id', as: 'package' })
Order.belongsTo(User, { foreignKey: 'userId', targetKey: 'id', as: 'user' })

router.get('/pro_api/orders', async ctx => {
  if (!orderGet.test(ctx.query)) {
    ctx.status = 400;
    ctx.body = {
      message: '参数错误'
    };
    return;
  }

  try {
    const { rows, count } = await Order.findAndCountAll({
      raw: true,
      where: {
        userId: {
          [Op.like]: `%${ctx.query.userId}%`
        },
        [Op.or]: [
          { status: 'SUCCESS' },
          { status: 'INVALID' },
        ]
      },
      order: [
        ['remainDays', 'DESC']
      ],
      include: [{
        as: 'package',
        model: Package,
      }, {
        as: 'user',
        model: User,
      }]
    });

    const items = rows.map(item => {
      if(item.remainDays <= 0) {
        item.remainDays = 0
      }
      
      return {
        ...unFlatten(item),
        orderTime: timeFormat(item.orderTime),
        // 大于等于99999的时是永久的，不再减少
        remainDays: item.remainDays >= 99999
          ? '永久'
          : item.remainDays,
        // 大于等于99999的是无限次的，不再减少
        remainQuantity: item.remainQuantity >= 99999 
          ? '无限' 
          : item.remainQuantity,
      }
    });

    ctx.body = { items, count };
  } catch (error) {
    ctx.body = { error };
  }
});

router.post('/pro_api/orders', async ctx => {
  if (!orderAdd.test(ctx.request.body)) {
    ctx.status = 400;
    ctx.body = { msg: '参数错误' };
    return
  }

  const { packageId, userId } = ctx.request.body;
  // 是否存在此套餐
  const package = await Package.findOne({ where: { id: packageId }, raw: true });
  if (!package) {
    ctx.status = 404;
    ctx.body = {
      msg: '此套餐不存在或已下架'
    }
    return;
  }

  const user = await User.findOne({ where: { id: userId }, raw: true });
  if (!user) {
    ctx.status = 404;
    ctx.body = {
      msg: '此用户不存在'
    }
    return;
  }

  const { effectiveDuration, maxQuantity, name, money } = package;

  try {
    const orderId = v4().replaceAll('-', '').toLocaleUpperCase();
    const params = {
      description: name, // 订单描述
      out_trade_no: orderId, // 订单号，一般每次发起支付都要不一样，可使用随机数生成
      notify_url,
      amount: {
        total: money, // 支付金额，单位为分
      },
      payer: {
        openid: userId, // 微信小程序用户的openid，一般需要前端发送过来
      },
      scene_info: {
        payer_client_ip: 'ip',
      },
    };
    const result = await pay.transactions_jsapi(params);

    await Order.findOrCreate({
      where: { id: orderId },
      raw: true,
      defaults: {
        name,
        userId,
        packageId,
        paymentId: '',
        orderTime: new Date(),
        id: orderId,
        remainDays: effectiveDuration, // 有效天数
        remainQuantity: maxQuantity, // 有效次数
        status: 'PENDING', // PENDING: 未支付 SUCCESS: 已支付 2: 已过期
      }
    })

    ctx.status = 200;
    ctx.body = result;
  } catch (error) {
    ctx.status = 500;
    ctx.body = { error };
  }
});

router.post('/pro_api/orders/notify_url', async(ctx) => {
  // 申请的APIv3
  const { ciphertext, associated_data, nonce } = ctx.request.body.resource;
  // 解密回调信息
  const result = pay.decipher_gcm(ciphertext, associated_data, nonce, apiv3_private_key);
  // 拿到订单号
  const { out_trade_no } = result;
  // 支付成功
  if (result.trade_state == 'SUCCESS') {
    await Order.update({
      status: 'SUCCESS',
      paymentId: result.transaction_id
    }, {
      where: { 
        id: out_trade_no
      }
    })
  } else { // 取消订单
    await Order.update({
      status: 'EXPIRED',
      paymentId: result.transaction_id
    }, {
      where: { 
        id: out_trade_no
      }
    })
  }
})

module.exports = router;
