<template>
    <div>
        <main id="main">

            <section class="content-404">
                <div class="container text-center ">


                    <h1 class="head"><span>404</span></h1>
                    <p>Oops! The Page you requested was not found!</p>
                    <router-link :to="{name:'admin'}" class="btn-outline">Back to Admin</router-link>

                </div>
            </section>




        </main><!-- End #main -->
    </div>
</template>



<script>
   
    export default {
        data() {
            return {}
        },

        methods: {

        },

        mounted() {
            // Store Visitor Log
           // this.$store.dispatch('visitor_log')
        },


        created() {
            this.$Progress.start();

            console.log('404 Component');

            this.$Progress.finish();

        },


    }

</script>

