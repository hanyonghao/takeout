<template>
<div class="content">
  <div class="home" ref="home">
    <div class="home-warrper">
      <div class="swipe-warrper">
        <v-swiper></v-swiper>
        <div class="tool">
          <div class="address">
            <span>送至：</span>
            <span class="adde">{{location}}</span>
            <i class="icon-drop_down"></i>
          </div>
          <div class="home-search">
            <i class="icon-search"></i>
            <span v-on:click="search">搜索</span>
          </div>
        </div>
      </div>
      <div class="species">
        <div class="species-warrper" v-for="specie in species" >
          <router-link :to="{path: '/variety/' + specie.type}">
            <img style="width: 44px;" :src="specie.src"></i>
            <p v-text="specie.text"></p>
          </router-link>
        </div>
      </div>
      <split></split>
      <div class="seller-warrper" >
      <div class="title border-1px">全部商户</div>
        <div class="seller" v-if="sellers.length > 0">
          <ul v-if="sellers">
            <li class="seller-list border-1px" v-for="seller in sellers">
              <v-sellerlist v-bind:seller="seller"></v-sellerlist>
            </li>
          </ul>
        </div>
        <div class="data-loader-home" v-else></div>
      </div>
    </div>
  </div>
  <v-navigation></v-navigation>
  <v-search ref="search"></v-search>
</div>
</template>

<script>
  import BScroll from 'better-scroll';
  import split from 'components/split/split';
  import swiper from 'components/home/swiper/swiper';
  import navigation from 'components/navigation/navigation';
  import star from 'components/star/star';
  import sellerlist from 'components/sellerlist/sellerlist';
  import search from 'components/home/search/search';
  export default{
    mounted() {
      console.dir(this.$refs.home);
      let self = this;
      self.$http.get('/seller/getAll').then((response) => {
        console.log(response.data.sellers);
        setTimeout(function() {
          self.sellers = response.data.sellers;
          setTimeout(function() {
            self.scroll = new BScroll(self.$refs.home, {
              click: true
            });
          }, 100);
        }, 500);
      });
      this.getCityPosition();
    },
    methods: {
      getCityPosition() {
        var self = this;
        /* eslint-disable no-undef */
        var geolocation = new BMap.Geolocation();
        /* eslint-disable no-undef */
        var gc = new BMap.Geocoder();
        geolocation.getCurrentPosition(function(r) {
          /* eslint-disable no-undef */
          if (this.getStatus() === BMAP_STATUS_SUCCESS) {
            var pt = r.point;
            gc.getLocation(pt, function(rs) {
              var addComp = rs.addressComponents;
              self.location = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
              console.log('定位成功:', addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber);
            });
          } else {
              console.log('定位错误码:', this.getStatus());
          }
        }, {enableHighAccuracy: true});
      },
      search(event) {
        console.log(123);
        this.$refs.search.show();
      }
    },
    data() {
        return {
            sellers: {},
            location: '',
            species: [
              {
                src: 'https://fuss10.elemecdn.com/b/7e/d1890cf73ae6f2adb97caa39de7fcjpeg.jpeg',
                text: '美食',
                type: 0
              },
              {
                src: 'https://fuss10.elemecdn.com/2/35/696aa5cf9820adada9b11a3d14bf5jpeg.jpeg',
                text: '甜品饮品',
                type: 5
              },
              {
                src: 'https://fuss10.elemecdn.com/8/83/171fd98b85dee3b3f4243b7459b48jpeg.jpeg',
                text: '鲜花蛋糕',
                type: 6
              },
              {
                src: 'https://fuss10.elemecdn.com/4/34/ea0d51c9608310cf41faa5de6b8efjpeg.jpeg',
                text: '蔬果新鲜',
                type: 7
              },
              {
                src: 'https://fuss10.elemecdn.com/1/c6/8edcaeb8cd35845946db6673660fcjpeg.jpeg',
                text: '商店超市',
                type: 8
              }
            ]
        };
    },
    components: {
      split,
      'star': star,
      'v-swiper': swiper,
      'v-navigation': navigation,
      'v-sellerlist': sellerlist,
      'v-search': search
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
 @import "../../common/stylus/mixin";
  .home
    position: fixed
    top: 0
    left: 0
    right: 0
    bottom: 0
    .swipe-warrper
      font-size: 0
      .tool
        position: absolute
        top: 32px
        left: 90px
        right: 10px
        height: 24px
        font-weight: 700

        .address
          position: absolute
          left: 0
          right: 82px
          font-size: 14px
          overflow: hidden
          text-overflow:ellipsis
          white-space: nowrap
          border-radius: 25px
          background-color: rgba(7, 17, 27, 0.3)
          line-height: 24px
          color: #fff
          padding: 0 10px 0 16px

          .icon-drop_down
            width: 24px
            text-align: center
            display: block
            line-height: 24px
            position: absolute
            top: 0
            right: 0
            font-size: 10px
            color: #fff

        .home-search
          width: 74px
          height: 24px
          border-radius: 25px
          background-color: rgba(7, 17, 27, 0.3)
          line-height: 24px
          color: #fff
          font-size: 14px
          text-align: center
          position: absolute
          top: 0
          right: 0

    .species
      display: flex
      box-sizing: border-box
      width: 100%
      padding: 22px 14px
      .species-warrper
        flex: 1
        display: inline-block
        text-align: center
        i
          font-size: 44px
          line-height: 44px
          color: #ff5656
        p
          padding-top: 10px
          font-size: 12px
          line-height: 12px

    .seller-warrper
      .title
        box-sizing: border-box
        width: 100%
        height: 42px
        padding-left: 10px
        font-size: 13px
        line-height: 42px
        color: #a9a9a9
        border-1px(rgba(7, 17, 27, 0.1))
      .seller
        padding-bottom: 50px
      .data-loader-home
        width: 100%
        height: 400px
        background: url('../../common/loading.gif') center no-repeat
</style>
