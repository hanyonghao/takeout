<template>
<div class="editorAdderss">
  <div class="editorAddress-header">
    <div class="header-wrapper">
      <i class="icon-arrow_lift" v-on:click="hide"></i>
      <div class="title" v-text="type === 'add' ? '新增地址' : '编辑地址'"></div>
    </div>
  </div>
  <div class="editorAddress-content">
    <div class="content-wrapper">
      <div class="username editorAddress-group">
        <span class="editorAddress-label" style="display: block;height: 50px;width: 78px;background: white">联系人：</span>
        <input class="editorAddress-input" placeholder="您的姓名" v-model="form.username">
      </div>
      <div class="sex editorAddress-group">
        <div class="editorAddress-checkbox">
          <i v-bind:class="checkboxClass('先生')" v-on:click="checked('先生')"></i>
          <span>先生</span>
        </div>
        <div class="editorAddress-checkbox">
          <i v-bind:class="checkboxClass('女士')" v-on:click="checked('女士')"></i>
          <span>女士</span>
        </div>
      </div>
      <div class="phone editorAddress-group">
        <span class="editorAddress-label">手机号：</span>
        <input class="editorAddress-input" placeholder="配送人员联系您的电话" v-model.number="form.phone">
      </div>
      <div class="address editorAddress-group">
        <span class="editorAddress-label">配送地址：</span>
        <input class="editorAddress-input" placeholder="您的收货地址" v-model="form.address">
      </div>
    </div>
    <div class="btn-change" v-if="type === 'change'">
      <button type="button" class="change" @click="change">保存修改</button>
      <button type="button" class="delete" @click="delect">删除该地址</button>
    </div>
    <div class="btn-add" v-if="type === 'add'">
      <button type="button" class="save" @click="add">保存</button>
    </div>
  </div>
</div>
</template>

<script>
  export default {
    data() {
      return {
        type: '',
        form: {
          username: '',
          sex: '',
          phone: undefined,
          address: ''
        }
      };
    },
    props: {
      address: {
        type: Object
      }
    },
    mounted() {
      console.log(1200001, this.address);
      if (Object.keys(this.address).length > 0) {
        this.type = 'change';
        this.form.username = this.address.name;
        this.form.sex = this.address.sex;
        this.form.phone = this.address.phone;
        this.form.address = this.address.address;
      } else {
        this.type = 'add';
      }
    },
    methods: {
      hide() {
        this.$parent.currentAdress = null;
      },
      checked(sex) {
        this.form.sex = sex;
      },
      checkboxClass(sex) {
        return {
          'icon-check_circle': true,
          'checked': this.form.sex === sex
        };
      },
      change() {
        let self = this;
        let updateData = {
          _id: this.address._id,
          name: this.form.username,
          user_id: this.address.user_id,
          phone: this.form.phone,
          sex: this.form.sex,
          address: this.form.address
        };
        if (updateData.phone && this.isPhone(updateData.phone)) {
          console.log(updateData);
          self.$http.post('/address/updateAddress', {address: updateData}).then(function(response) {
            this.$parent.refresh();
            this.hide();
          });
        } else {
          /* eslint-disable no-undef */
          alert('请输入正确手机号');
        }
      },
      add() {
        let self = this;
        let addData = {
          name: this.form.username,
          user_id: window.user._id,
          phone: this.form.phone,
          sex: this.form.sex,
          address: this.form.address
        };
        if (addData.phone && this.isPhone(addData.phone)) {
          console.log(123445675423421322, addData);
          self.$http.post('/address/addAddress', {address: addData}).then(function(response) {
            this.$parent.refresh();
            this.hide();
          });
        } else {
          /* eslint-disable no-undef */
          alert('请输入正确手机号');
        }
      },
      delect() {
        let self = this;
        let addressid = self.address._id;
        console.log(1000008, addressid);
        self.$http.post('/address/delectAddress', {addressid: addressid}).then(function(response) {
          this.$parent.refresh();
          this.hide();
        });
      },
      isPhone(phone) {
        return /^1[3|4|5|8][0-9]\d{4,8}$/.test(phone);
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .editorAdderss
    position: fixed
    top: 0
    left: 0
    width: 100%
    height: 100%
    background: #fff
    .editorAddress-header
      width: 100%
      height: 75px
      box-sizing: border-box 
      padding: 34px 15px 0 15px
      background: #ff2d4b
      .header-wrapper
        position: relative
        width: 100%
        font-size: 14px
        line-height: 14px
        color: #fff
        .title
          position: absolute
          left: 45px
          right: 45px
          display: inline-block
          font-weight: 700
          text-align: center
        i
          float: left
    .editorAddress-content
      padding: 16px 15px
      .content-wrapper
        .editorAddress-group
          height: 48px
          line-height: 48px
          padding-left: 78px
          position: relative
          font-size: 14px
          border-bottom: 1px solid #ddd
          .editorAddress-label
            position: absolute
            top: 0
            left: 0
            font-weight: 700
            line-height: 48px
            font-size: 14px
          .editorAddress-input
            width: 100%
            height: 100%
            border: none
            outline: none
          .editorAddress-checkbox
            display: inline-block
            i.icon-check_circle
              color: #d2d2d7
              &.checked
                color: #ff2d4b  
      .save
        margin: 16px 0
        width: 100%
        height: 38px
        text-align: center
        color: #fff
        background: #ff2b4d
        border: 0
        border-radius: 5px
        outline: none
      .delete
        width: 100%
        height: 38px
        text-align: center
        color: #ff2b4d
        background: #fff
        border: 1px solid #ff2b4d
        border-radius: 5px
        outline: none
      .change
        margin: 16px 0
        width: 100%
        height: 38px
        text-align: center
        color: #fff
        background: #ff2b4d
        border: 0
        border-radius: 5px
        outline: none


</style>