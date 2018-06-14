<template>
    <div>
        <mt-header fixed :title="tTitle" class="im-header"></mt-header>
    </div>
</template>

<script>
    export default {
        name: "TopTitle",
        data(){
            return{
                tTitle:"找朋友"
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