<template>
    <router-view />
</template>

<script>

    export default {
        name: 'App',
        components: {

        },
        created:function () {
            console.log("323");
        },
        mounted:function () {
            console.log("mounted");
        }
    }
</script>

<style>
    #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
    }
    a{
        text-decoration: none;
        color: black;
    }
    .router-link-active {
        text-decoration: none;
        color: black;
    }
</style>
