const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const schedule = require('node-schedule');
const queryOpenaiKey = require('./utils/queryOpenaiKey');
const processingRemainDays = require('./utils/remainDays.js');
const processPlay = require('./utils/pay.js');
const path = require("path");
const serve = require('koa-static');
const static = serve(path.join(__dirname) + '/static/');
const app = new Koa();
const xmlParser = require('koa-xml-body');
// app.use(async (ctx, next) => {
//     ctx.set('Access-Control-Allow-Origin', '*')
//     ctx.set('Access-Control-Allow-Headers', 'content-type')
//     ctx.set('Access-Control-Allow-Methods', 'OPTIONS,GET,PUT,POST,DELETE')
//     await next()
//     // 允许所有跨域
//     if (ctx.request.method === 'OPTIONS') {
//         console.log('跨域请求')
//         ctx.response.status = 200
//         ctx.response.message = 'OK'
//     }
// })

app.use(bodyParser());
app.use(xmlParser())
app.use(require('./routes/feature').routes());
app.use(require('./routes/package').routes());
app.use(require('./routes/order').routes());
app.use(require('./routes/openaiKyes').routes());
app.use(require('./routes/chat').routes());
app.use(require('./routes/auth').routes());
app.use(require('./routes/admin').routes());

// 每分钟 定时过滤数据库中的key，过期的改状态
schedule.scheduleJob('1 * * * * *', async () => {
    try {
        await queryOpenaiKey();
        await processPlay();
    } catch (error) {
        console.log(error);
    }
});

// 每天23点59分 定时过滤数据库中的key
schedule.scheduleJob('59 59 23 * * *', async () => {
    try {
        await processingRemainDays()
    } catch (error) {
        console.log(error);
    }
});

// 静态资源
app.use(static);
app.listen(3000)