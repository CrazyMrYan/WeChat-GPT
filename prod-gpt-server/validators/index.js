const ParamValidator = require('param-validator.js')

const featureAdd = {
  name: {
    type: String,
    empty: false,
    maxLen: 60
  },
  value: {
    type: Number,
    empty: false,
  }
}

const orderGet = {
  userId: {
    type: String,
    empty: false,
  }
}

const orderAdd = {
  userId: {
    type: String,
    empty: false,
  },
  packageId: {
    type: String,
    empty: false,
  },
}

const userAdd = {
  openid: {
    type: String,
    empty: false,
  }
}

module.exports = {
  featureAdd: new ParamValidator(featureAdd),
  orderGet: new ParamValidator(orderGet),
  orderAdd: new ParamValidator(orderAdd),
  userAdd: new ParamValidator(userAdd),
}