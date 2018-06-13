<template>
    <div class="im-bar">
        <div class="im-bar-item">
            <div class="im-bar-item-icon"><i class="icon iconfont icon-pengyou"></i></div>
            <div class="im-bar-item-str">找人</div>
        </div>
        <div class="im-bar-item">
            <div class="im-bar-item-icon"><i class="icon iconfont icon-xinxi"></i></div>
            <div class="im-bar-item-str">聊天</div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Bar"
    }
</script>

<style>
    .im-bar{
        height: 60px;
        width: 100%;
        position: fixed;
        bottom: 0;
    }
    .im-bar .im-bar-item{
        text-align: center;
        background-color: rgba(171,171,171,0.15);
        width: 50%;
        height: 100%;
        padding: 10px 0 0 0;
        float: left;
    }
    .im-bar .im-bar-item-str{
        font-size: 12px;
    }
    .im-bar .im-bar-item-icon .icon{
        font-size: 25px;
    }
</style>