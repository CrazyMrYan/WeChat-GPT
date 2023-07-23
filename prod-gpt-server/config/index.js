
module.exports = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: '',
    port: 3306,
    dialect: 'mysql',
    pool: {
        max: 5,
        min: 0,
        idle: 10000
    },
    freePackageId: '',
    appid: '',
    mchid: '',
    responseType: 'code',
    appSecret: '',
    serial_no: '',
    apiv3_private_key:'',
    notify_url: 'orders/notify_url',
    publicKey: require('fs').readFileSync('./ssl/apiclient_cert.pem').toString(), // 公钥
    privateKey: require('fs').readFileSync('./ssl/apiclient_key.pem').toString(), // 秘钥
    appToken: 'gptpro',
    ADMIN_TOKEN: '',
}

