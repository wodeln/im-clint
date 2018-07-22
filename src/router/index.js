import Vue from 'vue';
import Router from 'vue-router';
import im from '@/components/im';
import users from '@/components/pages/Users';
import userInfo from '@/components/pages/UserInfo';
import message from '@/components/pages/Message';
import messages from '@/components/pages/Messages';
import attentionMessage from '@/components/pages/AttentionMessage';
import userMessage from '@/components/pages/UserMessage';
import login from '@/components/Login';
// import HelloWorld from '@/components/HelloWorld'

Vue.use(Router)

const router = new Router({
    routes: [
        {
            path: '/',
            name: 'users',
            component: users
        },
        {
            path:'/user-info/:hsid',
            component:userInfo
        },
        {
            path:'/message/:hsid/:avatar/:nickname',
            component:message
        },
        {
            path:'/messages',
            component:messages,
            children:[
                {path:'/',component:messages},
                {path:'attention-message',component:attentionMessage},
                {path:'user-message',component:userMessage}
            ]
        },{
            path:'/login',
            component:login
        }
    ]
});

/**
 * 登录检查
 */
/*
router.beforeEach(function (to, from, next) {
    if(to.path==='/login'){
        next();
    }
    const logged = true;
    if(logged){
        next();
    }else{
        next('/login');
    }

})
*/

export default router;
