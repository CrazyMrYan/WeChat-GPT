const dayjs = require('dayjs'); 
module.exports = (time = new Date()) => dayjs(time).format('YYYY-MM-DD HH:mm:ss')
