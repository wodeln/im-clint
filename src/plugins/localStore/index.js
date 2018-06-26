let localStore={
    /**
     * Set data
     * @param  {String}   key
     * @param  {Any}      value
     */
    setData(key, value) {
        value = JSON.stringify(value);
        window['localStorage'] && (window['localStorage'][key] = value);
    },
    /**
     * Get data
     * @param key
     * @returns {*}
     */
    getData(key) {
        if (this.hasData(key)) {
            try {
                return JSON.parse(window['localStorage'][key]);
            } catch (error) {
                return window['localStorage'][key];
            }
        }
        return null;
    },
    /**
     * 判断 local[key] 是否存在
     * @param  {String}  key
     * @return {Boolean}
     */
    hasData(key) {
        try {
            if (window['localStorage'] && window['localStorage'][key]) return true;
        } catch (error) {
            throw new Error(error);
        }
        return false;
    },
    /**
     * 删除 local[key]
     * @param key
     */
    removeData(key) {
        window['localStorage'] &&
        window['localStorage'][key] &&
        window['localStorage'].removeItem(key);
    }
}

localStore.install = (Vue) => {
    Vue.prototype.$lstore = localStore;
}

export default localStore;