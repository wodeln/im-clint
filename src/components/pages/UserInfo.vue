<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            <div class="im-user-info">
                <div class="im-user-backimg">
                    <mt-button :class="[{ attentioned: attentioned }, attention]" @click="attentionOpt">+ 关注</mt-button>
                    <img v-lazy="userInfo.avatar">
                </div>
                <div class="im-user-infos">
                    <div class="im-user-nickname"><span class="str">昵称：</span>{{userInfo.user_name}}</div>
                    <div class="im-user-nickname"><span class="str">年龄：</span>{{userInfo.age}}岁</div>
                    <div class="im-user-nickname"><span class="str">地区：</span>{{userInfo.city}}</div>
                    <div class="im-user-nickname"><span class="str">个性签名：</span>{{userInfo.stata_message}}</div>
                </div>
            </div>
            <mt-button type="primary" :disabled="!attentionMe" class="send-message">发送消息</mt-button>
        </div>
        <bar/>
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    import userInfo from '../../json/user_info.json';
    export default {
        name: "UserInfo",
        data(){
            return{
                tTitle: "用户信息",
                ifHome: false,
                userInfo:userInfo,
                attentioned:true,
                attention:"attention",
                attentionMe:true
            }
        },
        components:{
            bar,
            topTitle
        },
        methods:{
            attentionOpt:function () {
                this.attentioned = !this.attentioned;
            }
        }
    }
</script>

<style lang="scss">
    .im-user-info{
        .im-user-backimg{
            img{
                display: block;
                width: 100%;
                opacity: 0;
                transition: opacity .5s ease-in;
                &[lazy="loaded"], &[lazy="error"] {
                    opacity: 1
                }
            }
            .attention{
                position: absolute;
                right: 9px;
                top: 55px;
                height: 30px;
            }
            .attentioned{
                background-color: #26A2FF;
                color: $white-base;
            }
        }
        .im-user-infos{
            background-color: $white-base;
            text-align: left;
            padding: 5px 5px ;
            font-size: smaller;
            div{
                line-height: 40px;
            }
            .str{
                color: $gray-minor;
            }
        }
    }
    .send-message{
        width: 95%;
        margin-top: 20px;
        margin-bottom: 30px;
    }
</style>