<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            content
        </div>
        <bar/>
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    export default {
        name: "UserInfo",
        data(){
            return{
                tTitle: "用户信息",
                ifHome: false
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