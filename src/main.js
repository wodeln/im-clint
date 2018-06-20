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

Vue.config.productionTip = false;
Vue.use(MintUI);
Vue.use(VueTouch, {name: 'v-touch'});
// Vue.use(util);
/* eslint-disable no-new */
new Vue({
    el: '#app',
    store,
    router,
    components: {App},
    template: '<App/>'
})