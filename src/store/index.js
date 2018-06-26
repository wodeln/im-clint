import Vue from "vue";
import Vuex from "vuex";
import modules from "./module/";
import user from './module/user';

Vue.use(Vuex);
const state={
    UID:26,
    UNAME:"帅气的小哥哥"
}

export default new Vuex.Store({
    modules:{
        ...modules
    }
})