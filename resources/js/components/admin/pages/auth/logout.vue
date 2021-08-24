<template>
    <div class="p-5 my-5">
         
        <p class="text-center"><i class="fas fa-spinner fa-pulse text-success fa-10x"></i></p>
              
    </div>
</template>

<script>

export default {

   

    methods: {

        logout(adminUserId){
            // axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.adminToken;
            // Check Authentication
            axios.post('/api/admin_logout', {id: adminUserId}).then((response) => {
               
                console.log('Admin Logout Request')
                
            }).catch((errors) => {
                console.log(errors);
            })
        }

    },


    mounted(){
        console.log('Logout Component', this.adminUser)
        if(this.adminUser){
            this.logout(this.adminUser.id);
        }

        this.clearSessionStorage('admin_auth_token');

        // Store update
        this.$store.commit('setAdminAuthToken', null)
        // store update
        this.$store.commit('setAdminUser', null)


        // Redirect to dashboard
        this.$router.push({name: 'admin_login'})
    },

    
    created() {
     
    },
}

</script>
