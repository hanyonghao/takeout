<template>
<div class="variety-sellers" ref="varsellers" :style="{top: $route.params.type === '0' ? '76px' : '50px'}"  @touchstart="_startTouch" @touchmove="_moveTouch" @touchend="_endTouch">
    <ul v-if="sellers">
      <li class="seller-list border-1px" v-for="seller in sellers">
        <v-sellerlist v-bind:seller="seller"></v-sellerlist>
      </li>
    </ul>
</div>
</template>

<script>
  import BScroll from 'better-scroll';
  import sellerlist from 'components/sellerlist/sellerlist';
  export default{
    props: {
      sellers: {}
    },
    data() {
      return {
        start_time: 0,
        end_time: 0,
        start_x: 0,
        end_x: 0
      };
    },
    mounted() {
      console.log(12345678910, this.sellers);
      let self = this;
      setTimeout(function() {
        self.scroll = new BScroll(self.$refs.varsellers, {
          click: true
        });
      }, 100);
    },
    methods: {
      _startTouch(e) {
        this.start_x = e.touches[0].clientX;
        this.start_time = new Date().getTime();
      },
      _moveTouch(e) {
        this.end_x = e.touches[0].clientX;
        this.end_time = new Date().getTime();
      },
      _endTouch(e) {
        if (this.end_time - this.start_time < 160 && this.$route.params.type === '0') {
          if (this.end_x - this.start_x > 80) {
              if (this.$parent.subType === this.$parent.varietys.length - 1) {
                this.$parent.subType = 0;
              } else {
                this.$parent.subType++;
              }
          } else if (this.end_x - this.start_x < -80) {
              if (this.$parent.subType === 0) {
                this.$parent.subType = this.$parent.varietys.length - 1;
              } else {
                this.$parent.subType--;
              }
          }
        }
      }
    },
    components: {
      'v-sellerlist': sellerlist
    }
  };
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .variety-sellers
    position: absolute
    top: 76px
    left: 0
    bottom: 0
    width: 100%
    overflow: hidden

</style>