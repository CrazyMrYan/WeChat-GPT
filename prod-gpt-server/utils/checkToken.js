const md5 = require('md5');
const { ADMIN_TOKEN, appToken } = require('../config');

module.exports = (token, ctx = {}) => {
    const result = md5(`${appToken}:${token}`);
    if(ADMIN_TOKEN !== result) {
        ctx.status = 401;
        ctx.body = {
            msg: '权限不足'
        };
        return false;
    }
    return ADMIN_TOKEN === result;
}