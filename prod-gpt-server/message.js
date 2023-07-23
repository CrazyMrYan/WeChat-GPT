const Koa = require('koa');
const Router = require('koa-router');
const { koaBody } = require('koa-body');
const xml2js = require('xml2js');

const app = new Koa();
const router = new Router();

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
router.post('/pro_api/authorize', async (ctx) => {
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

app.use(koaBody({ multipart: true, includeUnparsed: true }));
app.use(router.routes());
app.use(router.allowedMethods());

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
