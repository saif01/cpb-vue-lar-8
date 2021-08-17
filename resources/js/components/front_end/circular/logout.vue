<template>
    
</template>

<script>

export default {

    created() {
        this.$store.dispatch('userLogout');
        // Redirect to dashboard
        this.$router.push('/');

    },
    
}
</script>
