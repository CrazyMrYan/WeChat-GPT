const router = require('koa-router')();
const { Feature } = require('../models');
const { v4 } = require('uuid');
const { featureAdd } = require('../validators');
const checkToken = require('../utils/checkToken');

router.get('/pro_api/features', async ctx => {
  const { rows, count } = await Feature.findAndCountAll({ raw: true });
  const items = rows.map(item => ({ ...item, value: !!item.value }));
  ctx.body = { items, count };
});

router.post('/pro_api/features', async ctx => {
  if (!featureAdd.test(ctx.request.body)) {
    ctx.status = 400;
    ctx.body = { msg: '参数错误' };
    return
  }

  try {
    const { name = '', value = '', remark = '' } = ctx.request.body ?? {};
    const result = await Feature.create({
      name,
      value,
      remark,
      id: v4()
    });
    ctx.body = result;
  } catch (error) {
    ctx.body = {};
  }
});


router.put('/pro_api/features', async ctx => {
  const { name = '', value = 1, ADMIN_TOKEN } = ctx.request.body ?? {};

  if(!checkToken(ADMIN_TOKEN, ctx)) return

  if (!featureAdd.test(ctx.request.body)) {
    ctx.status = 400;
    ctx.body = { msg: '参数错误' };
    return
  }


  await Feature.update(
    {
      value
    },
    {
      where: { name }
    });
  const feature = await Feature.findOne({ raw: true, where: { name } });

  ctx.body = feature;
});

module.exports = router;