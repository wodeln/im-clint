import axios from "axios";

let TOKEN;
axios.interceptors.request.use(
    config => {
        TOKEN = "skdjfksel;kw;elkrl;z;234";
        if (TOKEN) {
            config.headers.Authorization = TOKEN;
        }
        return config;
    },
    error => {
        console.error("错误的传参", "fail");
        return Promise.reject(error);
    }
);

export default axios;