import Vue from 'vue'
import axios from 'axios'
import Vuex from 'vuex'
Vue.use(Vuex)


export default new Vuex.Store({

    state : {
        userAuth: false,
        authToken: false,
        user : '',
        businessData : '',
        footerData: '',
        
    },

    getters : {

        getUserAuth(state){
            return state.userAuth;
        },

        getAuthToken(state){
            return state.authToken;
        },

        getUser(state){
            return state.user;
        },

        getFooterData(state){
            return state.footerData;
        },
        getBusinessData(state){
            return state.businessData;
        }

       

    },

    mutations : {

        setAuth(state, data){
            state.userAuth = data
        },

        setAuthToken(state, data){
            state.authToken = data
        },

        setUser(state, data){
            // user data pass to state
            state.user = data; 
        },

       

        // destroyUserAuth
        destroyUserAuth(state){
            state.userAuth  = false;
            state.authToken = null,
            state.user      = null;
        },

        // Navbar data update
        businessData(state, data){
            // update business data state
            state.businessData = data;
        },


        setFooterData(state, data){
            state.footerData = data;
        },
        setBusinessData(state, data){
            state.businessData = data;
        }


    },

    actions : {

        footerData(context) {
            // axios.defaults.headers.common['Authorization'] = 'Bearer ' + context.state.authToken
      
            axios.get('/api/footer')
              .then(response => {
                //console.log(response.data);
                context.commit('setFooterData', response.data)
              })
              .catch(error => {
                console.log(error)
              })
        },

        businessData(context){
            axios.get('/api/business')
                .then(response=> {
                    context.commit('setBusinessData', response.data)
                })
                .catch(error => {
                    console.log(error)
                })

        },

        // userLogout
        userLogout(context){

            // Remove data from local storage
            //localStorage.removeItem('auth_user');
            //localStorage.removeItem('user_data');
            localStorage.clear();
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