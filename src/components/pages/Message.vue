<template>
    <div class="page">
        <top-title :tTitle="$route.params.user_name,ifHome"/>
        <div class="page-content" id="content">

                <div class="im-message-list">
                    <div v-for="message in messages"
                         v-bind:class="[message.from_user_id==userId ? 'im-message-hs' : 'im-message-me']"
                         v-if="!message.message_type">
                        <div class="im-message-avatar">
                            <router-link :to="'/user-info/'+message.from_user_id==userId?message.to_user_id+'':message.from_user_id+''">
                                <img :src="message|imgUrl"/>
                                <!--<img v-lazy="'http://is.com:3001'+message.from_user_id==userId?message.to_user_avatar:message.from_user_avatar">-->
                            </router-link>
                        </div>
                        <div class="im-message">
                            {{message.message_content}}
                        </div>
                    </div>
                </div>
                <!--<div>{{ssss}}</div>-->
                <mt-popup
                        v-model="ifShow"
                        position="right"
                        class="left-slider">
                    <left/>
                </mt-popup>

        </div>

        <div class="im-message-bar">
            <div class="im-bar-send-message">
                <mt-field placeholder="" class="messages" v-model="msg"></mt-field>
                <mt-button type="primary" class="send-button" :disabled="!send" @click="sendMessage">发送</mt-button>
            </div>

        </div>
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    import left from '@/components/common/Left';
    import lstore from '../../plugins/localStore';
    // import VueSocketio from 'vue-socket.io';

    export default {
        name: "Message",
        data() {
            return {
                ifHome: false,
                messages: [],
                msg: '',
                send: false,
                userId: this.$route.params.hsid,
                ifShow: false
            }
        },
        mounted: function () {
            var div = document.getElementById('content');
            div.scrollTop = div.scrollHeight;
        },
        filters: {
            imgUrl: (message) => {
                if (!message) return ''
                return message.from_user_id == this.userId ? `${process.env.APP_API_HOST}${message.to_user_avatar}` : `${process.env.APP_API_HOST}${message.from_user_avatar}`;
            }
        },
        components: {
            topTitle,
            bar,
            left
        },
        watch: {
            msg: function (n, o) {
                if (n != '') this.send = true;
                else this.send = false;
            },
            messages: function (n, o) {
                this.$nextTick(() => {
                    var div = document.getElementById('content');
                    div.scrollTop = div.scrollHeight;
                });
            }

        },
        methods: {
            sendMessage: function () {
                let fromUser = lstore.getData("USER_INFO");
                let toUserAvatar = "/public/images/upload/" + this.$route.params.avatar;
                let messageObj = {
                    from_user_id: fromUser.user_id,
                    from_user_avatar: fromUser.user_avatar,
                    from_user_nickname: fromUser.user_nickname,
                    to_user_id: parseInt(this.$route.params.hsid),
                    to_user_avatar: toUserAvatar,
                    to_user_nickname: this.$route.params.nickname,
                    message_group: fromUser.user_id + parseInt(this.$route.params.hsid),
                    message_content: this.msg,
                }
                this.$socket.emit('userMessage', messageObj);
                this.$store.commit('SEND_MESSAGE', messageObj);
                this.msg = "";
            },
            onSwipeLeft: function () {
                this.ifShow = true;
            }
        },
        created:function () {
            let aa = {
                message_type:true,
                to_user_id:parseInt(this.$route.params.hsid),
            }
            if(this.$store.state.message.MESSAGE.messages.get(parseInt(this.$route.params.hsid))==undefined){
                this.$store.commit('SEND_MESSAGE', aa);
            }
            this.messages = this.$store.state.message.MESSAGE.messages.get(parseInt(this.$route.params.hsid));
        }
    }
</script>

<style lang="scss">
    .im-message-bar {
        height: 40px;
        width: 100%;
        position: fixed;
        bottom: 1px;
        .im-bar-send-message {
            margin: 0;
            padding: 0;
            .messages, .send-button {
                float: left;
                height: 40px;
            }
            .mint-cell {
                min-height: 40px;
            }
            .messages {
                width: 80%;
            }
            .send-button {
                width: 20%;
            }
        }
    }

    .im-message-list {
        .im-message-hs, .im-message-me {
            margin-top: 10px;
            width: 100%;
            display: flex;
            align-items: flex-start;
            font-size: 15px;
            line-height: 25px;
            align-content: center;
            flex-wrap: wrap;
            .im-message, .im-message {
                max-width: 65%;
            }
            .im-message-avatar {
                width: 10%;
                border-radius: 50%;
                border: 2px solid #eee;
                overflow: hidden;
                img {
                    display: block;
                    width: 100%;
                    max-width: 100%;
                    /*opacity: 0;*/
                    transition: opacity .5s ease-in;
                    &[lazy="loaded"], &[lazy="error"] {
                        opacity: 1
                    }
                }
            }
        }

        .im-message-me {
            flex-direction: row-reverse;
            text-align: left;
            .im-message-avatar {
                margin-right: 3px;
            }
            .im-message {
                margin: 5px 4px;
                border: 0;
                border-radius: 8px;
                background-color: white;
                padding: 5px 8px 5px 5px;
                display: flex;
                align-items: flex-start;
                /*&:after {
                    position: absolute;
                    content: "";
                    width: 0;
                    height: 0;
                    left: 85%;
                    border-top: 8px solid transparent;
                    border-left: 12px solid white;
                    border-bottom: 8px solid transparent;
                }*/
            }

        }

        .im-message-hs {
            .im-message-avatar {
                margin-left: 3px;
            }
            .im-message {
                margin: 5px 0 0 4px;
                border: 0;
                border-radius: 8px;
                background-color: white;
                padding: 5px 5px 5px 8px;
                /*&:before {
                    position: absolute;
                    content: "";
                    width: 0;
                    height: 0;
                    right: 85%;
                    border-top: 8px solid transparent;
                    border-right: 12px solid white;
                    border-bottom: 8px solid transparent;
                }*/
            }
            text-align: left;
        }
    }
</style>