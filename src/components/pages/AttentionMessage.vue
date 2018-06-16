<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            This is AttentionMessage page.
        </div>
        <bar />
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    export default {
        name: "AttentionMessage",
        data(){
            return{
                tTitle:'新增关注',
                ifHome:false
            }
        },
        components:{
            topTitle,
            bar
        }
    }
</script>

<style lang="scss">

</style>