<template>
<div class="checkRatings" v-show="showFlag">
  <div class="myRatings">
    <div class="checkRatingsheader">
      <i class="icon-arrow_lift" v-on:click="hide"></i>
      <div class="title">我的评论</div>
    </div>
    <div class="ratings-wrapper" ref="rates">
      <div class="detalis">
        <ul>
          <li class="ratings-list" v-for="rating in ratings">
            <div class="title">
              <div class="avatar">
                <img width="30" height="30" :src="rating.seller_id.avatar">
              </div>
              <div class="seller">
                <router-link :to="{path: '/seller/' + rating.seller_id._id + '/goods'}">
                  <span class="name">{{rating.seller_id.name}}</span>
                  <i class="icon-keyboard_arrow_right"></i>
                </router-link>
              </div>
            </div>
            <div class="ratings-content">
              <div class="star-wrapper">
                <star :size="24" :score="rating.score"></star>
                <span class="delivery">{{rating.deliveryTime}}分钟</span>
                <span class="ratingTime">{{rating.rateTime | formatDate}}</span>
              </div>
              <div class="recommend" v-show="rating.recommend && rating.recommend.length">
                <i class="icon-thumb_up"></i>
                <span class="foodname" v-for="item in rating.recommend">{{item}}</span>
              </div>
              <div class="rating" v-show="rating.text && rating.text.length">{{rating.text}}</div>
            </div>
            <split></split>
          </li>
        </ul>
      </div>
      <!--<div class="data-loader-order" ></div>-->
    </div>
  </div>
</div>
</template>

<script>
  import BScroll from 'better-scroll';
  import split from 'components/split/split';
  import star from 'components/star/star';
  import {formatDate} from 'common/js/date';
  export default{
    data() {
      return {
        showFlag: false
      };
    },
    props: {
      ratings: {
        type: Array
      }
    },
    methods: {
      show() {
        let self = this;
        setTimeout(function() {
          self.scroll = new BScroll(self.$refs.rates, {
            click: true
          });
        }, 100);
        this.showFlag = true;
      },
      hide() {
        this.showFlag = false;
      }
    },
    filters: {
      formatDate(time) {
        let date = new Date(time);
        return formatDate(date, 'yyyy-MM-dd hh:mm');
      }
    },
    components: {
      split,
      star
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .checkRatings
    position: fixed
    top: 0
    left: 0
    background: #fff
    width: 100%
    height: 100%
    .checkRatingsheader
      box-sizing: border-box 
      padding: 34px 15px 0 15px
      width: 100%
      height: 75px
      background: #ff2d4b
      color: #fff
      .title
        position: absolute
        top: 34px
        left: 45px
        right: 45px
        display: inline-block
        font-weight: 700
        text-align: center
    .ratings-wrapper
      position: absolute
      top: 75px
      bottom: 50px
      width: 100%
      overflow: hidden
      .detalis
        .ratings-list
          .title
            width: 100%
            height: 50px
            display: flex
            box-sizing: border-box
            border-bottom: 1px solid #ccc
            padding-top: 10px
            .avatar
              flex: 0 0 30px
              width: 30
              margin-left: 14px
              img
                border-radius: 50%
            .seller
              flex: 1
              font-size: 0
              line-height: 32px
              vertical-align: middle
              .name
                font-size: 16px
                margin-left: 13px
                color: #4d4d4d
                font-weight: 700
              .icon-keyboard_arrow_right
                font-size: 24px
                margin-left: 7px
                color: #c5c5c5
                vertical-align: -6px
          .ratings-content
            padding: 10px
            .star-wrapper
              display: flex
              color: rgb(147, 153, 159)
              star
                flex: 0 0 50px
              .delivery
                flex: 0 0 70px
                font-size: 10px
                text-align: center
              .ratingTime
                flex: 1
                font-size: 10px
                text-align: right
            .recommend
              padding-top: 10px
              font-size: 14px
              overflow: hidden
              .icon-thumb_up, .foodname
                float: left
                margin: 4px 6px
              .icon-thumb_up
                color: rgb(0, 160, 220)
              .foodname
                padding: 0 6px
                border: 1px solid rgba(7, 17, 27, 0.1)
                border-radius: 1px
                color: rgb(147, 153, 159)
                background: #fff
            .rating
              padding-top: 10px
              font-size: 14px

</style>