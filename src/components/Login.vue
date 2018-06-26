<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            <mt-field label="用户名" id="user_name" v-model="user_name" placeholder="请输入用户名"></mt-field>
            <mt-field label="密码" id="password" v-model="password" placeholder="请输入密码" type="password"></mt-field>
            <div class="singin">
                <mt-button
                        type="primary"
                        class="singin-button"
                        :disabled="disabled"
                        @click="doLogin"
                >登录
                </mt-button>
                <div class="forget-password">忘记密码</div>
            </div>
        </div>

        <bar/>
    </div>
</template>

<script>
    import bar from '@/components/common/Bar';
    import topTitle from '@/components/common/TopTitle';
    import lstore from '../plugins/localStore';

    const qs = require('qs');

    export default {
        name: "Login",
        data() {
            return {
                tTitle: "用户登录",
                ifHome: true,
                user_name: '',
                password: ''
            }
        },
        computed: {
            disabled() {
                return this.user_name.length === 0 || this.password.length < 2
            }
        },
        components: {
            bar,
            topTitle
        },
        methods: {
            doLogin() {
                this.$http.post('/user/doLogin',
                    qs.stringify({
                        user_name: this.user_name,
                        password: this.password
                    })
                )
                .then((response) => {
                    console.log(response.data);
                    lstore.setData("IM_ACCESS_TOKEN",response.data.token);
                    this.$store.commit('SAVE_USER_INFO',response.data.user_info);
                    this.$router.push('/');
                })
                .catch(function (error) {
                    console.log(error);
                });

            }
        }
    }
</script>

<style scoped lang="scss">
    .singin {
        width: 100%;
        text-align: center;
        margin-top: 40px;
        .singin-button {
            width: 90%;
        }
        .forget-password {
            font-size: 14px;
            color: #999999;
            padding-top: 8px;
            width: 90%;
            text-align: right;
        }
    }

</style>