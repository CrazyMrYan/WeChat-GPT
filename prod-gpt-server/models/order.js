const { DataTypes } = require("sequelize");
const sequelize = require("../db");

const Order = sequelize.define(
  "Order",
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    userId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    paymentId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    packageId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    remainQuantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    remainDays: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    orderTime: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'PEDNING'
    }
  },
  {
    sequelize,
    timestamps: false,
    freezeTableName: true,
    tableName: "orders",
  }
);

module.exports = Order;
