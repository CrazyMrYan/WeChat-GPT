const https = require('https');
const { OpenaiKeys } = require('../models');

const sharchKey = (api_key, url) => {
  return new Promise((resolve, reject) => {
    const getOption = () => {
      return {
        hostname: 'api.openai.com',
        path: `/dashboard/billing/${url}`,
        method: 'GET',
        port: 443,
        headers: {
          'Authorization': `Bearer ${api_key}`,
          'Content-Type': 'application/json',
        }
      }
    }

    const res = https.request(getOption(), (res) => {
      const list = [];
      res.on('data', chunk => {
          list.push(chunk);
      });

      res.on('end', () => {
        resolve(JSON.parse(Buffer.concat(list).toString()))
      });

      res.on('error', (err) => {
        console.log(err);
        reject(err)
      })
    });
    res.end()
  })
}


module.exports = async () => {
  const { rows, count } = await OpenaiKeys.findAndCountAll({ raw: true, where: { hasEnable: 1 } });
  console.log(`查询条数Key：${count}`);
  rows.forEach(async item => {
    
    const { access_until } = await sharchKey(item.value, `subscription`);
    // 存在 sensitiveId 的时候才去查询
    if(item.sensitiveId) {
      const { total_used } = await sharchKey(item.sensitiveId, `credit_grants`);
      // 额度小于 0.1 的时候，禁用此key
      if(total_used < 0.1) {
        await OpenaiKeys.update({ hasEnable: 0 }, { where: { id: item.id } })
      }
    }

    const expireDate = access_until * 1000;
    const cuurentDate = Date.parse(new Date());
    //  当前时间大于等于过期时间
    if(cuurentDate >= expireDate) {
      await OpenaiKeys.update({ hasEnable: 0 }, { where: { id: item.id } })
    }
  })
}
