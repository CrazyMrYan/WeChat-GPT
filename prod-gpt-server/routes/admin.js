const router = require('koa-router')();
const checkToken = require('../utils/checkToken');
const { User, Package, Order, OpenaiKeys, Feature } = require('../models');

const tables = {
    user: User,
    package: Package,
    order: Order,
    openai_keys: OpenaiKeys,
    feature: Feature,
}

router.post('/pro_api/admin', async (ctx) => {
    const { ADMIN_TOKEN, data = {} } = ctx.request.body;
    if(!checkToken(ADMIN_TOKEN, ctx)) return
    const { table, action, payload } = data;
    
    const tableModel = tables[table];
    if(!tableModel) {
        ctx.status = 400;
        return ctx.body = {
            msg: 'table not found'
        }
    }

    if(!tableModel[action]) {
        ctx.status = 400;
        return ctx.body = {
            msg: 'action not found'
        }
    }

    try {
        const reslut = await tableModel[action](...payload);
        ctx.body = {
            msg: 'success',
            data: reslut
        };
    } catch (error) {
        ctx.status = 500;
        ctx.body = {
            msg: 'error',
            data: error
        }
    }

});

module.exports = router;
