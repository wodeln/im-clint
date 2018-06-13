import Vue from 'vue'
import Router from 'vue-router'
import im from '@/components/im'
import users from '@/components/pages/Users'
// import HelloWorld from '@/components/HelloWorld'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'users',
            component: users
        }
    ]
})
