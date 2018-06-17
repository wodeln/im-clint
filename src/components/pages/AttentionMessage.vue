<template>
    <div class="page">
        <top-title :tTitle="tTitle,ifHome"/>
        <div class="page-content">
            <div class="im-attention">
                <router-link
                v-for="attention in attentionData"
                :to="{name:'user-info',params: { id: attention.hs_id }}"
                :key="attention.hs_id">
                <mt-cell class="im-attention-message" :title="attention.user_name">
                    <span class="memo">{{attention.attention_time}}关注了你</span>
                    <img slot="icon" :src="attention.avatar">
                </mt-cell>
                </router-link>
            </div>
        </div>
        <bar />
    </div>
</template>

<script>
    import topTitle from '@/components/common/TopTitle';
    import bar from '@/components/common/Bar';
    import attention from '../../json/attention.json';
    export default {
        name: "AttentionMessage",
        data(){
            return{
                tTitle:'新关注',
                ifHome:false,
                attentionData:attention
            }
        },
        components:{
            topTitle,
            bar
        }
    }
</script>

<style lang="scss">
    .im-attention{
        padding-top: 10px;
        .im-attention-message{
            img{
                width: 20%;
                border: 2px solid #eee;
                border-radius: 50%;
            }
        }
    }
</style>