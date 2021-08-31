export default {

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
    },


    // Admin start
    
    // Admin Auth
    getAdminAuthToken(state){
        return state.adminAuthToken;
    },
    // Admin User
    getAdminUser(state){
        return state.adminUser;
    },

    // Admin Roles
    getAdminRoles(state){
        return state.adminRoles;
    }




}