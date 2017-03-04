<template>
  <div class="collect">
    <div class="header">
      <div class="warpper">
        <router-link class="icon-arrow_lift" :to="{path: '/me'}">
        <div class="title">我的收藏</div>
      </div>
    </div>
    <div class="collect-wrapper" ref="collect">
      <div class="collect-detail">
        <div class="collect-content" v-for="collect in collects">
          <v-sellerlist v-bind:seller="collect.seller_id"></v-sellerlist>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BScroll from 'better-scroll';
import sellerlist from 'components/sellerlist/sellerlist';
export default{
  data() {
    return {
      collects: []
    };
  },
  mounted() {
    let self = this;
    let userid = window.user._id;
    self.$http.post('/collect/getUserCollectByUserID', {userid: userid}).then(function(response) {
      console.log(33333000002, response);
      self.collects = response.data.collect;
      console.log(33333300003, self.collects);
    });
    setTimeout(function() {
      self.scroll = new BScroll(self.$refs.collect, {
        click: true
      });
    }, 100);
  },
  components: {
      'v-sellerlist': sellerlist
  }
};
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .collect
    .header
      box-sizing: border-box 
      padding: 34px 15px 0 15px
      .warpper
        width: 100%
        font-size: 14px
        line-height: 14px
        color: #fff
        .title
          position: absolute
          top: 34px
          left: 45px
          right: 45px
          display: inline-block
          font-weight: 700
          text-align: center
          color: #fff
        span
          float: right
        a
          float: left
          color: #fff
    .collect-wrapper
      position: absolute
      top: 75px
      left: 0
      bottom: 0
      width: 100%
      overflow: hidden



</style>