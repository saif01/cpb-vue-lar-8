require('./bootstrap');

window.Vue = require('vue').default;
import Vue from 'vue'

// Vuex File
import store from './vuex/store';


// Router
import routes from './router/routes';

// BackToTop btn
import BackToTop from 'vue-backtotop';
Vue.use(BackToTop)

import  BootstrapVue from 'bootstrap-vue';
Vue.use(BootstrapVue)
// import  IconsPlugin from 'bootstrap-vue'
// Vue.use(IconsPlugin)


// mixin global added
import common from './common/common';
Vue.mixin(common);


// VueProgressBar
import VueProgressBar from 'vue-progressbar';

Vue.use(VueProgressBar, {
    color: '#66FE5E',
    failedColor: 'red',
    thickness: '3px',
});


// sweetalert2
import Swal from 'sweetalert2';
const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    onOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })
window.Swal = Swal;
window.Toast = Toast;




Vue.component('example-component', require('./components/ExampleComponent.vue').default);

// Front-end 
Vue.component('main-app', require('./components/front_end/main_app.vue').default);

// pagination
Vue.component('pagination', require('laravel-vue-pagination'));
   

const app = new Vue({
  el: '#app',
  router: routes,
  store
});
