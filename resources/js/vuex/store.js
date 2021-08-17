import Vue from 'vue'
import axios from 'axios'
import Vuex from 'vuex'
Vue.use(Vuex)


export default new Vuex.Store({

    state : {
        authToken: localStorage.getItem('auth_token') || null,
        user : null,
        loading: false,
        footerData: '',
        businessData : {},
        recruitData : {},
        recruitAppliedData : {},
        
    },

    getters : {

        getAuthToken(state){
            return state.authToken;
        },

        getUser(state){
            return state.user;
        },

        getLoading(state){
            return state.loading;
        },

        getFooterData(state){
            return state.footerData;
        },
        getBusinessData(state){
            return state.businessData;
        },
        getRecruitData(state){
            return state.recruitData;
        },
        getRecruitAppliedData(state){
            return state.recruitAppliedData;
        }


       

    },

    mutations : {

        setAuthToken(state, data){
            state.authToken = data
        },

        setUser(state, data){
            // user data pass to state
            state.user = data; 
        },

        setLoading(state, data){
            state.loading = data;
        },

       

        // destroyUserAuth
        destroyUserAuth(state){
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
        },
        setRecruitData(state, data){
            state.recruitData = data;
        },
        setRecruitAppliedData(state, data){
            state.recruitAppliedData = data;
        }


    },

    actions : {

        // User data
        authUserData(context){
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + context.state.authToken
            axios.get('api/user').then((response) => {
                console.log('Store user run:', response.data);
                context.commit('setUser', response.data)
            }).catch((errors) => {
                console.log(errors)
            })
        },

        footerData(context) {
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

        // UserLogout
        userLogout(context){
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + context.state.authToken
            axios.post('/api/logout')
            .then(response => {
              console.log('Logout : '+ response);
                // Remove localstorage
                localStorage.clear();
                // Clera state
                context.commit('destroyUserAuth');
            })
            .catch(error => {
              console.log('Logout : '+ error);
            })

        },


       
        // Recruit Circular Data
        recruitData(context){
            context.commit('setLoading', true)
            axios.get('/api/circular')
                .then(response=> {
                    context.commit('setRecruitData', response.data)
                    context.commit('setLoading', false)
                })
                .catch(error => {
                    console.log(error)
                })
        },


        // Recruit Job Applied Data
        recruitAppliedData(context){
            context.commit('setLoading', true)
            axios.post('/api/circular_job_applied')
                .then(response=> {
                    context.commit('setRecruitAppliedData', response.data)
                    context.commit('setLoading', false)
                })
                .catch(error => {
                    console.log(error)
                })
        },



    }

});