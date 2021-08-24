export default {

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
    },


    // Admin

    // Admin Auth
    setAdminAuthToken(state, data){
        state.adminAuthToken = data;
    },
    setAdminUser(state, data){
        state.adminUser = data;
    },


}