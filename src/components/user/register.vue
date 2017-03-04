<template>
<div v-show="showFlag" class="register">
  <div class="registerHeader">
    <div class="warpper">
      <i class="icon-arrow_lift" v-on:click="hide"></i>
      <div class="title">注册</div>
    </div>
  </div>
  <div class="registerContent">
    <div class="registerWarpper">
      <input class="username" type="text" placeholder="请输入手机号码" v-model="username">
      <i></i>
      <input class="password" type="password" placeholder="请输入由英文字母与数字组成的6~10位密码" v-model="password">
    </div>
    <button type="button" class="registerButton" @click="_doregister">保存</button>
  </div>
</div>
</template>

<script>
  export default {
    data() {
      return {
        showFlag: false,
        username: '',
        password: ''
      };
    },
    methods: {
      show() {
        this.showFlag = true;
      },
      hide() {
        this.showFlag = false;
      },
      _doregister() {
        var username = this.username;
        var password = this.password;
        // 验空
        if (username && password) {
            // 是否符合规格（手机号）
            if (/^1[3|4|5|8][0-9]\d{4,8}$/.test(username) && username.length === 11) {
              if (/^[a-zA-Z0-9]{6,10}$/.test(password)) {
                console.log({username: username, password: password});
                this.$http.post('/auth/doRegister', {username: username, password: password}).then(function(response) {
                  if (response.data.staus === 200) {
                    console.log(response.data.result);
                    this.hide();
                  } else {
                    console.log(response.data.result);
                  }
                });
              } else {
                /* eslint-disable no-undef */
                alert('请输入由英文字母与数字组成的6~10位密码');
              }
            } else {
              /* eslint-disable no-undef */
              alert('请输入正确手机号');
            }
        } else {
          /* eslint-disable no-undef */
          alert('填写信息不完整');
        }
        this.hide();
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .register
    position: fixed
    top: 0
    left: 0
    background: #fafafa
    width: 100%
    height: 100%
    font-size: 0
    .registerHeader
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
          left: 45px
          right: 45px
          display: inline-block
          font-weight: 700
          text-align: center
          color: #4d4d4d
        span
          float: right
    .registerContent
      width: 100%
      box-sizing: border-box
      padding: 150px 16px
      .registerWarpper
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
      .registerButton
        margin-top: 24px
        width: 100%
        height: 50px
        border-radius: 5px
        border: 0
        outline: none
        background: #367cff
        color: #fff

</style>