<template>
<div>
  <div class="goods" v-if="isLoaded">
    <div class="menu-wrapper" ref="menuwrapper">
      <ul>
        <li v-for="(item, index) in goods" class="menu-item" v-bind:class="{'current':currentIndex===index}" v-on:click="selectMenu(index, $event)">
          <span class="text border-1px" >
            <span v-show="item.type>0" class="icon" v-bind:class="classMap[item.type]"></span>{{item.name}}
            </span>
        </li>
      </ul>
    </div>
    <div class="foods-wrapper" ref="foodswrapper">
      <ul>
        <li v-for="item in goods" class="food-list food-list-hook">
          <h1 class="title">{{item.name}}</h1>
          <ul>
            <li v-on:click="selectFood(food,$event)" v-for="food in item.foods" class="food-item border-1px">
              <div class="icon">
                <img v-bind:src="food.icon">
              </div>
              <div class="content">
                <h2 class="name">{{food.name}}</h2>
                <p class="desc">{{food.description}}</p>
                <div class="extra">
                  <span class="count">月售{{food.sellCount}}份</span>
                  <span>好评{{food.rating}}%</span>
                </div>
                <div class="price">
                  <span class="now">￥{{food.price}}</span><span v-show="food.oldPrice" class="old">￥{{food.oldPrice}}</span>
                </div>
                <div class="cartcontrol-wrapper">
                  <cartcontrol v-bind:food="food"></cartcontrol>
                </div>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <shopcart ref="shopcart" v-bind:select-foods="selectFoods" v-bind:delivery-price="seller.deliveryPrice" v-bind:min-price="seller.minPrice" v-bind:seller="seller"></shopcart>
  </div>
  <div class="data-loader-goods" v-else></div>
  <food v-bind:food="selectedFood" ref="food"></food>
</div>
</template>

<script>
  import BScroll from 'better-scroll';
  import shopcart from 'components/seller/shopcart/shopcart';
  import cartcontrol from 'components/seller/cartcontrol/cartcontrol';
  import Vue from 'vue';
  import food from 'components/seller/food/food';

  export default {
    props: ['goods', 'seller'],
    data() {
      return {
        classMap: [],
        listHeight: [],
        scrollY: 0,
        selectedFood: {},
        eventHub: new Vue()
      };
    },
    computed: {
      isLoaded() {
        var self = this;
        let flag = Array.isArray(this.goods) && this.goods.length > 0 && !!this.seller;
        if (flag) {
          setTimeout(function() {
            self._calculateHeight();
            self._initScroll();
          }, 100);
        }
        return flag;
      },
      currentIndex() {
        for (let i = 0; i < this.listHeight.length; i++) {
          let height1 = this.listHeight[ i ];
          let height2 = this.listHeight[ i + 1 ];
          if (!height2 || (this.scrollY >= height1 && this.scrollY < height2)) {
            return i;
          }
        }
        return 0;
      },
      selectFoods() {
        let foods = [];
        if (Array.isArray(this.goods) && this.goods.length > 0) {
          this.goods.forEach((good) => {
            good.foods.forEach((food) => {
              if (food.count) {
                foods.push(food);
              }
            });
          });
          /* eslint-disable no-undef */
          localStorage.setItem(this.$route.params.id, JSON.stringify(foods));
        }
        return foods;
      }
    },
    mounted() {
      var self = this;
      self.classMap = ['decrease', 'discount', 'special', 'invoice', 'guarantee'];
      self.eventHub.$on('cart.add', function(target) {
        self._drop(target);
      });
    },
    methods: {
      // 体验优化，异步执行小球下落动画
      _drop(target) {
        this.$nextTick(() => {
          this.$refs.shopcart.drop(target);
        });
      },
      selectMenu(index, event) {
        if (!event._constructed) {
          return;
        }
        let foodList = this.$refs.foodswrapper.getElementsByClassName('food-list-hook');
        let el = foodList[index];
        this.foodsScroll.scrollToElement(el, 300);
      },
      _initScroll() {
        this.meunScroll = new BScroll(this.$refs.menuwrapper, {
          click: true
        });

        this.foodsScroll = new BScroll(this.$refs.foodswrapper, {
          click: true,
          probeType: 3
        });

        this.foodsScroll.on('scroll', (pos) => {
          this.scrollY = Math.abs(Math.round(pos.y));
        });
      },
      _calculateHeight() {
        let foodList = this.$refs.foodswrapper.getElementsByClassName('food-list-hook');
        let height = 0;
        this.listHeight.push(height);
        for (let i = 0; i < foodList.length; i++) {
          let item = foodList[i];
          height += item.clientHeight;
          this.listHeight.push(height);
        }
      },
      selectFood(food, event) {
        if (!event._constructed) {
          return;
        }
        this.selectedFood = food;
        this.$refs.food.show();
      }
    },
    components: {
      shopcart,
      cartcontrol,
      food
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  @import "../../../common/stylus/mixin"

  .goods
    display: flex
    position: absolute
    top: 174px
    bottom: 46px
    width: 100%
    overflow: hidden
    .menu-wrapper
      flex: 0 0 80px
      width: 80px
      background: #f3f5f7
      .menu-item
        display: table
        padding: 0 12px
        height: 54px
        width: 56px
        line-height: 14px
        &.current
          position: relative
          z-index: 10
          margin-top: -1px
          background: #ffff
          font-weight: 700
          .text
            border-none()
        .icon
          display: inline-block
          vertical-align: top
          width: 12px
          height: 12px
          margin-right: 2px
          background-size: 12px 12px
          background-repeat: no-repeat
          &.decrease
            bg-image('decrease_3')
          &.discount
            bg-image('discount_3')
          &.guarantee
            bg-image('guarantee_3')
          &.invoice
            bg-image('invoice_3')
          &.special
            bg-image('special_3')
        .text
          display: table-cell
          width: 56px
          vertical-align: middle
          border-1px(rgba(7, 17, 27, 0.1))
          font-size: 12px

    .foods-wrapper
      flex: 1
      .title
        padding-left: 14px
        height: 26px
        line-height: 26px
        border-left: 2px solid #d9dde1
        font-size: 12px
        color: rgb(147, 153, 159)
        background: #f3f5f7
      .food-item
        display: flex
        margin: 18px
        padding-bottom: 18px
        border-1px(rgba(7, 17, 27, 0.1))
        &:last-child
          border-none()
          margin-bottom: 0
        .icon
          flex: 0 0 57px
          margin-right: 10px
          img
            width: 57px
            height: 57px
        .content
          flex: 1
          .name
            margin: 2px 0 8px 0
            height: 14px
            line-height: 14px
            font-size: 14px
            color: rgb(7, 17, 27)
          .desc,.extra
            line-height: 10px
            font-size: 10px
            color: rgb(147, 153, 159)
          .desc
            margin-bottom: 8px
            line-height: 16px
          .extra
            .count
              margin-right: 8px
          .price
            font-weight: 700
            line-height: 24px
            .now
              margin-right: 8px
              font-size: 14px
              color: rgb(240, 20, 20)
            .old
              text-decoration: line-through
              font-size: 10px
              color: rgb(147, 153, 159)
          .cartcontrol-wrapper
            position: absolute
            right: 0
            bottom: 12px

  .data-loader-goods
    width: 100%
    height: 400px
    background: url('../../../common/loading.gif') center no-repeat
</style>
