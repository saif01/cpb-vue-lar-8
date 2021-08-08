<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>C.P. Bangladesh Business</h2>
                        <ol>
                            <li>
                                <router-link to="/">Home</router-link>
                            </li>
                            <li>{{ allData.name }} Business</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="portfolio-details">
                <div class="container">

                    <div class="portfolio-details-container">
                        <div class="portfolio-details-carousel">

                            <b-carousel id="carousel-no-animation" style="text-shadow: 0px 0px 2px #000" no-animation
                                controls indicators img-width="1110" img-height="480">
                                <b-carousel-slide v-if="allData.image"
                                    :img-src="'images/business/1110-450/'+allData.image" class="img-fluid"
                                    alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="allData.image2"
                                    :img-src="'images/business/1110-450/'+allData.image2" class="img-fluid"
                                    alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="allData.image3"
                                    :img-src="'images/business/1110-450/'+allData.image3" class="img-fluid"
                                    alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="allData.image4"
                                    :img-src="'images/business/1110-450/'+allData.image4" class="img-fluid"
                                    alt="CPB-Business">
                                </b-carousel-slide>
                                <b-carousel-slide v-if="allData.image5"
                                    :img-src="'images/business/1110-450/'+allData.image5" class="img-fluid"
                                    alt="CPB-Business">
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
            </section>



        </main>
    </div>
</template>

<script>
    export default {

        //props: ['data'],

        data() {
            return {
                currentId: '',
                allData: '',
            }

        },

        methods: {

            async getDirectData(id) {
                console.log('runnn' + id)
                const res = await this.callApi('get', '/api/business_by_id/' + id)
                console.log('runnn-after : ' + res.data)
                if (res.status == 200) {
                    this.allData = res.data
                } else {
                    console.log(res)
                }
            },

        },



        // mounted() {
        //     console.log(this.$route.query.id)     
        // },

        watch: {

            // make change by url data
            // '$route.query.id': {
            //     handler: function(id) {
            //         if(id){
            //             this.currentId = id;
            //         }
            //        // console.log('watch id : ' + id)
            //     },
            //     deep: true,
            //     // Will fire as soon as the component is created
            //     immediate: true
            // },

            // make change by url data
            '$route.query.data': {
                handler: function (data) {
                    if (data.name) {
                        this.allData = data;
                        console.log('watch if data : ' + this.$route.query.id)

                    } else {
                        this.getDirectData(this.$route.query.id)
                        console.log('watch else data : ' + this.$route.query.id)
                    }

                },
                deep: true,
                // Will fire as soon as the component is created
                immediate: true
            }

        },


        // created() {

        //     if(this.$route.query.data.name){

        //         this.allData = this.$route.query.data

        //         console.log('created - ifff')

        //     }else{

        //        console.log('created - else')
        //        this.getDirectData(this.$route.query.id)
        //     }

        // },

    }

</script>


<style>
    .portfolio {
        padding-bottom: 60px;
    }

    .portfolio #portfolio-flters {
        padding: 0;
        margin: 0 0 35px 0;
        list-style: none;
        text-align: center;
    }

    .portfolio #portfolio-flters li {
        cursor: pointer;
        margin: 0 12px 5px 12px;
        display: inline-block;
        padding: 0 4px 6px 4px;
        font-size: 16px;
        font-weight: 500;
        line-height: 20px;
        color: #444;
        transition: all 0.3s ease-in-out;
        border-bottom: 2px solid #fff;
        font-family: "Roboto", sans-serif;
    }

    .portfolio #portfolio-flters li:hover,
    .portfolio #portfolio-flters li.filter-active {
        border-color: #68A4C4;
        color: #68A4C4;
    }

    .portfolio .portfolio-item {
        background: #1e4356;
        overflow: hidden;
        min-height: 200px;
        position: relative;
        border-radius: 4px;
        margin: 0 0 30px 0;
    }

    .portfolio .portfolio-item img {
        transition: all 0.3s ease-in-out;
    }

    .portfolio .portfolio-item .portfolio-info {
        opacity: 0;
        position: absolute;
        transition: all .3s linear;
        text-align: center;
        top: 10%;
        left: 0;
        right: 0;
    }

    .portfolio .portfolio-item .portfolio-info h3 {
        font-size: 22px;
    }

    .portfolio .portfolio-item .portfolio-info h3 a {
        color: #fff;
        font-weight: bold;
    }

    .portfolio .portfolio-item .portfolio-info a i {
        color: rgba(255, 255, 255, 0.6);
        font-size: 28px;
        transition: 0.3s;
    }

    .portfolio .portfolio-item .portfolio-info a i:hover {
        color: white;
    }

    .portfolio .portfolio-item:hover img {
        opacity: 0.6;
        transform: scale(1.1);
    }

    .portfolio .portfolio-item:hover .portfolio-info {
        opacity: 1;
        top: calc(50% - 30px);
    }

    /*--------------------------------------------------------------
# Portfolio Details
--------------------------------------------------------------*/
    .portfolio-details {
        padding-top: 40px;
    }

    .portfolio-details .portfolio-details-container {
        position: relative;
    }

    .portfolio-details .portfolio-details-carousel {
        position: relative;
        z-index: 1;
    }

    .portfolio-details .portfolio-details-carousel .owl-nav,
    .portfolio-details .portfolio-details-carousel .owl-dots {
        margin-top: 5px;
        text-align: left;
    }

    .portfolio-details .portfolio-details-carousel .owl-dot {
        display: inline-block;
        margin: 0 10px 0 0;
        width: 12px;
        height: 12px;
        border-radius: 50%;
        background-color: #ddd !important;
    }

    .portfolio-details .portfolio-details-carousel .owl-dot.active {
        background-color: #68A4C4 !important;
    }

    .portfolio-details .portfolio-info {
        padding: 30px;
        position: absolute;
        right: 0;
        bottom: -70px;
        background: #fff;
        box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
        z-index: 2;
    }

    .portfolio-details .portfolio-info h3 {
        font-size: 22px;
        font-weight: 700;
        margin-bottom: 20px;
        padding-bottom: 20px;
        border-bottom: 1px solid #eee;
    }

    .portfolio-details .portfolio-info ul {
        list-style: none;
        padding: 0;
        font-size: 15px;
    }

    .portfolio-details .portfolio-info ul li+li {
        margin-top: 10px;
    }

    .portfolio-details .portfolio-description {
        padding-top: 50px;
    }

    .portfolio-details .portfolio-description h2 {
        width: 50%;
        font-size: 26px;
        font-weight: 700;
        margin-bottom: 20px;
    }

    .portfolio-details .portfolio-description p {
        padding: 0 0 0 0;
    }

    @media (max-width: 768px) {
        .portfolio-details .portfolio-description h2 {
            width: 100%;
        }

        .portfolio-details .portfolio-info {
            position: static;
            margin-top: 30px;
        }
    }

</style>
