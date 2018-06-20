import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

const state={
    UID:26,
    UNAME:"帅气的小哥哥"
}

export default new Vuex.Store({
    state
})