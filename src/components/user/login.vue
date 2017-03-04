<template>
<div class="login">
  <div class="loginHeader">
    <div class="warpper">
      <router-link class="icon-arrow_lift" :to="{path: '/home'}"></router-link>
      <div class="title">登录</div>
      <span v-on:click="register">注册</span>
    </div>
  </div>
  <div class="loginContent" @keydown.enter="_doLogin">
    <div class="loginWarpper">
      <input class="username" type="text" placeholder="用户名" v-model.number="username">
      <i></i>
      <input class="password" type="password" placeholder="密码" v-model="password">
    </div>
    <button type="button" class="loginButton" @click="_doLogin">登录</button>
  </div>
  <v-register ref="register"></v-register>
</div>
</template>

<script>
import register from 'components/user/register';

export default{
  data() {
    return {
      username: '',
      password: ''
    };
  },
  methods: {
    register(event) {
      console.log(123);
      this.$refs.register.show();
    },
    _doLogin() {
      var username = this.username;
      var password = this.password;
      if (username && password) {
        console.log(username, /^1[3|4|5|8][0-9]\d{4,8}$/.test(username));
        if (/^1[3|4|5|8][0-9]\d{4,8}$/.test(username)) {
          console.log({username: username, password: password});
          this.$http.post('/auth/doLogin', {username: username, password: password}).then(function(response) {
            if (response.data.status === 200) {
              console.log(response.data.result);
              window.location.href = '/';
            } else {
              console.log(response.data.result);
            }
          });
        } else {
          /* eslint-disable no-undef */
          alert('请输入正确手机号');
        }
      } else {
          /* eslint-disable no-undef */
          alert('填写信息不完整');
      }
    }
  },
  components: {
      'v-register': register
  }
};
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .login
    position: fixed
    top: 0
    left: 0
    background: #fafafa
    width: 100%
    height: 100%
    font-size: 0
    .loginHeader
      box-sizing: border-box
      padding: 34px 15px 0 15px
      width: 100%
      height: 75px
      border-bottom: 1px solid rgba(7, 17, 27, 0.1)
      background: #fff
      .warpper
        width: 100%
        font-size: 14px
        line-height: 14px
        color: #ff0000
        .title
          position: absolute
          top: 34px
          left: 60px
          right: 60px
          display: inline-block
          font-weight: 700
          text-align: center
          color: #4d4d4d
        span
          float: right
        a
          color: #ff2b4d
    .loginContent
      width: 100%
      box-sizing: border-box
      padding: 150px 16px
      .loginWarpper
        border-radius: 12px
        border: 1px solid rgba(7, 17, 27, 0.1)
        input
          display: block
          box-sizing: border-box
          padding: 20px
          width: 100%
          height: 50px
          font-size: 12px
          line-height: 12px
          border-radius: 12px
          outline: none
        i
          width: 100%
          display: block
          border-bottom: 1px solid rgba(7, 17, 27, 0.1)
      .loginButton
        margin-top: 24px
        width: 100%
        height: 50px
        border-radius: 5px
        border: 0
        outline: none
        background: #367cff
        color: #fff



</style>
