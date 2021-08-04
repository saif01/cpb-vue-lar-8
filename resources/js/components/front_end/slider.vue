<template>
            <div>
                <b-carousel id="carousel-1" v-model="slide" :interval="4000" controls indicators background=""
                    :img-width="window.width" :img-height="window.height" class="slider-test" style="background: linear-gradient(to left, #7700aa, #8800ff)"
                    @sliding-start="onSlideStart" @sliding-end="onSlideEnd">
                 

                    <!-- Slide with blank fluid image to maintain slide aspect ratio -->
                    <b-carousel-slide caption="" img-blank img-alt="">
                        <h1>Hello world!</h1>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eros felis, tincidunt
                            a tincidunt eget, convallis vel est. Ut pellentesque ut lacus vel interdum.
                        </p>
                    </b-carousel-slide>

                     <!-- Slide with blank fluid image to maintain slide aspect ratio -->
                    <b-carousel-slide caption="" img-blank img-alt="">
                        <h1>Hello world! 2</h1>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eros felis, tincidunt
                            a tincidunt eget, convallis vel est. Ut pellentesque ut lacus vel interdum. 22
                        </p>
                    </b-carousel-slide>

                    <b-carousel-slide caption="" img-blank img-alt="">
                        <h1>Hello world! 3</h1>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eros felis, tincidunt
                            a tincidunt eget, convallis vel est. Ut pellentesque ut lacus vel interdum. 33
                        </p>
                    </b-carousel-slide>


                </b-carousel>
            </div>
</template>



<script>
  export default {
    data() {
      return {
        slide: 0,
        sliding: null,

      }
    },

    methods: {
      onSlideStart(slide) {
        this.sliding = true
      },
      onSlideEnd(slide) {
        this.sliding = false
      },

   
    },

 
    created() {
      
    },
   


  }
</script>


<style>

.slider-test{
    text-shadow: 1px 1px 2px #333;
}


.carousel-caption{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    text-align: center;
    bottom: 0;
    top: 0;
    left: 0;
    right: 0;
}


</style>