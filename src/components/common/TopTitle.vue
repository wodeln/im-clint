<template>
    <div>
        <mt-header fixed :title="tTitle" class="im-header">
            <router-link to="this.$router.go(-1)" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
        </mt-header>
    </div>
</template>

<script>
    export default {
        name: "TopTitle",
        data(){
            return{
                msg:"找朋友"
            }
        },
        props:['tTitle','ifHome'],
        methods:{
            handleClose:function () {

            }
        }
    }
</script>

<style lang="scss">
    .im-header {
        justify-content: space-between;
        font-size: 18px;
    }
</style>