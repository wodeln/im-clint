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


axios.defaults.baseURL = "/im/v1";
if (process.env.NODE_ENV === "production") {
    axios.defaults.baseURL = `${process.env.VUE_APP_API_HOST}/api/${
        process.env.VUE_APP_API_VERSION
        }`;
}
export default axios;