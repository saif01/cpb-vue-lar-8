<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Our Vision</h2>
                        <ol>
                            <li>
                                <router-link :to="{name:'index'}">Home</router-link>
                            </li>
                            <li>About / Our Vision</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="features">
                <div class="container">

                    <div class="section-title">
                        <h2>Vision</h2>
                        <p>C.P.Bangladesh Co. Ltd. Vision</p>
                    </div>

                    <div class="row" v-if="allData">
                        <div class="col-md-5" data-aos="fade-left">

                            <img v-if="allData.image" :src="'/images/vision/'+allData.image" class="img-fluid"
                                alt="CPB-Image">
                            <img v-else :src="'/all-assets/front-end/img/features-1.svg'" class="img-fluid"
                                alt="CPB-Image">

                        </div>
                        <div class="col-md-7 pt-4" data-aos="fade-right">
                            <h3>{{ allData.title }}</h3>
                            <div v-html="allData.details"></div>
                        </div>
                    </div>


                </div>
            </section>

        </main><!-- End #main -->
    </div>
</template>


<script>
    export default {

        data() {
            return {
                allData: '',
            }
        },

        methods: {

            getDirectData() {
                axios.get('/api/vision').then(res => {
                    //console.log(res.data)
                    if (res.status == 200) {
                        this.allData = res.data
                        //console.log(this.allData.data)
                    } else {
                        console.log(res.data)
                    }

                })
            },
        },

        mounted() {
            // Store Visitor Log
            this.$store.dispatch('visitor_log')
        },


        created() {
            this.$Progress.start();
            this.getDirectData();
            //console.log('Vison Component');
            this.$Progress.finish();

        },


    }

</script>
