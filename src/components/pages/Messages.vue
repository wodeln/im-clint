<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            <div class="im-messages">
                <router-link to="/messages/attention-message">
                    <mt-cell class="im-attention-message" title="关注消息">
                        <span class="memo">新增关注</span>
                        <mt-badge type="error">10</mt-badge>
                        <img slot="icon" src="../../assets/like.png" width="20" height="20">
                    </mt-cell>
                </router-link>

                <mt-cell class="im-read-message" title="未读消息">
                    <span class="memo">未读消息</span>
                    <mt-badge type="error">10</mt-badge>
                    <img slot="icon" src="../../assets/talk.png" width="20" height="20">
                </mt-cell>
            </div>
        </div>
        <bar/>
        <router-view />
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';

    export default {
        name: "Messages",
        data() {
            return {
                tTitle: '消息中心',
                ifHome: false
            }
        },
        components: {
            topTitle,
            bar
        }
    }
</script>

<style lang="scss">
    .im-attention-message,.im-read-message {
        text-align: left;
        margin-bottom: 2px;
    }

    .memo {
        margin-right: 7px;
    }

    .im-messages {
        padding-top: 20px;
    }
</style>