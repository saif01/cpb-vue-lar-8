<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>C.P. Bangladesh Business</h2>
                        <ol>
                            <li>
                                <router-link :to="{name:'index'}">Home</router-link>
                            </li>
                            <li>Farm Business</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="portfolio-details">
                <div class="container" v-if="allData.length">

                    <div class="portfolio-details-container">
                        <div class="portfolio-details-carousel">

                            <b-carousel id="carousel-no-animation" style="text-shadow: 0px 0px 2px #000" no-animation
                                controls indicators img-width="1110" img-height="480">
                                <b-carousel-slide v-if="allData.image" :img-src="'images/business/'+allData.image"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="allData.image2" :img-src="'images/business/'+allData.image2"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="allData.image3" :img-src="'images/business/'+allData.image3"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="allData.image4" :img-src="'images/business/'+allData.image4"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="allData.image5" :img-src="'images/business/'+allData.image5"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                            </b-carousel>

                        </div>

                        <div class="portfolio-info" data-aos="zoom-in-down">
                            <h3>{{ allData.title }}</h3>
                            <ul>
                                <li><strong>Name</strong>: {{ allData.name }}</li>
                                <li><strong>Project URL</strong>: <a :href="allData.website"
                                        target="_blank">{{ allData.website }}</a></li>
                            </ul>
                        </div>

                    </div>

                    <div class="portfolio-description" data-aos="fade-up">
                        <h2>{{ allData.title }} Detail</h2>
                        <div v-html="allData.details"></div>

                    </div>
                </div>
                <div v-else>
                    <h1 class="text-danger text-center">Sorry !! Data Not Available</h1>
                </div>
            </section>



        </main>
    </div>
</template>

<script>
    export default {

        //props: ['data'],

        name: 'Business',

        data() {
            return {
                allData: '',
            }

        },

        methods: {

            async getDirectData() {

                const res = await this.callApi('get', '/api/business/farm')
                console.log('runnn-after : ' + res.data)
                if (res.status == 200) {
                    this.allData = res.data
                } else {
                    console.log(res)
                }
            },

        },


        mounted(){
            // Store Visitor Log
            this.$store.dispatch('visitor_log')
        },




        created() {

            this.$Progress.start();

            this.getDirectData();
            console.log('Feed Component');

            this.$Progress.finish();

        },

    }

</script>
