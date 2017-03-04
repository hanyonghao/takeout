<template>
  <div class="variety">
    <div class="variety-wrapper">
      <div class="varietyHeader">
        <router-link class="icon-arrow_lift" :to="{path: '/home'}"></router-link>
        <div class="title">{{title}}</div>
      </div>
      <div class="varietNat" v-if="$route.params.type === '0'">
        <div class="varietNat-warpper" ref="natwrapper">
          <div class="nat-list" ref="natlist">
            <div :class="_natItemClass(index)" v-for="(variety, index) in varietys" @click="_selectNatItem(index)">
              <span v-text="variety.text"></span>
            </div>
            <div class="variet-line" :style="underLineStyle"></div>
          </div>
        </div>
      </div>
    </div>
    <v-sellers v-bind:sellers="currentSellers" v-if="sellers"></v-sellers>
    <div class="data-loader-variety" v-else></div>
  </div>
</template>

<script>
  import BScroll from 'better-scroll';
  import sellers from 'components/home/variety/sellers.vue';
  export default{
    data() {
      return {
        sellers: {},
        title: '',
        subType: 0,
        varietys: [
          {
            text: '全部',
            type: -1
          },
          {
            text: '小吃快餐',
            type: 1
          },
          {
            text: '粥粉面',
            type: 2
          },
          {
            text: '日韩料理',
            type: 3
          },
          {
            text: '西式快餐',
            type: 4
          }
        ]
      };
    },
    computed: {
      underLineStyle() {
        let variety = this.varietys[this.subType];
        return {
          width: variety.text.length * 12 + 'px',
          left: this.subType * 76 + ((76 - variety.text.length * 12) / 2) + 'px'
        };
      },
      currentSellers() {
        let self = this;
        if (self.subType === 0) {
          return self.sellers;
        } else {
          return self.sellers.filter(item => {
            return item.sellerType === self.subType;
          });
        }
      }
    },
    mounted() {
      let self = this;
      if (self.$route.params.type === '0') {
        self.$http.get('/seller/getSellerByTypes').then((response) => {
          console.log(response.data.sellers);
          self.sellers = response.data.sellers;
          self._initNat();
        });
      } else {
        self.$http.get('/seller/getSellerByType?seller_type=' + self.$route.params.type).then((response) => {
          console.log(response.data.sellers);
          self.sellers = response.data.sellers;
        });
      }
      let type = parseInt(self.$route.params.type);
      switch (type) {
        case 0:
          this.title = '美食';
          break;
        case 5:
          this.title = '甜品饮品';
          break;
        case 6:
          this.title = '鲜花蛋糕';
          break;
        case 7:
          this.title = '蔬果新鲜';
          break;
        case 8:
          this.title = '商店超市';
          break;
      }
    },
    methods: {
      _initNat() {
        if (this.varietys) {
          let natWidth = 76;
          let width = natWidth * this.varietys.length;
          this.$refs.natlist.style.width = width + 'px';
          this.$nextTick(() => {
            if (!this.natScroll) {
              this.natScroll = new BScroll(this.$refs.natwrapper, {
                scrollX: true,
                eventPassthrough: 'vertical'
              });
            } else {
              this.natScroll.refresh();
            }
          });
        }
      },
      _natItemClass(index) {
        return {
          'nat-item': true,
          'nat-item-active': this.subType === index
        };
      },
      _selectNatItem(index) {
          this.subType = index;
      }
    },
    components: {
      'v-sellers': sellers
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .variety
    position: fixed
    top: 0
    left: 0
    right: 0
    bottom: 0
    width: 100%
    height: 100%
    .varietyHeader
      box-sizing: border-box 
      padding: 20px 15px 0 15px
      width: 100%
      height: 50px
      background-color: #ff2d4b
      color: #fff
      border-bottom: 1px solid rgba(7, 17, 27, 0.1)
      .title
        position: absolute
        top: 20px
        left: 45px
        right: 45px
        display: inline-block
        font-weight: 700
        text-align: center
      a
        color: #fff
    .varietNat
      width: 100%
      height: 26px
      box-sizing: border-box
      .varietNat-warpper
        width: 100%
        white-space: nowrap
        .nat-list
          position: relative
          font-size: 0
          .nat-item
            display: inline-block
            width: 76px
            line-height: 26px
            font-size: 12px
            text-align: center
            &.nat-item-active
              color: #ff2d4b
            span
              transition: all 0.3s
          .variet-line
            transition: all 0.3s
            width: 76px
            position: absolute
            bottom: -3px
            left: 0
            border-bottom: 2px solid #ff2d4b
    .data-loader-variety
      width: 100%
      height: 400px
      background: url('../../../common/loading.gif') center no-repeat

</style>