const timeFormat = require('./timeFormat');

module.exports = (data) => {
    "use strict";
    if (Object(data) !== data || Array.isArray(data))
        return data;
    const regex = /\.?([^.\[\]]+)|\[(\d+)\]/g,
        resultHolder = {};
    for (let p in data) {
        let cur = resultHolder,
            prop = "",
            m;
        while (m = regex.exec(p)) {
            cur = cur[prop] || (cur[prop] = (m[2] ? [] : {}));
            prop = m[2] || m[1];
        }
        if (cur.hasOwnProperty(prop)) {
            throw new Error("Duplicate property: " + p);
        }
        if(p.indexOf('Time') > -1) { 
            data[p] = timeFormat(data[p]) ?? timeFormat();
        } else {
            cur[prop] = data[p];
        }
    }
    return resultHolder[""] || resultHolder;
};
