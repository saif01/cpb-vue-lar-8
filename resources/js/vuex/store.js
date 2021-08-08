import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({

    state : {
        user : false,
        businessData : '',
    },

    getters : {

    },

    mutations : {

        setUpdateUser(state, data){
            // user data pass to state
            state.user = data
        },


        businessData(state, data){
            // update business data state
            state.businessData = data
        }



    },

    actions : {

    }

});