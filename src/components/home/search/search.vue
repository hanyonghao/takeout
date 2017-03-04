<template>
  <div class="search" v-show="showFlag">
    <div class="search-wrapper">
      <div class="search-header">
        <div class="header-wrapper">
          <i class="icon-arrow_lift" v-on:click="hide"></i>
          <div class="search-input">
            <i class="icon-search"></i>
            <input placeholder="输入商家、商品名称" v-model="query" @keydown.enter="search">
          </div>
        </div>
      </div>
      <div class="search-content">
        <div class="hot-search" v-if="!query">
          <span class="title">热门搜索</span>
          <div class="hotsearch-list">
            <ul>
              <li v-for="word in hotwords" class="hotsearch-name" v-text="word" @click="selectWord(word)"></li>
            </ul>
          </div>
        </div>
        <div class="searchResults" ref="searchresults" v-if="searchResults">
          <div class="search-results">
            <ul v-for="searchResult in searchResults">
              <li>
                <div class="searchlist border-1px">
                  <router-link :to="{path: '/seller/' + getSeller(searchResult)._id + '/goods'}">
                    <div class="seller">
                        <div class="avatar">
                          <img width="100%" height="100%" :src="getSeller(searchResult).avatar">
                        </div>
                        <div class="sellerlist-content">
                          <div class="sellerlist-name">
                            <span class="name">{{getSeller(searchResult).name}}</span>
                          </div>
                          <div class="sale">
                            <star :size="24" :score="getSeller(searchResult).score"></star>
                            <span class="text">月售{{getSeller(searchResult).sellCount}}单</span>
                            <span class="time">{{getSeller(searchResult).deliveryTime}}分钟</span>
                          </div>
                          <div class="dilivery">
                            <span class="text">起送￥{{getSeller(searchResult).minPrice}}</span>
                            <span class="text">配送￥{{getSeller(searchResult).deliveryPrice}}</span>
                          </div>
                        </div>
                    </div>
                    <div class="search-foods" v-if="!searchResult.seller">
                      <div class="search-food" v-if="searchResult.foods.length > 0">
                        <img width="100%" height="80px" :src="searchResult.foods[0].query_image">
                        <p class="foodname" v-html="searchResult.foods[0].query_name"></p>
                      </div>
                      <div class="search-food" v-if="searchResult.foods.length > 1">
                        <img width="100%" height="80px" :src="searchResult.foods[1].query_image">
                        <p class="foodname" v-html="searchResult.foods[1].query_name"></p>
                      </div>
                      <div class="search-food" v-if="searchResult.foods.length > 2">
                        <img width="100%" height="80px" :src="searchResult.foods[2].query_image">
                        <p class="foodname" v-html="searchResult.foods[2].query_name"></p>
                      </div>
                    </div>
                  </router-link>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import BScroll from 'better-scroll';
  import star from 'components/star/star';
  export default {
      data() {
        return {
          showFlag: false,
          query: null,
          hotwords: ['三及第', '奶茶', '披萨', '蛋糕', '黄焖鸡', '水果', '超市'],
          searchResults: null
        };
      },
      watch: {
        query(val) {
          if (val) {
            this.search();
          } else {
            this.searchResults = null;
          }
        }
      },
      methods: {
        show() {
          this.showFlag = true;
          this.query = null;
        },
        hide() {
          this.showFlag = false;
          this.searchResults = null;
        },
        selectWord(word) {
          this.query = word;
        },
        search() {
          let self = this;
          if (this.query) {
            console.log('搜索词为：' + this.query);
            this.$http.post('/search/search', {q: this.query}).then(function(response) {
              console.log(response.data.results);
              self.searchResults = response.data.results;
              setTimeout(function() {
                self.scroll = new BScroll(self.$refs.searchresults, {
                  click: true
                });
              }, 50);
            });
          }
        },
        getSeller(searchResult) {
          if (searchResult.seller) {
            return searchResult.seller;
          } else {
            return searchResult.foods[0].seller_id;
          }
        }
      },
      components: {
        'star': star
      }
    };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .search
    position: fixed
    top: 0
    left: 0
    bottom: 0
    width: 100%
    font-size: 0
    background: #eeeeee
    .search-header
      position: fixed
      top: 0
      left: 0
      width: 100%
      height: 64px
      box-sizing: border-box
      padding-top: 28px
      background: #ff2d4b
      .header-wrapper
        .icon-arrow_lift
          padding-left: 10px
          font-size: 24px
          color: #fff
        .search-input
          position: absolute
          left: 45px
          right: 8px
          display: inline-block
          box-sizing: border-box
          padding: 0 10px
          border-radius: 12px
          vertical-align: top
          font-size: 14px
          line-height: 26px
          background: #fff
          input
            width: 80%
            outline: none
            padding: 0 5px
    .search-content
      width: 100%
      position: absolute
      left: 0
      top: 64px
      bottom: 0
      .hot-search
        font-size: 14px
        .title
          padding-left: 15px
          font-weight: 600
          line-height: 38px
          color: #666
        .hotsearch-list
          width: 100%
          background: #fff
          overflow: hidden
          padding: 7.5px
          .hotsearch-name
            float: left
            padding: 5px 10px
            background: #fff
            border: 1px solid #ccc
            border-radius: 4px
            margin: 7.5px
      .searchResults
        position: absolute
        left: 0
        top: 0
        bottom: 0
        width: 100%
        background: #fff
        overflow: hidden
        .search-results
          .searchlist
            border-bottom: 1px solid rgba(7, 17, 27, 0.1)
            .seller
              width: 100%
              height: 96px
              display: block
              box-sizing: border-box
              padding: 20px 20px
              position: relative
              .avatar
                display: inline-block
                width: 76px
                height: 100%
              .sellerlist-content
                display: inline-block
                vertical-align: top
                margin:0px 0 0 10px
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
            .search-foods
              overflow: hidden
              padding: 0 16px 18px 16px
              .search-food
                float: left
                width: 30%
                border: 1px solid #eee
                margin: 0 1%
                border-radius: 2px
                .foodname
                  font-size: 12px
                  text-align: center
                  line-height: 30px



</style>
