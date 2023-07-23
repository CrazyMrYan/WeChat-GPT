const { DataTypes } = require('sequelize');
const sequelize = require('../db')

const Package = sequelize.define('Package', {
    id: {
        type: DataTypes.INTEGER,
        allowNull: false, 
        primaryKey: true
    },
    money: {
        type: DataTypes.INTEGER,
        allowNull: false, 
    },
    effectiveDuration: {   
        type: DataTypes.INTEGER,
        allowNull: false, 
    },
    maxQuantity: {
        type: DataTypes.INTEGER,
        allowNull: false, 
    },
    listingTime: {
        type: DataTypes.STRING,
        allowNull: false, 
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    hasEnable: {
        type: DataTypes.BOOLEAN,
        defaultValue: 1,
        allowNull: false,
        get() {
            return this.getDataValue('hasEnable') === 1
        }
    }
}, {
    sequelize, 
    timestamps: false,
    freezeTableName: true,
    tableName: 'packages'
})

module.exports = Package