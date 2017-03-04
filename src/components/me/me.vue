<template>
<div class="content">
  <div class="me">
    <div class="header">
      <div class="dse">
        <p class="username">{{getUserName(user.name)}}</p>
        <span class="exit" @click="exit">退出</span>
      </div>
      <div class="userimage">
      </div>
    </div>
    <div class="me-content">
      <div class="detail">
        <div class="dse-content">
          <span class="number">0</span>
          <span>代金券</span>
        </div>
        <div class="dse-content">
          <span class="number">{{count}}</span>
          <router-link :to="{path: '/collect'}" class="collect">收藏的店</router-link>
        </div>
        <div class="dse-content">
          <span class="number">0</span>
          <span>余额</span>
        </div>
      </div>
      <split></split>
      <div class="service-warrper">
        <div class="service" v-for="service in services">
          <router-link :to="{path: service.href}" :class="service.iconClass"></router-link>
          <p v-text="service.text"></p>
        </div>
      </div>
    </div>
  </div>
  <v-navigation></v-navigation>
</div>
</template>

<script>
import split from 'components/split/split';
import navigation from 'components/navigation/navigation';
export default{
  data() {
    return {
      services: [
        {
          iconClass: 'icon-address',
          text: '我的地址',
          href: '/address'
        },
        {
          iconClass: 'icon-Message',
          text: '我的评价',
          href: '/order'
        },
        {
          iconClass: 'icon-service',
          text: '在线客服',
          href: '/me'
        }
      ],
      count: {
        type: Number
      },
      collects: [],
      user: {}
    };
  },
  mounted() {
    console.log(1234567, window.user);
    let userid = window.user._id;
    this.user = window.user;
    let self = this;
    self.$http.post('/collect/getUserCollectByUserID', {userid: userid}).then(function(response) {
      console.log(33333000002, response);
      self.collects = response.data.collect;
      console.log(33333300003, self.collects);
      self.count = self.collects.length;
      console.log(33333300004, self.count);
    });
  },
  methods: {
    exit(event) {
      let self = this;
      self.$http.post('/auth/exit').then((response) => {
        window.location.href = '/';
      });
    },
    getUserName(name) {
      name = name + '';
      return name.substring(0, 3) + '*****' + name.substring(name.length - 3, name.length);
    }
  },
  components: {
      split,
      'v-navigation': navigation
  }
};
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .me
    .header
      width:100%
      height: 150px
      background-color: #ff2d4b
      .dse
        height: 90px
        font-size: 0
        line-height: 80px
        position: relative
        .username
          font-size: 14px
          font-weight: 700
          color: #fff
          text-align: center
        .exit
          position: absolute
          font-size: 12px
          line-height: 80px
          top: 0
          right: 14px
          color: #fff
      .userimage
          width: 56px
          height: 56px
          border: 3px solid #fff
          border-radius: 25px
          margin: 0 auto
          background-color: #dee2de
     .me-content
      .detail  
        display: flex
        box-sizing: border-box
        padding: 14px 0 
        .dse-content
          flex: 1
          text-align: center
          border-right: 1px solid rgba(7, 17, 27, 0.3)
          &:last-child
            border-right: 0
          span
            display: block
            font-size: 14px
          .number
            margin-bottom: 5px
            font-weight: 700
            color: #ff2d4b
          .collect
            font-size: 14px
            color: #333
      .service-warrper
        display: flex
        box-sizing: border-box
        .service
          flex: 1
          text-align: center
          padding: 14px 0 14px 0
          border-right: 1px solid rgba(7, 17, 27, 0.1)
          border-bottom: 1px solid rgba(7, 17, 27, 0.1)
          &:last-child
            border-right: 0
          a
            font-size: 24px
            line-height: 34px
            color: #878787
          p
            font-size: 12px
            color: #333333




</style>