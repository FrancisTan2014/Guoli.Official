// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUi from 'element-ui'
import VueMoment from 'vue-moment'

import 'element-ui/lib/theme-default/index.css'
import 'font-awesome/css/font-awesome.min.css'
import 'nprogress/nprogress.css'

Vue.config.productionTip = false

Vue.use(ElementUi)
Vue.use(VueMoment)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
