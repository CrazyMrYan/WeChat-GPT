const Sequelize = require('sequelize');
const { host, user, password, database, port, dialect, pool } = require('../config')

const sequelize = new Sequelize(database, user, password, {
    host,
    port,
    dialect,
    pool
 });

sequelize.authenticate(); 
module.exports = sequelize