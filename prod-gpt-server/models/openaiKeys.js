const { DataTypes } = require('sequelize');
const sequelize = require('../db')

const OpenAIKeys = sequelize.define(
  "OpenAIKeys",
  {
    id: {
        type: DataTypes.STRING, // 类型
        allowNull: false, // 是否允许为空
        primaryKey: true
    },
    value: {
        type: DataTypes.STRING,
        allowNull: false, 
    },
    hasEnable: {   
        type: DataTypes.BOOLEAN,
        allowNull: false,
        get() {
            return this.getDataValue('hasEnable') === 1
        }
    },
    sensitiveId: {
        type: DataTypes.STRING,
        allowNull: false,
    }
}, {
    sequelize,
    timestamps: false,
    freezeTableName: true,
    tableName: 'openai_keys'
}
);
module.exports = OpenAIKeys