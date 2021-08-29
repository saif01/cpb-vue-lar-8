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



// Store method call
// if(store.getters.getAuthToken){
//   console.log('This is app js', store.getters.getAuthToken)

//   store.dispatch('authUserData')

// }


// vue-bootstrap-sidebar 
// import BootstrapSidebar from 'vue-bootstrap-sidebar'
// Vue.use(BootstrapSidebar)

// import { library } from '@fortawesome/fontawesome-svg-core'
// import { faUserSecret, faHome, faTint, faUsers,  faSignOutAlt,
//          faPhone, faChild } from '@fortawesome/free-solid-svg-icons'
// import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// library.add(faUserSecret)
// library.add(faHome)
// library.add(faTint)
// library.add(faUsers)
// library.add(faPhone)
// library.add(faChild)
// library.add(faSignOutAlt)
// Vue.component('font-awesome-icon', FontAwesomeIcon)



Vue.component('example-component', require('./components/ExampleComponent.vue').default);

// Front-end 
Vue.component('main-app', require('./components/front_end/main_app.vue').default);

// Admin 
Vue.component('admin-app', require('./components/admin/admin_app.vue').default);

// pagination
Vue.component('pagination', require('laravel-vue-pagination'));



   

const app = new Vue({
  el: '#app',
  router: routes,
  store,
 
});
