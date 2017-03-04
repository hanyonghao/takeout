// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import VueRouter from 'vue-router';
import VueResource from 'vue-resource';
import App from './App';
import home from 'components/home/home';
import me from 'components/me/me';
import order from 'components/order/order';
import goods from 'components/seller/goods/goods';
import ratings from 'components/seller/ratings/ratings';
import sellerdsc from 'components/seller/sellers/sellerdsc';
import seller from 'components/seller/seller';
import collect from 'components/me/collect/collect';
import address from 'components/me/address/address';
import login from 'components/user/login';
import variety from 'components/home/variety/variety';
import ajax from 'common/js/ajax';
import 'common/stylus/index.styl';

// vue使用路由配置
Vue.use(VueRouter);
// vue-resource
Vue.use(VueResource);

function isLogin(to, from, next) {
  let params = arguments;
  ajax.post('/auth/isLogin', '', function(data) {
    data = JSON.parse(data);
    console.log(data);
    if (data.status === 200) {
      console.log(data.result);
      window.user = data.result;
      console.log(2333, params);
      if (params.length > 1 && typeof params[0] !== 'function') {
        next();
      } else {
        params[0](true);
      }
    } else {
      if (params.length > 1 && typeof params[0] !== 'function') {
        next({ path: '/login' });
      } else {
        params[0](false);
      }
    }
  }, function() {
    console.log('请求异常');
  });
}

window.isLogin = isLogin;

let router = new VueRouter({
  routes: [
    { path: '/home', name: 'home', component: home },
    { path: '/me', name: 'me', component: me, beforeEnter: isLogin },
    { path: '/order', name: 'order', component: order, beforeEnter: isLogin },
    {
      path: '/seller/:id',
      name: 'seller',
      component: seller,
      children: [
        { path: 'goods', name: 'goods', component: goods },
        { path: 'ratings', name: 'ratings', component: ratings },
        { path: 'sellerdsc', name: 'sellerdsc', component: sellerdsc }
      ]
    },
    { path: '/collect', name: 'collect', component: collect, beforeEnter: isLogin },
    { path: '/address', name: 'address', component: address, beforeEnter: isLogin },
    { path: '/login', name: 'login', component: login },
    { path: '/variety/:type', name: 'variety', component: variety },
    { path: '/*', redirect: { name: 'home' } }
  ]
});
new Vue({
  router, // 注册路由
  components: {App},
  render: h => h(App)// 渲染入口组件
}).$mount('#app');
