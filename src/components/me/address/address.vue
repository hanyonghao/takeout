<template>
<div>
  <div class="address">
    <div class="header">
      <div class="wrapper">
        <router-link :to="{path: '/me'}" class="icon-arrow_lift"></router-link>
        <div class="title">我的收货地址</div>
        <span v-on:click="addAddress">新增</span>
      </div>
    </div>
    <div class="address-warrper">
      <ul>
        <li class="address-list border-1px" v-for="address in addresses" v-on:click="changeAddress(address)">
          <div class="des">{{address.address}}</div>
          <div class="contact">
            <span class="name">{{address.name}}</span>
            <span class="sex">{{address.sex}}</span>
            <span class="phone">{{address.phone}}</span>
          </div>
          <i class="icon-keyboard_arrow_right"></i>
        </li>
      </ul>
    </div>
  </div>
  <v-editorAddress  v-bind:address="currentAdress" v-if="currentAdress"></v-editorAddress>
</div>
</template>

<script>
import editorAddress from 'components/me/address/editorAddress';

export default{
  data() {
    return {
      addresses: [],
      currentAdress: null
    };
  },
  mounted() {
    this.refresh();
  },
  methods: {
    addAddress() {
      this.currentAdress = {};
    },
    changeAddress(address) {
      this.currentAdress = address;
      console.log('address', this.currentAdress);
    },
    refresh() {
      console.log(1234567, window.user);
      let self = this;
      let userid = window.user._id;
      self.$http.post('/address/getUserAddress', {userid: userid}).then(function(response) {
        console.log(1234567890, response);
        self.addresses = response.data.address;
        console.log(1234567890, self.addresses);
      });
    }
  },
  components: {
      'v-editorAddress': editorAddress
  }
};
</script>

<style lang="stylus" rel="stylesheet/stylus">
@import "../../../common/stylus/mixin";
  .address
    .header
      box-sizing: border-box 
      padding: 34px 15px 0 15px
      .wrapper
        width: 100%
        font-size: 14px
        line-height: 14px
        color: #fff
        .title
          display: inline-block
          font-weight: 700
          text-align: center
        span
          float: right
        a
          float: left
          color: #fff
    .address-list
      position: relative
      width: 100%
      height: 92px
      box-sizing: border-box
      padding: 33px 15px 19px 15px
      border-1px(rgba(7, 17, 27, 0.2))
      .des
        width: 80%
        font-size: 16px
        font-weight: 700
        white-space: nowrap
        overflow: hidden
        text-overflow: ellipsis
        color: #333
      .contact
        padding-top: 10px
        font-size: 0
        span
          font-size: 14px
          color: #919191
        .name
          padding-right: 5px
        .sex
          padding-right: 12px
      i
        position: absolute
        right: 21px
        top: 40px
        font-size: 30px
        color: #bababa

</style>