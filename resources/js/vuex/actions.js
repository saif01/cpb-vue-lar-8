import axios from "axios";

export default {

    // Visitor log
    visitor_log(){
        axios.get('/api/visitor_log').then(response=>{
            //console.log(response.data)
        }).catch(error=>{
            console.log(error)
        })
    },

    // User data
    authUserData(context){
        axios.defaults.headers.common['Authorization'] = 'Bearer ' + context.state.authToken
        axios.get('/api/user').then((response) => {
            console.log('Store user run:', response.data);
            context.commit('setUser', response.data)
        }).catch((errors) => {
            console.log(errors)
        })
    },

    // Admin User data
    authAdminUserData(context){
        axios.defaults.headers.common['Authorization'] = 'Bearer ' + context.state.adminAuthToken
        axios.get('/api/user').then((response) => {
            console.log('Store Admin user run:', response.data);
            context.commit('setAdminUser', response.data)
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