<template>
    <div class="im-bar">
        <div class="im-bar-item">
            <router-link to="/">
                <div class="im-bar-item-icon"><i class="icon iconfont icon-pengyou"></i></div>
                <div class="im-bar-item-str">找朋友</div>
            </router-link>
        </div>
        <div class="im-bar-item">
            <router-link to="/messages">
                <div class="im-bar-item-icon"><i class="icon iconfont icon-xinxi"></i></div>
                <div class="im-bar-item-str">消息</div>
            </router-link>
        </div>
        <div class="im-bar-item">
            <div class="im-bar-item-icon"><i class="icon iconfont icon-wode"></i></div>
            <div class="im-bar-item-str">我</div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Bar"
    }
</script>

<style>
    .im-bar {
        height: 60px;
        width: 100%;
        position: fixed;
        bottom: 0;
    }

    .im-bar .im-bar-item {
        text-align: center;
        background-color: rgba(171, 171, 171, 0.15);
        width: 33.3333%;
        height: 100%;
        padding: 10px 0 0 0;
        float: left;
    }

    .im-bar .im-bar-item-str {
        font-size: 12px;
    }

    .im-bar .im-bar-item-icon .icon {
        font-size: 25px;
    }
</style>