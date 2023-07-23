const { DataTypes, Model } = require('sequelize');
const sequelize = require('../db')

class Feature extends Model {}

Feature.init({
    id: {
        type: DataTypes.INTEGER, // 类型
        allowNull: false, // 是否允许为空
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false, 
    },
    value: {   
        type: DataTypes.BOOLEAN,
        allowNull: false,
        get() {
            return this.getDataValue('value') === 1
        }
    },
    remark: {
        type: DataTypes.STRING,
    },
}, {
    sequelize, // 数据库连接实例
    timestamps: false, // 是否默认使用时间戳字段，为false时会默认为在查询加上updateAt和createAt字段。
    freezeTableName: true, //冻结表名，false时会自动把表已复数（Articles）形式查询
    tableName: 'features' // 指定表名，不指定默认为Articles
})

module.exports = Feature