<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            <v-touch v-on:swipeleft="onSwipeLeft">
                <div class="im-user-info">
                    <div class="im-user-backimg">
                        <mt-button :class="[{ attentioned: userInfo.attentioned }, attention]" @click="attentionOpt">+
                            关注
                        </mt-button>
                        <img v-lazy="'http://is.com:3001'+userInfo.user_avatar">
                    </div>
                    <div class="im-user-infos">
                        <div class="im-user-nickname"><span class="str">昵称：</span>{{userInfo.user_nickname}}</div>
                        <div class="im-user-nickname"><span class="str">年龄：</span>{{userInfo.user_age}}岁</div>
                        <div class="im-user-nickname"><span class="str">地区：</span>{{userInfo.user_city}}</div>
                        <div class="im-user-nickname"><span class="str">个性签名：</span>{{userInfo.user_stata_message}}
                        </div>
                    </div>
                </div>
                <router-link :to="'/message/'+userInfo.user_id+'/'+avatarName+'/'+userInfo.user_nickname">
                    <mt-button type="primary" :disabled="!userInfo.attentionMe" class="send-message">发送消息</mt-button>
                </router-link>
                <mt-popup
                        v-model="ifShow"
                        position="right"
                        class="left-slider">
                    <left/>
                </mt-popup>
            </v-touch>
        </div>
        <bar/>
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    import left from '@/components/common/Left';

    export default {
        name: "UserInfo",
        data() {
            return {
                tTitle: "用户信息",
                ifHome: false,
                attention: "attention",
                userInfo: {},
                ifShow: false,
                avatarName: ""
            }
        },
        components: {
            bar,
            topTitle,
            left
        },
        methods: {
            attentionOpt: function () {
                this.attentioned = !this.attentioned;
                this.$http.post('/user/attentionOpt',
                    {
                        hsid: this.$route.params.hsid,
                        attention: this.attentioned
                    });
            },
            onSwipeLeft: function () {
                this.ifShow = true;
            }
        },
        mounted: function () {
            this.$http.get('/user/user?hsid=' + this.$route.params.hsid)
                .then(
                    (res) => {
                        this.userInfo = res.data;
                        this.avatarName = res.data.user_avatar.split('/')[4];
                    }
                )
        }
    }
</script>

<style lang="scss" scoped>
    .im-user-info {
        .im-user-backimg {
            img {
                display: block;
                width: 100%;
                opacity: 0;
                transition: opacity .5s ease-in;
                &[lazy="loaded"], &[lazy="error"] {
                    opacity: 1
                }
            }
            .attention {
                position: absolute;
                right: 9px;
                top: 55px;
                height: 30px;
            }
            .attentioned {
                background-color: #26A2FF;
                color: #ffffff;
            }
        }
        .im-user-infos {
            background-color: #ffffff;
            text-align: left;
            padding: 5px 5px;
            font-size: smaller;
            div {
                line-height: 40px;
            }
            .str {
                color: #9B9B9B;
            }
        }
    }

    .page-content {
        text-align: center;
    }

    .send-message {
        width: 95%;
        margin-top: 20px;
        margin-bottom: 30px;
    }
</style>