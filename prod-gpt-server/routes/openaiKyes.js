const { OpenaiKeys } = require('../models');
const router = require('koa-router')();
const checkToken = require('../utils/checkToken');

router.get('/pro_api/openaikeys', async ctx => {
    const { ADMIN_TOKEN } = ctx.request.query;
    if(!checkToken(ADMIN_TOKEN, ctx)) return
    const { rows, count } = await OpenaiKeys.findAndCountAll({ raw: true });
    const items = rows.map(item => ({ ...item, hasEnable: !!item.hasEnable }));
    ctx.body = { items, count };
});

module.exports = router;
