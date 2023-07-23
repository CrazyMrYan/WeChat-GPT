const { Order, OpenaiKeys } = require('../models');
const router = require('koa-router')();
const xml2js = require('xml2js');
const { koaBody } = require('koa-body');

router.get('/pro_api/chat_key', async ctx => {
  if (!ctx.query.id) {
    ctx.status = 400;
    ctx.body = { msg: '参数错误' };
    return
  }
  const { rows, count } = await Order.findAndCountAll({
    raw: true,
    attributes: ['remainQuantity', 'remainDays'],
    where: { id: ctx.query.id, status: 'SUCCESS' }
  });

  if (count) {
    const [order] = rows;
    if (order.remainQuantity && order.remainDays) {
      const { rows, count } = await OpenaiKeys.findAndCountAll({ raw: true, where: { hasEnable: 1 } });
      if (!count) {
        ctx.status = 500;
        // 10001 为没有可用的openai key
        ctx.body = { msg: '系统异常，请联系管理人员【code: 10001】' };
        return
      } else {
        // 更新订单的可用次数
        await Order.update({ 
          // 大于等于99999的时是永久的，不再减少
          remainQuantity: order.remainQuantity >= 99999 
            ? order.remainQuantity 
            : order.remainQuantity - 1
        }, { 
          where: { id: ctx.query.id } 
        });
        const [key] = rows;
        ctx.body = { key: key.value };
        return
      }
    } else {
      ctx.status = 404;
      ctx.body = { msg: '此订单已失效' };
    }
  } else {
    ctx.status = 404;
    ctx.body = { msg: '此订单不存在或未支付成功' };
  }
});

// 构建回复的 XML 格式消息
function buildReplyXml(from, to, content) {
  return `
    <xml>
      <ToUserName><![CDATA[${to}]]></ToUserName>
      <FromUserName><![CDATA[${from}]]></FromUserName>
      <CreateTime>${parseInt(Date.now() / 1000)}</CreateTime>
      <MsgType><![CDATA[text]]></MsgType>
      <Content><![CDATA[${content}]]></Content>
    </xml>
  `;
}

// 关注回复路由
router.post('/pro_api/authorize', 
  koaBody({ multipart: true, includeUnparsed: true }), 
  async (ctx) => {
  const xmlParser = new xml2js.Parser();
  const parsedXml = await xmlParser.parseStringPromise(ctx.request.body.toString());

  const message = parsedXml.xml;
  if (message.MsgType[0] === 'event' && message.Event[0] === 'subscribe') {
    const reply = buildReplyXml(message.ToUserName[0], message.FromUserName[0], `你好，欢迎关注AI科技直通车，在这里可以体验前沿的AI技术。
现在就点击“GPT对话”让它解答你各种问题，充当各种角色，还是文案高手但凡你想写点东西都能给你带来灵感。`);
    ctx.type = 'application/xml';
    ctx.body = reply;
  } else {
    const reply = buildReplyXml(message.ToUserName[0], message.FromUserName[0], '客服微信：zql182055，备注AI');
    ctx.type = 'application/xml';
    ctx.body = reply;
  }
});

module.exports = router;
