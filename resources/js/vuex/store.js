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
        authToken       : common.methods.getAuthTokenLocalStorage('auth_token') || null,
        //authToken       : localStorage.getItem('auth_token') || null,
        user            : common.methods.getUserLocalStorage() || null,
        //user            : null,
        loading         : false,
        footerData      : '',
        businessData    : {},
        recruitData     : {},
        recruitAppliedData : {},

        adminAuthToken  : common.methods.getSessionStorage('admin_auth_token') || null,
        adminUser       : common.methods.getSessionStorage('admin_user') || null,
        adminRoles      : common.methods.getSessionStorage('admin_roles') || null,



    },

    getters : getters,

    mutations : mutations,

    actions :  actions,

});