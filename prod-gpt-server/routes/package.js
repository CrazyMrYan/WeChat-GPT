const router = require('koa-router')();
const { Package } = require('../models');
const timeFormat = require('../utils/timeFormat');
const checkToken = require('../utils/checkToken');

router.get('/pro_api/packages', async ctx => {
  const { rows, count } = await Package.findAndCountAll({ raw: true, where: { hasEnable: 1 } });

  const items = rows.map(item => ({
    ...item,
    effectiveDuration: item?.effectiveDuration >= 99999 ? '永久' : item?.effectiveDuration,
    maxQuantity: item?.maxQuantity >= 99999 ? '无限' : item?.maxQuantity,
    money: item?.money / 100,
    listingTime: timeFormat(item.listingTime)
  }));
  ctx.body = { items, count };
});

router.put('/pro_api/packages', async ctx => {
  const { effectiveDuration, maxQuantity, money, hasEnable, name, ADMIN_TOKEN, id } = ctx.request.body;

  if(!checkToken(ADMIN_TOKEN, ctx)) return

  if(!id) {
    ctx.body = { msg: '套餐id不能为空' };
  }
  if(money <= 0) {
    ctx.status = 400;
    ctx.body = { msg: '金额不能小于等于0（分）' };
    return;
  }

  await Package.update({
    effectiveDuration,
    maxQuantity,
    name,
    hasEnable,
    money
  }, {
    where: {
      id: id
    }
  });

  const package = await Package.findOne({ raw: true, where: { id } });
  ctx.body = package
});


module.exports = router;