import axios from "axios";
import router from "./router/";
import { Popup } from 'mint-ui';
import lstore from './plugins/localStore';
import store from "./store/";
import Vue from 'vue';
import VueSocketio from 'vue-socket.io';
let TOKEN;
axios.interceptors.request.use(
    config => {
        TOKEN = lstore.getData('IM_ACCESS_TOKEN');
        // TOKEN ? config.headers.Authorization = TOKEN : config.headers.Authorization = "";
        if (TOKEN) {
            if(!store.state.message.connect){
                let user = lstore.getData('USER_INFO');
                let url = `${process.env.APP_API_HOST}?user_id=${user.user_id}&user_avatar=${user.user_avatar}&user_nickname=${user.user_nickname}`;
                Vue.use(VueSocketio, url, store);
            }
            config.headers.Authorization = TOKEN;
        }else {
            config.headers.Authorization = "";
        }
        return config;
    },
    error => {
        console.error("错误的传参", "fail");
        return Promise.reject(error);
    }
);

/**
 * 添加响应拦截器
 *     @author jsonleex <jsonlseex@163.com>
 */
axios.interceptors.response.use(
    res => res,
    /* 错误处理 */
    error => {
        const callback = () => {
            router.push({
                path: "/login",
                query: { redirect: router.currentRoute.fullPath }
            });
        };
        const setTimeoutCallback = () => {
            setTimeout(callback, 100);
        };
        if (error.response) {
            const { status, data } = error.response;
            switch (status) {
                case 401:
                    lstore.removeData('IM_ACCESS_TOKEN');
                    callback();
                    // Message.error(TOKEN ? "登录失效, 请重新登录" : "你还没有登录");
                    break;
                case 500:
                    throw new Error("服务器错误");
                default:
                    // Message.error(plusMessageAnalyze(data));
                    break;
            }
        } else if (error.request) {
            console.log(error.request);
        } else {
            console.log("Error", error.message);
        }

        return Promise.reject(error);
    }
);

axios.defaults.baseURL = "/im/v1";
if (process.env.NODE_ENV === "production") {
    axios.defaults.baseURL = `${process.env.APP_API_HOST}/api/${process.env.APP_API_VERSION}`;
}
export default axios;