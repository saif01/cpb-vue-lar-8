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
                            <li>Feed Business</li>
                        </ol>
                    </div>

                </div>
            </section>

            <section class="portfolio-details">
                <div class="container" v-if="businessdata">

                    <div class="portfolio-details-container">
                        <div class="portfolio-details-carousel">

                            <b-carousel id="carousel-no-animation" style="text-shadow: 0px 0px 2px #000" fade
                                controls indicators img-width="1110" img-height="480">
                                <b-carousel-slide v-if="businessdata.image" :img-src="imageAssetSrc+businessdata.image"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="businessdata.image2" :img-src="imageAssetSrc+businessdata.image2"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="businessdata.image3" :img-src="imageAssetSrc+businessdata.image3"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="businessdata.image4" :img-src="imageAssetSrc+businessdata.image4"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="businessdata.image5" :img-src="imageAssetSrc+businessdata.image5"
                                    class="img-fluid" alt="CPB-Business">
                                </b-carousel-slide>
                            </b-carousel>

                        </div>

                        <div class="portfolio-info" data-aos="zoom-in-down">
                            <h3>{{ businessdata.title }}</h3>
                            <ul>
                                <li><strong>Name</strong>: {{ businessdata.name }}</li>
                                <li><strong>Project URL</strong>: <a :href="businessdata.website"
                                        target="_blank">{{ businessdata.website }}</a></li>
                            </ul>
                        </div>

                    </div>

                    <div class="portfolio-description" data-aos="fade-up">
                        <h2>{{ businessdata.title }} Details</h2>

                        <div v-html="businessdata.details"></div>

                    </div>
                </div>

                <div>
                    <div v-if="dataLoading && !businessdata" class="p-5 my-5">
                        <p class="text-center"><i class="fas fa-spinner fa-pulse text-success fa-10x"></i></p>
                    </div>
                </div>
               

            </section>



        </main>
    </div>
</template>

<script>
import axios from 'axios'
    export default {
        //props: ['data'],
        name: 'Business',
        data() {
            return {

                imageAssetSrc : '/images/business/',

                businessdata:'',
                dataLoading:true,
            }

        },

        methods: {

            getDirectData(){
                //console.log('running business')
                axios.get('/api/business/feed')
                .then(response=>{
                    this.businessdata = response.data
                    //console.log('runnn-after : ' + response.data.name)
                    this.dataLoading = false;
                })
                .catch(error=>{
                    console.log(error)
                })
            }

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



<style>

blockquote{
  text-align:right;
  font-size: 1.4em;
  width:100%;
  margin:50px auto;
  font-style:normal;
  color: #555555;
  padding:1.2em 30px 1.2em 75px;
  border-bottom:8px solid #78C0A8 ;
  line-height:1.6;
  position: relative;
  background:#EDEDED;
  -webkit-box-shadow: 0px 10px 13px -7px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
  box-shadow: 0px 10px 13px -7px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
}

blockquote::before{
    font-size: 200px;
  font-family:Arial;
  content: "\201C";
  color:#78C0A8;
  position: absolute;
  left: 10px;
  top:-45px;
}


</style>
