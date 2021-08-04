<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Our Mission</h2>
                        <ol>
                            <li>
                                <router-link to="/">Home</router-link>
                            </li>
                            <li>About / Our Mission</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="features">
                <div class="container">

                    <div class="section-title">
                        <h2>Mission</h2>
                        <p>C.P.Bangladesh Co. Ltd. Mission</p>
                    </div>

                    
                    <!-- <carousel  v-for="(item, index) in allData" :key="index">

                        <p>{{ item.details }}</p> 
                           
                    </carousel> -->
                    <!-- <carousel :items="3" :loop="true">

                        <img src="https://placeimg.com/200/200/any?1">

                        <img src="https://placeimg.com/200/200/any?2">

                        <img src="https://placeimg.com/200/200/any?3">

                        <img src="https://placeimg.com/200/200/any?4">

                    </carousel> -->


                    <carousel-3d>
                        <slide v-for="(item, i) in slides" :key="i" :index="i">

                            <!-- {{ item.details }} -->
                            <img :src="'https://placeimg.com/200/200/any?'+i">

                        </slide>
                    </carousel-3d>


                </div>
            </section>


          

       

        </main><!-- End #main -->
        
 <!-- <carousel-3d>
         <slide v-for="(slide, i) in slides" :index="i" :key="i">
            <template slot-scope="{ index, isCurrent, leftIndex, rightIndex }">
                <img :data-index="index" :class="{ current: isCurrent, onLeft: (leftIndex >= 0), onRight: (rightIndex >= 0) }" :src="slide.src">
            </template>
        </slide>
</carousel-3d> -->

             

    </div>
</template>


<script>

  import carousel from 'vue-owl-carousel'

  import { Carousel3d, Slide } from 'vue-carousel-3d';



    export default {
        
        components: {
            carousel,
            
            Carousel3d,
            Slide,

            // 'carousel-3d': window['carousel-3d'].Carousel3d,
            // 'slide': window['carousel-3d'].Slide
        },

        data() {
            return {
                allData: '',
                slides: 7,
            }
        },

        methods: {

            getDirectData() {
                axios.get('/api/mission').then(res => {
                   // console.log(res.data)
                    if (res.status == 200) {
                        this.allData = res.data
                    } else {
                        console.log(res.data)
                    }

                })
            },
            

         

        },


        mounted() { 
            this.$Progress.start();
            this.getDirectData();
            console.log('Mission Component');
            this.$Progress.finish();

            // Testimonials carousel (uses the Owl Carousel library)
            // $(".testimonials-carousel").owlCarousel({
            //     autoplay: true,
            //     dots: true,
            //     loop: true,
            //     items: 1
            // });
        },


    }

</script>



<style scoped>

    svg { transition: color .5s ease; }

    .card {
        border: none;
        display: inline-block;
        width: 45%;
        padding: 4rem 1rem 7rem 1rem;
        background-color: teal;
        position: relative;
    }

    .card:after {
        content: "";
        display: block;
        width: 0px;
        height: 0px;
        background-color: skyblue;
        top: 0px;
        right: 0px;
        border-bottom: 20px solid #006767;
        border-left: 20px solid #006767;
        border-right: 20px solid white;
        border-top: 20px solid white;
        position: absolute;
        filter: drop-shadow(-5px 5px 3px rgba(0, 0, 0, 0.5));
    }

    .card:before {
        content: "";
        display: block;
        width: 0px;
        height: 0px;
        border-top: 40px solid #006767;
        border-right: 40px solid #006767;
        border-left: 40px solid white;
        border-bottom: 40px solid white;
        bottom: 0px;
        left: 0px;
        position: absolute;
        filter: drop-shadow(7px -7px 5px rgba(0, 0, 0, 0.5));
        margin-right: 10%;
    }

    .card:nth-of-type(1) {
        margin-right: 9%;
    }


    blockquote {
        padding: 20px 60px;
        background: #eee;
        border-radius: 10px;
        font-family: arial;
        line-height: 1.625;
        position: relative;
    }

    blockquote span {
        position: relative;
        display: inline-block;
    }

    blockquote span:before {
        content: "“";
        font-size: 72px;
        color: #79b83a;
        position: absolute;
        left: -40px;
        top: 40px;
        line-height: 0;
    }

    blockquote span:after {
        content: "”";
        font-size: 72px;
        color: #79b83a;
        position: absolute;
        right: -40px;
        bottom: -10px;
        line-height: 0;
    }

</style>
 