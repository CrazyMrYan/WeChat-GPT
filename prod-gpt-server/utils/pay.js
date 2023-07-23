const { Order } = require('../models');
const { Op } = require('sequelize');

module.exports = async () => {
  // 删掉过期的订单
  await Order.destroy({ 
    raw: true, 
    where: {
      status: 'EXPIRED',
    }
  });

  await Order.update(
    {
      status: 'INVALID'
    }, 
    {
    where: {
      [Op.or]: [
        { 
          remainQuantity: 0 
        },
        { 
          remainDays: 0 
        }
      ]
    }
  });
}