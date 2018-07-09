/**
 * 消息总数 >99 返回 99+
 * @param num
 * @returns {string}
 */
export function msgNum(num){
    return num > 99 ? "99+" : num;
}

/**
 * 服务端图片路径
 * @param img
 * @returns {*}
 */
export function imgUrl(img) {
    return process.env.APP_API_HOST + img;
}