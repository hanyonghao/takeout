<template>
<div class="addorder">
  <div class="addorder-header">
    <div class="header-wrapper">
      <i class="icon-arrow_lift" v-on:click="hide">
      <div class="title">提交订单</div>
    </div>
  </div>
  <div class="addorder-content" ref="addroder">
    <div class="addorderCcontent-wrapper">
      <div class="addorder-group">
        <div class="addorder-item">
          <i class="icon-left icon-address"></i>
          <div class="addorder-wrapper" v-on:click="selectaddress">
            <div class="useraddress" v-if="userAddress">
              <div class="addorder-title">{{userAddress.address}}</div>
              <div class="addorder-description">
                <span>{{userAddress.name}}</span>
                <span>{{userAddress.sex}}</span>
                <span>{{userAddress.phone}}</span>
              </div>
            </div>
            <div class="addorder-title" v-if="!userAddress">
              <span>请添加地址</span>
            </div>
          </div>
          <i class="icon-right icon-keyboard_arrow_right"></i>
        </div>
        <div class="addorder-item">
          <i class="icon-left icon-shopping_cart"></i>
          <div class="addorder-wrapper">
            <div class="addorder-text">{{seller.description}}</div>
          </div>
          <i class="icon-right icon-keyboard_arrow_right"></i>
        </div>
        <div class="addorder-item">
          <i class="icon-left icon-order"></i>
          <div class="addorder-wrapper">
            <div class="addorder-text">现金支付</div>
          </div>
          <i class="icon-right icon-keyboard_arrow_right"></i>
        </div>
      </div>
      <div class="orderdsc">
        <div class="orderdsc-item">
          <i class="icon-left icon-home"></i>
          <div class="orderdsc-wrapper">
            <div class="orderdsc-title">{{seller.name}}</div>
            <div class="orderdsc-description">
              <div class="foodlist">
                <ul v-for="food in currentFoods">
                  <li>
                    <div class="foods">
                      <span class="foodname">{{food.name}}</span>
                      <span class="number">X{{food.count}}</span>
                      <span class="price">￥{{(food.price*food.count).toFixed(2)}}</span>
                    </div>
                  </li>
                </ul>
              </div>
              <div class="delivery">
                <span class="deliveryname">配送费</span>
                <span class="deliveryprice">￥{{seller.deliveryPrice}}元</span>
              </div>
              <div class="orderPay">共需支付￥{{(totalPrice + deliveryPrice).toFixed(2)}}元</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="confirm">
    <div class="text" @click="confirm">确认订单</div>
  </div>
  <v-selectAddress ref="selectaddress"></v-selectAddress>
