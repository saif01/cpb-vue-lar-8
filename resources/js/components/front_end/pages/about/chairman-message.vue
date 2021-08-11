<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Chairman Message</h2>
                        <ol>
                            <li>
                                <router-link to="/">Home</router-link>
                            </li>
                            <li>About / Chairman Message</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="features pb-5">
                <div class="container">

                    <div class="section-title">
                        <h2>Chairman Message</h2>
                        <p>C.P.Bangladesh Co. Ltd. Chairman Message</p>
                    </div>

                    <div class="card border-0" v-if="allData">

                        <div class="card-header text-center">
                            <img :src="'images/chairman/small/'+allData.image" data-aos="zoom-in" class="picture"
                                alt="CPB">
                        </div>
                        <div class="card-body text-center" >
                            <h4 class="card-title colorthm-1">{{ allData.title }}</h4>

                            <div class="watermark">
                                <p class="first-letter msg-bg" v-html="allData.details"></p>
                            </div>

                        </div>

                    </div>

                </div>
            </section>

        </main>
    </div>
</template>


<script>
    export default {
   
        name:'Chairman Message',

        data() {
            return {
                allData: '',
            }
        },

        methods: {

            getDirectData() {
                axios.get('/api/chairman_message').then(res => {

                    if (res.status == 200) {
                        this.allData = res.data
                        // console.log(this.allData)
                    } else {
                        console.log(res.data)
                    }

                })
            },
        },


        created() {
            this.$Progress.start();

            this.getDirectData();
            console.log('president_message Component');

            this.$Progress.finish();

        },


    }

</script>



<style scoped>
    .picture {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        background: #147219;
        padding: 2px;

    }

    .first-letter::v-deep p::first-letter {  
        font-size: 300%;
        color: #147219;
        margin-left: 30px; 
        }

     /* .first-letter::v-deep p{
        content: ""; 
        position: absolute;
        top: 50%;
        left: 50%;
        width: 100%;
        height: 100%;
        transform: translate(-50%, -50%);
        z-index: -5; 
        opacity: 0.05;
        background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70" width="70" height="70"><rect x="0" y="40" width="30" height="30"></rect><path d="M 0 40 q 0 -40 30 -40 v 15 q -15 0 -15 25"></path><rect x="40" y="40" width="30" height="30"></rect><path d="M 40 40 q 0 -40 30 -40 v 15 q -15 0 -15 25"></path></svg>'),
            url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70" width="70" height="70" transform="rotate(180)"><rect x="0" y="40" width="30" height="30"></rect><path d="M 0 40 q 0 -40 30 -40 v 15 q -15 0 -15 25"></path><rect x="40" y="40" width="30" height="30"></rect><path d="M 40 40 q 0 -40 30 -40 v 15 q -15 0 -15 25"></path></svg>');
        background-position: 20% 20%, 80% 80%;
        background-repeat: no-repeat;
    } */

    .watermark {
  /* width: 300px;
  height: 100px; */
  display: block;
  position: relative;
}

.watermark::before, .watermark::after {
  content: "";
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  position: absolute;
  z-index: -1; 
}

.watermark::before {
  background:#C52F11;
}

.watermark::after {
 background: url(https://www.google.com/images/srpr/logo11w.png) no-repeat;
  opacity: 0.2;
}

</style>





