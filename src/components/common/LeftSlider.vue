<template>
    <div class="left-slider" v-show="ifShow">
        <mt-cell class="im-left-cell">
            <div class="im-user-avatar">
                <span></span>
                <img v-lazy="imgUrl">
            </div>
        </mt-cell>
        <mt-cell class="im-left-cell">
            <div class="im-user-avatar">
                <span></span>
                <img v-lazy="imgUrl">
            </div>
        </mt-cell>
    </div>

</template>

<script>
    export default {
        name: "LeftSlider",
        data(){
            return{
                imgUrl:'/static/images/xgg.jpg',
                ifShow:true
            }
        }
    }
</script>

<style lang="scss">
    .left-slider{
        width: 35px;
        position: fixed;
        top: 0;
        right: 0;
        top:50px;
        background-color: #4A4A4A;
        overflow: auto;
        padding-left: 3px;
        border-top-left-radius: 3px;
        border-bottom-left-radius: 3px;
        .mint-cell{
            background-color: transparent;
            margin: 0;
            min-height: 40px;
        }
        .im-left-cell{
            .mint-cell-wrapper {
                flex-direction: row-reverse;
                padding: 0;
                background-image: none;
            }
            .mint-cell-title {
                overflow: hidden
            }
            .mint-cell-value {
                width: 70%;
                img {
                    opacity: 0;
                    transition: opacity .5s ease-in;
                    &[lazy="loaded"], &[lazy="error"] {
                        opacity: 1
                    }
                }
                .im-user-avatar {
                    position: relative;
                    width: 100%;
                    float:left;
                    img {
                        display: block;
                        width: 100%;
                        max-width: 100%;
                        border-radius: 50%;
                        border: 2px solid #eee;
                    }
                    span{
                        width: 10px;
                        height: 10px;
                        border-radius: 50%;
                        background-color: red;
                        position: absolute;
                        left: 95%;
                    }
                }
            }
        }
    }
</style>