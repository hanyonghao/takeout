<template>
<div class="sellerlist border-1px">
  <router-link :to="{path: '/seller/' + seller._id + '/goods'}">
    <div class="avatar">
      <img width="100%" height="100%" v-bind:src="seller.avatar">
    </div>
    <div class="sellerlist-content">
      <div class="sellerlist-name">
        <span class="name">{{seller.name}}</span>
      </div>
      <div class="sale">
        <star :size="24" :score="seller.score"></star>
        <span class="text">月售{{seller.sellCount}}单</span>
        <span class="time">{{seller.deliveryTime}}分钟</span>
      </div>
      <div class="dilivery">
        <span class="text">起送￥{{seller.minPrice}}</span>
        <span class="text">配送￥{{seller.deliveryPrice}}</span>
      </div>
    </div>
  </router-link>
</div>
</template>

<script>
  import star from 'components/star/star';
  export default{
    props: {
      seller: {
        type: Object
      }
    },
    components: {
      'star': star
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .sellerlist
    width: 100%
    height: 96px
    display: block
    box-sizing: border-box
    padding: 20px 20px
    position: relative
    border-bottom: 1px solid rgba(7, 17, 27, 0.1)
    a
      width: 100%
      height: 100%
      display: block
      position: relative
      padding-left: 86px
      .avatar
        width: 76px
        height: 100%
        position: absolute
        top: 0
        left: 0
      .sellerlist-content
        .sellerlist-name
          .name
            font-size: 16px
            line-height: 24px
            font-weight: 700
            color: #333333
        .sale
          .star
            display: inline-block
            margin-right: 8px
            vertical-align: top
          .text
            font-size: 10px
            line-height: 16px
            color: #7e8c8d
          .time
            display: inline-block
            position: absolute
            font-size: 10px
            line-height: 16px
            top: 45%
            right: 25px
            color: #7e8c8d
        .dilivery
          .text
            font-size: 10px
            line-height: 16px
            border-right: 1px solid rgba(7, 17, 27, 0.1)
            padding-right: 7px
            color: #7e8c8d
            &:last-child
              border-right: 0
              padding-left: 7px

    

</style>