import Vue from 'vue';
import Router from 'vue-router';
import im from '@/components/im';
import users from '@/components/pages/Users';
import userInfo from '@/components/pages/UserInfo';
import message from '@/components/pages/Message';
import messages from '@/components/pages/Messages';
import attentionMessage from '@/components/pages/AttentionMessage';
import userMessage from '@/components/pages/UserMessage';
// import HelloWorld from '@/components/HelloWorld'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'users',
            component: users
        },
        {
            path:'/user-info',
            name:'user-info',
            component:userInfo
        },
        {
            path:'/message',
            name:'message',
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
        }
    ]
})
