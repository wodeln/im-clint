<template>
    <div class="page">
        <top-title :tTitle="$route.params.user_name,ifHome"/>
        <div class="page-content" id="content">
            <div class="im-message-list">
                <div v-for="message in messages" :class="message.message_type==1?hs:me">
                    <div class="im-message-avatar">
                        <router-link :to="{name: 'user-info', params: { id:userId }}">
                            <img v-lazy="message.avatar" />
                        </router-link>
                    </div>
                    <div class="im-message">
                        {{message.message_content}}
                    </div>
                </div>
            </div>
        </div>
        <div class="im-message-bar">
            <div class="im-bar-send-message">
                <mt-field placeholder="" @keyup.enter="sendMessage" class="messages" v-model="msg"></mt-field>
                <mt-button type="primary" class="send-button" :disabled="!send" @click="sendMessage">发送</mt-button>
            </div>

        </div>
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    import messages from '../../json/messages.json';

    export default {
        name: "Message",
        data() {
            return {
                ifHome: false,
                messages:messages,
                hs:'im-message-hs',
                me:'im-message-me',
                msg:'',
                send:false,
                userId:this.$route.params.id
            }
        },
        mounted: function () {
            var div = document.getElementById('content');
            div.scrollTop = div.scrollHeight;
        },
        components: {
            topTitle,
            bar
        },
        watch:{
            msg:function (n,o) {
                if(n!='') this.send=true;
                else this.send=false;
            },
            messages:function (n,o) {
                this.$nextTick(()=>{
                    var div = document.getElementById('content');
                    div.scrollTop = div.scrollHeight;
                });
            }

        },
        methods:{
            sendMessage:function () {
                let messageObj = {
                    message_content:this.msg,
                    avatar:'/static/images/xgg.jpg',
                    message_type:"0"
                }
                messages.push(messageObj);
                this.msg="";
            }
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
                    opacity: 0;
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
                margin:3px 15px;
                border: 0;
                border-radius: 8px;
                background-color: white;
                padding: 5px 8px 5px 5px;
                display: flex;
                align-items: flex-start;
                &:after{
                    position: absolute;
                    content: "";
                    width: 0;
                    height: 0;
                    left:85%;
                    border-top: 8px solid transparent;
                    border-left: 12px solid white;
                    border-bottom: 8px solid transparent;
                }
            }

        }

        .im-message-hs {
            .im-message-avatar {
                margin-left: 3px;
            }
            .im-message {
                margin:3px 0 0 15px;
                border: 0;
                border-radius: 8px;
                background-color: white;
                padding: 5px 5px 5px 8px;
                &:before{
                    position: absolute;
                    content: "";
                    width: 0;
                    height: 0;
                    right:85%;
                    border-top: 8px solid transparent;
                    border-right: 12px solid white;
                    border-bottom: 8px solid transparent;
                }
            }
            text-align: left;
        }
    }
</style>