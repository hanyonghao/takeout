<template>
  <div class="cartontrol">
    <transition name="move">
      <div class="cart-decrease" v-show="food.count>0" v-on:click.stop.prevent="decreaseCart">
        <span class="inner icon-remove_circle_outline"> </span>
      </div>
    </transition>
    <div class="cart-count" v-show="food.count>0">{{food.count}}</div>
    <div class="cart-add icon-add_circle" v-on:click.stop.prevent="addCart"></div>
  </div>
</template>

<script>
  import Vue from 'vue';

  export default {
    props: {
      food: {
        type: Object
      }
    },
    methods: {
      addCart(event) {
        if (!event._constructed) {
          return;
        }
        console.log('click', event.target);
        if (!this.food.count) {
          Vue.set(this.food, 'count', 1);
        } else {
          this.food.count++;
        }
        if (this.$parent.eventHub) {
          this.$parent.eventHub.$emit('cart.add', event.target);
        } else {
          this.$parent.$parent.eventHub.$emit('cart.add', event.target);
        }
      },
      decreaseCart(event) {
        if (!event._constructed) {
          return;
        }
        console.log('click');
        if (this.food.count > 0) {
          this.food.count--;
        }
      }
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .cartontrol
    font-size: 0
    .cart-decrease
      display: inline-block
      padding: 6px
      &.move-enter-active, &.move-leave-active
        transition: all 0.4s linear
      .inner
        display: inline-block
        line-height: 24px
        font-size: 24px
        color: rgb(0, 160 220)
        transition: all 0.4s linear
        transform: rotate(0)
      &.move-enter, &.move-leave-active
        opacity: 0
        transform: translate3d(24px, 0, 0)
        .inner
          transform: rotate(180deg)
    .cart-count
      display: inline-block
      vertical-align: top
      width: 12px
      padding-top: 6px
      line-height: 24px
      text-align: center
      font-size: 10px
      color: rgb(147, 153, 159)
    .cart-add
      display: inline-block
      padding: 6px
      line-height: 24px
      font-size: 24px
      color: rgb(0, 160 220)
</style>
