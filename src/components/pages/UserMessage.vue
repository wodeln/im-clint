<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            <div class="im-user-message">
                <router-link
                        v-for="newMessage in newMessages"
                        :to="{name:'message',params:{id:newMessage.hs_id}}"
                        :key="newMessage.hs_id">
                    <mt-cell class="im-cell">
                        <div class="im-user-avatar">
                            <span>{{newMessage.message_num|mn}}</span>
                            <img v-lazy="newMessage.avatar">
                        </div>
                        <ul slot="title" class="im-message-info">
                            <!-- <li class="song-title">{{ item.topTitle }}</li> -->
                            <li>
                                <span>{{newMessage.hs_name}}</span>
                            </li>
                            <li class="im-hs-message">
                                {{newMessage.last_message_content}}
                            </li>
                        </ul>
                    </mt-cell>
                </router-link>
            </div>
        </div>
        <bar />
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    import newMessages from '../../json/new_messages.json';
    import Vue from 'vue';
    export default {
        name: "UserMessage",
        data(){
            return{
                tTitle:'新消息',
                ifHome:false,
                newMessages:newMessages
            }
        },
        components:{
            topTitle,
            bar
        }
    }
    Vue.filter('mn',function (num) {
        return num>99 ? "99+" : num;
    });
    
</script>

<style lang="scss">
    .im-user-message{
        .im-cell {
            padding: 2px 2px 2px 2px;
            margin: 0 0 3px;
            &:before, &:after {
                color: transparent;
            }
            .mint-cell-wrapper {
                flex-direction: row-reverse;
                padding: 0;
                background-image: none;
            }
            .mint-cell-title {
                overflow: hidden
            }
            .mint-cell-value {
                width: 16%;
                img {
                    opacity: 0;
                    transition: opacity .5s ease-in;
                    &[lazy="loaded"], &[lazy="error"] {
                        opacity: 1
                    }
                }
                .im-user-avatar {
                    position: relative;
                    width: 100%;
                    float:left;
                    img {
                        display: block;
                        width: 100%;
                        max-width: 100%;
                    }
                    span{
                        display: flex;
                        align-items: center;
                        justify-content:center;
                        width: 20px;
                        height: 20px;
                        font-size: 12px;
                        border-radius: 50%;
                        background-color: red;
                        color: white;
                        position: absolute;
                        left: 75%;
                    }
                }
            }

            .im-message-info {
                margin: 0 0 0 15px;
                text-align: left;
                li {
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    font-size: 14px;
                    line-height: 25px;
                }
                li>span{
                    margin-right: 5px;
                }
                .im-hs-message {
                    color: rgba(0, 0, 0, .5);
                }
            }
        }
    }

</style>