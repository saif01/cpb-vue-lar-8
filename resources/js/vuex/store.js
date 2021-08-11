import Vue from 'vue'
import axios from 'axios'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({

    state : {
        userAuth: false,
        user : '',
        businessData : '',
        
    },

    getters : {

        getUser(state){
            return state.user;
        },

        getUserAuth(state){
            return state.userAuth;
        }

    },

    mutations : {

        setUser(state, data){
            // user data pass to state
            state.user = data; 
        },

        setAuth(state, data){
            state.userAuth = data
        },


        // destroyUserAuth
        destroyUserAuth(state){
            state.userAuth = false;
            state.user = null;
        },

        // Navbar data update
        businessData(state, data){
            // update business data state
            state.businessData = data;
        }



    },

    actions : {

        // userLogout
        userLogout(context){

            // Remove data from local storage
            localStorage.removeItem('auth_user');
            localStorage.removeItem('user_data');
            // Clera state
            context.commit('destroyUserAuth');

            axios.post('/api/circular_logout')
            .then(response => {
              console.log('Logout : '+ response);
            })
            .catch(error => {
              console.log('Logout : '+ error);
            })


        }

    }

});