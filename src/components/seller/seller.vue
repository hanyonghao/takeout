<template>
  <div>
    <v-header v-bind:seller="seller"></v-header>
    <div class="seller-tab">
      <div class="seller-tab-item">
        <router-link :to="{path: '/seller/' + $route.params.id + '/goods'}">商品</router-link>
      </div>
      <div class="seller-tab-item">
        <router-link :to="{path: '/seller/' + $route.params.id + '/ratings'}">评论</router-link>
      </div>
      <div class="seller-tab-item">
        <router-link :to="{path: '/seller/' + $route.params.id + '/sellerdsc'}">商家</router-link>
      </div>
    </div>
    <router-view v-bind:goods="goods" v-bind:seller="seller" keep-alive></router-view>
  </div>
</template>

<script>
import header from 'components/seller/header/header.vue';
import Vue from 'vue';
export default{
  data() {
    return {
        goods: {},
        seller: {}
    };
  },
  mounted() {
    let self = this;
      self.$http.get('/goods/getSellerAndGoods?seller_id=' + self.$route.params.id).then((response) => {
        self.seller = response.data.goods[0].seller_id;
        setTimeout(function() {
          self.goods = response.data.goods;
          /* eslint-disable no-undef */
          let localShopCartData = localStorage.getItem(self.seller._id);
          localShopCartData = JSON.parse(localShopCartData);
          if (Array.isArray(localShopCartData) && localShopCartData.length > 0) {
            response.data.goods.forEach(goods => {
              goods.foods.forEach(food => {
                localShopCartData.forEach(localfood => {
                  if (localfood._id === food._id) {
                    Vue.set(food, 'count', localfood.count);
                  }
                });
              });
            });
          }
        }, 500);
      });
  },
  components: {
    'v-header': header
  }
};
</script>

<style lang="stylus" rel="stylesheet/stylus">
  @import "../../common/stylus/mixin"

    .seller-tab
      display: flex
      width: 100%
      height: 40px
      line-height: 40px
      border-1px(rgba(7, 17, 27, 0.1))
      background: white
      .seller-tab-item
        flex: 1
        text-align:center
        & > a
          display:block
          font-size:14px
          color: rgb(77, 85, 93)
          &.router-link-active
            color: rgb(240, 20, 20)

</style>
