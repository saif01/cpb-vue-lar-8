import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter);

// Vuex File
import store from '../vuex/store';



import frontend_routes from './frontend';
import admin_routes from './admin';

 
const routes = new VueRouter({
    mode: 'history',

    routes: [
        // All fronend routes
        ...frontend_routes,

        // All Admin routes
        ...admin_routes,

    ]

});


// Run brfore every route request
routes.beforeEach( (to, from, next) => {
    //console.log(to, to.meta.auth);

    // Check Authentication
    if(to.meta.auth){
        if(store.getters.getAuthToken){
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + store.getters.getAuthToken;
            axios.get('api/athenticated').then((response) => {
                console.log(' auth route : ', store.getters.getAuthToken, response.data);

                //store.dispatch('authUserData')

                if(! response.data){
                   // Redirect to dashboard
                    return next('circular_login');
                }
                
            }).catch((errors) => {
                console.log(errors);
            })
        }else{
            // Redirect to dashboard
            return next('circular_login');
        }
    }

    
    let appName = 'C.P.Bangladesh';
    let title = to.meta && to.meta.title ? to.meta.title : '';
    // set current title
    document.title =`${ appName } ${ title }`;

    next();
});




export default routes;