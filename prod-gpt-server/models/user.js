const { DataTypes } = require('sequelize');
const sequelize = require('../db')

const User = sequelize.define('User', {
    id: {
        type: DataTypes.STRING, // 类型
        allowNull: false, // 是否允许为空
        primaryKey: true // 是否主键
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    createTime: {   
        type: DataTypes.DATE,
        allowNull: true,
        defaultValue: DataTypes.NOW
    },
    headimgurl: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    nickname: {
        type: DataTypes.STRING,
        allowNull: true
    },
    openid: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    sequelize,
    timestamps: false,
    freezeTableName: true,
    tableName: 'users' 
})

module.exports = User