</div>
</template>
<script>
  import BScroll from 'better-scroll';
  import selectAddress from 'components/order/selectAddress';
  export default{
    props: {
      currentFoods: {
        type: Array,
        default: 0
      },
      totalPrice: {
        type: Number,
        default: 0
      },
      deliveryPrice: {
        type: Number,
        default: 0
      },
      seller: {}
    },
    data() {
      return {
        addresses: {
          type: Object
        },
        userAddress: null
      };
    },
    mounted() {
      this.refresh();
    },
    methods: {
      refresh() {
        let self = this;
        let userid = window.user._id;
        self.$http.post('/address/getUserAddress', {userid: userid}).then(function(response) {
          console.log(1234567890, response);
          self.addresses = response.data.address;
          console.log(1234567890, self.addresses);
          if (self.addresses) {
            self.userAddress = self.addresses[0];
            console.log('userAddress1', self.userAddress);
          }
          self.scroll = new BScroll(self.$refs.addroder, {
            click: true
          });
        }, 100);
      },
      hide() {
        this.$parent.currentFoods = null;
      },
      selectaddress() {
        this.$refs.selectaddress.show();
      },
      confirm() {
        console.log('seller', this.seller);
        console.log('currentFoods', this.currentFoods);
        console.log('userAddress', this.userAddress);
        console.log('user', window.user);
        let orderTime = new Date().getTime();
        let sumPrice = (this.totalPrice + this.deliveryPrice).toFixed(2);
        console.log('sumPrice', sumPrice);
        let addData = {
          seller_id: this.seller._id,
          user_id: window.user._id,
          orderTime: orderTime,
          sumPrice: sumPrice,
          address: this.userAddress.name + ' ' + this.userAddress.sex + ' ' + this.userAddress.phone + '\n\r' + this.userAddress.address,
          status: 0,
          deliveryTime: 0,
          foods: this.currentFoods.map(item => {
            return {
              name: item.name,
              count: item.count,
              price: item.price
            };
          })
        };
        this.$http.post('/order/addOrder', {order: addData}).then(function(response) {
          this.$parent.empty();
          window.location.href = '#/order';
        });
        console.log('addData', addData);
      }
    },
    components: {
      'v-selectAddress': selectAddress
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">

  .addorder
    position: fixed
    top: 0
    left: 0
    background: #f5f5f5
    width: 100%
    height: 100%
    font-size: 0
    z-index: 10000
    .addorder-header
      box-sizing: border-box
      padding: 34px 15px 0 15px
      width: 100%
      height: 70px
      background: #f5f5f5
      .header-wrapper
        width: 100%
        font-size: 18px
        line-height: 18px
        .title
          position: absolute
          top: 34px
          left: 45px
          right: 45px
          display: inline-block
          font-weight: 700
          text-align: center
          color: #636363
        i
          color: #636363
    .addorder-content
      position: absolute
      top: 70px
      bottom: 50px
      width: 100%
      box-sizing: border-box
      padding: 0 10px 20px 10px
      .addorder-group
        background: #fff
        border-radius: 8px
        padding-left: 44px
        .addorder-item
          position: relative
          border-bottom: 1px solid #ccc
          padding-right: 20px
          &:last-child
            border-bottom: none
          .icon-left
            position: absolute
            top: 22px
            left: -30px
            font-size: 16px
            color: #999
          .addorder-wrapper
            padding: 20px 0 10px 0
            .addorder-title
              font-size: 16px
              color: #333
              overflow: hidden
              text-overflow: ellipsis
              white-space: nowrap
            .addorder-text
              font-size: 16px
              color: #333
              margin-bottom: 8px
            .addorder-description
              line-height: 28px
              font-size: 14px
              color: #999
          .icon-right
            position: absolute
            top: 50%
            right: 5px
            margin-top: -8px
            font-size: 16px
            color: #999
      .orderdsc
        background: #fff
        border-radius: 8px
        padding-left: 44px
        .orderdsc-item
          position: relative
          border-bottom: 1px solid #ccc
          margin-top: 10px
          &:last-child
            border-bottom: none
          .icon-left
            position: absolute
            top: 20px
            left: -30px
            font-size: 16px
            color: #999
          .orderdsc-wrapper
            padding: 20px 0 10px 0
            .orderdsc-title
              font-size: 16px
              padding-bottom: 10px
              color: #333
              border-bottom: 1px solid #ccc
            .orderdsc-description
              line-height: 28px
              font-size: 14px
              color: #999
              .foodlist
                border-bottom: 1px dashed #ccc
                .foods
                  padding-right: 10px
                  display: flex
                  .foodname
                    flex: 1
                  .number, .price
                    flex: 0 0 50px
                    text-align: center
              .delivery
                display: flex
                border-bottom: 1px dashed #ccc
                padding: 10px 10px 10px 0
                .deliveryname
                  flex: 1
                .deliveryprice
                  flex: 0 0 50px
                  text-align: center
              .orderPay
                padding: 10px
                font-size: 14px
                text-align: right
                color: #333
    .confirm
      position: fixed
      left: 0
      bottom: 0
      width: 100%
      height: 50px
      background: #fff
      .text
        width: 132px
        height: 100%
        float: right
        font-size: 14px
        font-weight: 700
        line-height: 50px
        text-align: center
        background: #ff2d4b
        color: #fff








</style>
