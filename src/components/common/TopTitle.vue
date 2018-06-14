<template>
    <div>
        <mt-header fixed :title="tTitle" class="im-header">
            <mt-button slot="left" icon="back" @click="goBack" v-if="!ifHome"></mt-button>
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
            goBack:function () {
                this.$router.go(-1)
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