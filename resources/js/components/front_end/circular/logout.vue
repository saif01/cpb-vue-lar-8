<template>
    <div class="p-5 my-5">
         
        <p class="text-center"><i class="fas fa-spinner fa-pulse text-success fa-10x"></i></p>
              
    </div>
</template>

<script>

export default {


    methods: {

        logout(userId){
            // axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.adminToken;
            // Check Authentication
            axios.post('/api/circular_logout', {id: userId}).then((response) => {
               
                console.log('Logout Request')
                
            }).catch((errors) => {
                console.log(errors);
            })
        }

    },


    mounted(){
        console.log('Logout Component', this.user)
        if(this.user.id){
            this.logout(this.user.id);
        }

        // Remove localstorage
        localStorage.clear();

        // Store update
        this.$store.commit('setAuthToken', null)
        // store update
        this.$store.commit('setUser', null)


        // Redirect to dashboard
        this.$router.push({ name:'index'});

    },



    created() {
        // this.$store.dispatch('userLogout');
        // // Redirect to dashboard
        // this.$router.push('/');

    },
    
}
</script>
