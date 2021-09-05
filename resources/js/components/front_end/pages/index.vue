<template>
    <div>
           <section id="hero" class="d-flex justify-cntent-center align-items-center">
            <div id="heroCarousel" class="container carousel carousel-fade" data-ride="carousel">

                <!-- Slide 1 -->
                <div class="carousel-item active">
                    <div class="carousel-container">
                        <h2 class="animate__animated animate__fadeInDown">Welcome to <span>C.P. Bangladesh</span></h2>
                        <p class="animate__animated animate__fadeInUp h4">Kitchen of Bangladesh</p>
                    </div>
                </div>

                <!-- Slide 2 -->
                <div class="carousel-item">
                    <div class="carousel-container">
                        <h2 class="animate__animated animate__fadeInDown">Welcome to <span>C.P. FEED</span></h2>
                        <p class="animate__animated animate__fadeInUp h4">Believe in quality</p>
                    </div>
                </div>

                <!-- Slide 3 -->
                <div class="carousel-item">
                    <div class="carousel-container">
                        <h2 class="animate__animated animate__fadeInDown">Welcome to <span>C.P. FOOD</span></h2>
                        <p class="animate__animated animate__fadeInUp h4">Food Enriched Life</p>
                    </div>
                </div>

                <!-- Slide 4 -->
                <div class="carousel-item">
                    <div class="carousel-container">
                        <h2 class="animate__animated animate__fadeInDown">Welcome to <span>C.P. FARM</span></h2>
                        <p class="animate__animated animate__fadeInUp h4">Believe in quality</p>
                    </div>
                </div>



                <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon bx bx-chevron-left" aria-hidden="true"> <i class="fas fa-angle-left"></i> </span>
                    <span class="sr-only">Previous</span>
                </a>

                <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon bx bx-chevron-right" aria-hidden="true"> <i class="fas fa-angle-right"></i> </span>
                    <span class="sr-only">Next</span>
                </a>

            </div>

        </section>


        <div class="container">
            <div class="row" data-aos="fade-up">
                <div data-aos="slide-left" class="col-6" >
                    <b-embed type="video" tag="div" controls poster="all-assets/front-end/img/bg/song-bg.jpg" :title="'CP Food Production Process in Bangladesh'">
                        <source
                            :src="'all-assets/front-end/videos/CP Food Production Process in Bangladesh.mp4'"
                            type="video/mp4" >
                    </b-embed>
                </div>
                <div data-aos="slide-right" class="col-6"  > 
                    <b-embed type="video" tag="div" controls poster="all-assets/front-end/img/bg/video-bg.jpg" :title="'CP Bangladesh CP way Song ( সিপি ওয়ে গান )'">
                        <source :src="'all-assets/front-end/song/CPwaySong.mp3'" type="audio/mpeg">
                    </b-embed>
                </div>

            </div>

        </div>


        <!-- ======= Map Section ======= -->
        <mapview></mapview>
        <!-- End Map Section -->

    </div>
</template>


<script>
    import mapview from './common/map.vue';

    export default {

        name:'Home',
        
        data(){
            return {
              
            }
        },

        components:{
            mapview
        }
    }

</script>