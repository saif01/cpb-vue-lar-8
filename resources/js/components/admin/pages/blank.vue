<template>
    <h1>Blank Page</h1>
</template>

<script>

export default {


    created() {
            this.$Progress.start();
            console.log('main_app created', this.adminToken)

           // this.authSetForAdmin();
        
            // Redirect to dashboard
            // this.$router.push({name: 'admin_login'})
            
            console.log('Admin Blank')
          
            this.$Progress.finish();
        },
}

</script>