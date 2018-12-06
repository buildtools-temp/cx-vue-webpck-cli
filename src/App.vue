<template>
  <div id="app">
    <img src="./assets/logo.png">
    <router-view/>
    <h1 @click="login()">登录</h1>
    <h1 @click="clickGET()">测试GET</h1>
    <h1 @click="clickPOST()">测试POST</h1>
    <h1 class="testh1">testh1</h1>
  </div>
</template>

<script>
  import qs from 'querystring';
  import insertService from './insertService'

  export default {
    name: 'App',
    created() {
      let a = [1, 2, 3];
      let b = [1, 2, 3];
      console.log([...a, ...b]);
      const InsertService = new insertService();
      InsertService.insert();
    },
    methods: {
      login() {
        console.log('login')
        this.$fetch({
            url: '/oauth/login',
            method: 'post',
            data: {
              username: "test-name",
              password: "LXgbEFC8kna7yznMVtmheA==",
              sex: 2
            },
            transformRequest: [function (data) {
              data = qs.stringify(data);
              console.log('登录请求发送前数据处理，处理结果：————' + data);
              return data;
            }]
          }
        ).then(res => {
          console.log(res);
        });
      },
      clickGET() {
        this.$fetch(
          {
            url: '/test/get',
            method: 'get',
            data: {
              name: 'get-name'
            },
          }
        ).then(res => {
          console.log(res);
        });
      },
      clickPOST() {
        this.$fetch(
          {
            url: '/test/post',
            method: 'post',
            data: {
              name: 'post-name'
            },
          }
        ).then(res => {
          console.log(res);
        });
      }
    }
  }

</script>

<style rel="stylesheet/scss" lang="scss">
  @import "assets/style";

  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
</style>
