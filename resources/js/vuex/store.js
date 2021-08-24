import Vue from 'vue'
import axios from 'axios'
import Vuex from 'vuex'
Vue.use(Vuex)

import actions from './actions';
import getters from './getters';
import mutations from './mutations';

import common from '../common/common';



export default new Vuex.Store({

    state : {
        authToken       : localStorage.getItem('auth_token') || null,
        user            : null,
        loading         : false,
        footerData      : '',
        businessData    : {},
        recruitData     : {},
        recruitAppliedData : {},

        // adminAuthToken : localStorage.getItem('admin_auth_token') || null, 
        // adminAuthToken  : common.methods.getLocalStorage('admin_auth_token') || null,
        // adminUser       : common.methods.getLocalStorage('admin_user') || null,
        adminAuthToken  : common.methods.getSessionStorage('admin_auth_token') || null,
        adminUser       : null,


    },

    getters : getters,

    mutations : mutations,

    actions :  actions,

});