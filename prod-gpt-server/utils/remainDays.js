const { Order } = require('../models');

module.exports = async () => {
  const { rows } = await Order.findAndCountAll({ raw: true });
  rows.forEach(async item => {
    await Order.update(
      {
        // 大于等于99999的时是永久的，不再减少
        remainDays: item.remainDays >= 99999 || item.remainDays <= 0
          ? item.remainDays
          : item.remainDays - 1
      },
      {
        where: {
          id: item.id
        }
      }
    )
  })
}