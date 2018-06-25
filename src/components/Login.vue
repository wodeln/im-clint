<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            <mt-field label="用户名" placeholder="请输入用户名"></mt-field>
            <mt-field label="密码" placeholder="请输入密码" type="password"></mt-field>
        </div>
        <bar/>
    </div>
</template>

<script>
    import bar from '@/components/common/Bar';
    import topTitle from '@/components/common/TopTitle';

    export default {
        name: "Login",
        data() {
            return {
                tTitle: "用户登录",
                ifHome: true
            }
        },
        components:{
            bar,
            topTitle
        }
    }
</script>

<style scoped>

</style>