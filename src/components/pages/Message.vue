<template>
    <div class="page">
        <top-title :tTitle="$route.params.user_name,ifHome"/>
        <div class="page-content">
            <div class="im-message-list">
            <ul>
                <li>
                    <mt-cell class="im-message-hs">
                        <div class="im-message-avatar">
                            <img v-lazy="imgUrl[0]">
                        </div>
                        <div class="im-message-hs-message">
                            小哥哥
                        </div>
                    </mt-cell>
                </li>

                <li>
                    <mt-cell class="im-message-me">
                        <div class="im-message-avatar">
                            <img v-lazy="imgUrl[1]">
                        </div>
                        <div class="im-message-hs-message">
                            小哥哥
                        </div>
                    </mt-cell>
                </li>
            </ul>
            </div>
        </div>
        <div class="im-message-bar">
            <div class="im-bar-send-message">
                <mt-field placeholder="" class="messages"></mt-field>
                <mt-button type="primary" class="send-button">发送</mt-button>
            </div>

        </div>
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    export default {
        name: "Message",
        data(){
            return{
                ifHome:false,
                imgUrl:['/static/images/xjj.jpg','/static/images/xgg2.jpg']
            }
        },
        components:{
            topTitle,
            bar
        }
    }
</script>

<style lang="scss">
    .im-message-bar{
        height: 40px;
        width: 100%;
        position: fixed;
        bottom: 1px;
        .im-bar-send-message {
            margin: 0;
            padding: 0;

            .messages,.send-button{
                float: left;
                height: 40px;
            }
            .mint-cell{
                min-height: 40px;
            }
            .messages{
                width: 80%;
            }
            .send-button{
                width: 20%;
            }
        }
    }

    .im-message-list{
        .im-message-hs,.im-message-me{
            margin-top: 10px;
            width: 100%;
            align-items:center;
            height: 40px;

            div{
                float: left;
            }
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
</style>