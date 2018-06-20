<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            <v-touch v-on:swipeleft="onSwipeLeft">
            <div class="im-user-list">
                <ul>
                    <router-link
                        tag='li'
                        :to="{name: 'user-info', params: { id: user.user_id }}"
                        v-for="user in users"
                        :key="user.user_id">

                        <mt-cell class="im-cell">
                            <div class="im-avatar">
                                <img v-lazy="user.avatar">
                            </div>
                            <ul slot="title" class="im-user-info">
                                <!-- <li class="song-title">{{ item.topTitle }}</li> -->
                                <li>
                                    <span>{{user.user_name}}</span>
                                    <span>{{user.age}}岁</span>
                                    <span>{{user.city}}</span>
                                </li>
                                <li class="im-user-stata-message">
                                    {{user.stata_message}}
                                </li>
                            </ul>
                        </mt-cell>
                    </router-link>
                </ul>

                <mt-popup
                        v-model="ifShow"
                        position="right"
                        class="left-slider">
                    <left />
                </mt-popup>
            </div>
            </v-touch>
        </div>

        <bar/>
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    import left from '@/components/common/Left';
    import users from '../../json/users.json';

    export default {
        name: "Users",
        data(){
            return{
                users: users,
                tTitle: '找朋友',
                ifHome: true,
                ifShow:false
            }
        },
        components: {
            topTitle,
            bar,
            left
        },
        methods:{
            onSwipeLeft:function () {
                this.ifShow=true;
            }
        }
    }
</script>

<style lang="scss">
    .im-cell {
        padding: 3px 3px 3px 3px;
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
            width: 20%;
            img {
                opacity: 0;
                transition: opacity .5s ease-in;
                &[lazy="loaded"], &[lazy="error"] {
                    opacity: 1
                }
            }
            .im-avatar {
                position: relative;
                width: 100%;
                float:left;
                border-radius: 50%;
                border: 3px solid #eee;
                overflow: hidden;
                img {
                    display: block;
                    width: 100%;
                    max-width: 100%;
                }
            }
        }

        .im-user-info {
            margin: 0 0 0 15px;
            text-align: left;
            li {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                font-size: 14px;
                line-height: 30px;
            }
            li>span{
                margin-right: 5px;
            }
            .im-user-stata-message {
                color: rgba(0, 0, 0, .5);
            }
        }
    }
</style>