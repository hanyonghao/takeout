<template>
<div class="addrating">
  <div class="ratingheader">
    <div class="wrapper">
      <i class="icon-arrow_lift" v-on:click="hide"></i>
      <div class="title">添加评价</div>
    </div>
  </div>
  <div class="ratingContent-wrapper" ref="ratingcontent">
    <div class="ratingContent">
      <div class="avatar">
        <img width="100%" height="100%" v-bind:src="orderdes.seller_id.avatar">
      </div>
      <div class="sellername">{{orderdes.seller_id.name}}</div>
      <div class="gade">
        <span>商品评分:</span>
        <star :size="36" :score="star" :click="setStart"></star>
      </div>
      <div class="deliverytime">
        <span class="label">配送时长:</span>
        <span class="time">{{time}}</span>
      </div>
      <div class="recommend">
        <ul v-for="food in orderdes.foods">
          <li>
            <div class="recommend-wrapper">
              <span class="foodname">{{food.name}}</span>
              <i v-bind:class="checkboxClass(food.name)" v-on:click="checked(food.name)"></i>
            </div>
          </li>
        </ul>
      </div>
      <div class="rating-conetnt">
        <textarea name="rating" placeholder="点评一下吧，您的意见很重要哦" maxlength="50" v-model="ratingdesc"></textarea>
      </div>
      <button type="button" class="save" @click="save">保存</button>
    </div>
  </div>
</div>
</template>

<script>
  import BScroll from 'better-scroll';
  import star from 'components/star/star';
  export default{
    props: ['orderdes'],
    data() {
      return {
        star: 0,
        recommend: [],
        ratingdesc: '',
        status: 1
      };
    },
    computed: {
      time() {
        console.log(123455555, this.orderdes);
        console.log(123466666, this.orderdes.orderTime);
        return parseInt((this.orderdes.deliveryTime - this.orderdes.orderTime) / 1000 / 60) + '分钟';
      }
    },
    mounted() {
      let self = this;
      setTimeout(function() {
        self.scroll = new BScroll(self.$refs.ratingcontent, {
          click: true
        });
      }, 100);
    },
    methods: {
      hide() {
        this.$parent.orderdes = null;
      },
      setStart(index) {
        this.star = index + 1;
      },
      checkboxClass(name) {
        return {
          'icon-thumb_up': true,
          'checked': this.recommend.indexOf(name) > -1
        };
      },
      checked(name) {
        if (this.recommend.indexOf(name) > -1) {
          this.recommend.splice(this.recommend.indexOf(name), 1);
        } else {
          this.recommend.push(name);
        }
      },
      save() {
        let self = this;
        let rateTime = new Date().getTime();
        let addData = {
          seller_id: this.orderdes.seller_id._id,
          order_id: this.orderdes._id,
          user_id: this.orderdes.user_id,
          username: window.user.name,
          rateTime: rateTime,
          deliveryTime: parseInt((this.orderdes.deliveryTime - this.orderdes.orderTime) / 1000 / 60),
          score: this.star,
          rateType: this.star <= 2 ? 1 : 0,
          text: this.ratingdesc,
          avatar: 'http://static.galileo.xiaojukeji.com/static/tms/default_header.png',
          recommend: this.recommend
        };
        console.log('addData', addData);
        this.$http.post('/ratings/addOrderRating', {rating: addData}).then(function(response) {
        });

        let updateData = {
          _id: this.orderdes._id,
          status: 2
        };
        console.log(updateData);
        self.$http.post('/order/setOrderStatus', {order: updateData}).then(function(response) {
          this.$parent.refresh();
          this.hide();
          this.$parent.checkRatings();
        });
      }
    },
    components: {
      'star': star
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .addrating
    position: fixed
    top: 0
    left: 0
    background: #fff
    width: 100%
    height: 100%
    font-size: 0
    .ratingheader
      box-sizing: border-box 
      padding: 34px 15px 0 15px
      width: 100%
      height: 75px
      border-bottom: 1px solid rgba(7, 17, 27, 0.1)
      background: #fff
      .wrapper
        width: 100%
        font-size: 14px
        line-height: 14px
        color: #ff0000
        .title
          position: absolute
          top: 34px
          left: 45px
          right: 45px
          display: inline-block
          font-weight: 700
          text-align: center
          color: #4d4d4d
    .ratingContent-wrapper
      position: absolute
      top: 75px
      left: 0
      bottom: 50px
      width: 100%
      overflow: hidden
    .ratingContent
      width: 100%
      box-sizing: border-box
      padding: 20px 15px
      font-size: 14px
      .avatar
        display: inline-block
        width: 60px
        height: 60px
      .sellername
        display: inline-block
        vertical-align: top
        margin: 22px 10px
        font-weight: 700
      .gade
        display: flex
        margin-top: 10px
        span
          flex: 0 0 64px
          margin-right: 10px
          font-weight: 700
        input
          flex: 1
          border-bottom: 1px solid rgba(7, 17, 27, 0.2)
          outline: none
      .deliverytime
        display: flex
        margin-top: 10px
        .label
          flex: 0 0 64px
          margin-right: 10px
          font-weight: 700
        .time
          flex: 1
      .recommend
        margin-top: 10px
        .recommend-wrapper
          display: flex
          padding: 10px 0
          .foodname
            flex: 1
          .icon-thumb_up
            flex: 0 0 40px
            color: #ccc
            &.checked
              color: rgb(0, 160, 220)
      .rating-conetnt
        width:100%
        height: 100px
        margin-top: 10px
        textarea
          width: 100%
          height: 100%
          outline: none
          resize: none
          border: 1px solid #ccc
      .save
        margin: 16px 0
        width: 100%
        height: 38px
        text-align: center
        color: #fff
        background: #ff2b4d
        border: 0
        border-radius: 5px

</style>