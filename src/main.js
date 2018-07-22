// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import App from './App';
import router from './router';
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
import './sass/index.scss';
import VueTouch from 'vue-touch';
import store from "./store/";
import Axios from "./http.js";
import localStore  from  '@/plugins/localStore';
import * as filters from './filters'
import lstore from "./plugins/localStore";
import VueSocketio from 'vue-socket.io';

let user = lstore.getData('USER_INFO');
let url = `${process.env.APP_API_HOST}?user_id=${user.user_id}&user_avatar=${user.user_avatar}&user_nickname=${user.user_nickname}`;
Vue.use(VueSocketio, url, store);

Vue.config.productionTip = false;
Vue.prototype.$http = Axios;
Vue.use(MintUI);
Vue.use(VueTouch, {name: 'v-touch'});
Vue.use(localStore);
// Vue.use(VueSocketio);



for (const k in filters){
    Vue.filter(k,filters[k]);
}


new Vue({
    el: '#app',
    store,
    router,
    components: {App},
    template: '<App/>'
})