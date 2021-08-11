<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>All Histories</h2>
                        <ol>
                            <li>
                                <router-link to="/">Home</router-link>
                            </li>
                            <li>About / Histories</li>
                        </ol>
                    </div>

                </div>
            </section>




            <div class="container">
                <div class="timeline">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="main-timeline">

                                <div data-aos="fade-up" class="timeline" v-for="(item, index) in allData" :key="index">
                                    <a href="#" class="timeline-content">
                                        <span class="timeline-year">{{ item.year }}</span>
                                        <div class="timeline-icon">
                                            <!-- <i class="fa fa-globe"></i> -->
                                             <img :src="'images/history/small/'+item.image" class="rounded" alt="Image"
                                    style="max-height: 50px;">
                                        </div>
                                        <h3 class="title">{{ item.title }}</h3>
                                      
                                        <div class="description" v-html="item.details"></div>
                                    
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>
            </div>



        </main><!-- End #main -->
    </div>
</template>

<script>
    export default {

        name:'Histories',
        
        data() {
            return {
                allData: {},
            }
        },

        methods: {

            getDirectData() {
                axios.get('/api/history').then(res => {
                    //console.log(res.data)
                    if (res.status == 200) {
                        this.allData = res.data
                    } else {
                        console.log(res.data)
                    }

                    // console.log(this.allData.length)

                })
            },




        },


        mounted() {
            this.$Progress.start();
            this.getDirectData();
            console.log('Mission Component');
            this.$Progress.finish();
        },


    }

</script>


<style scoped>
    .main-timeline {
        font-family: 'Roboto', sans-serif;
        position: relative;
    }

    .main-timeline:after {
        content: '';
        display: block;
        clear: both;
    }

    .main-timeline .timeline {
        width: 60%;
        padding: 0 30px 0 0;
        margin: 20px 0;
        float: left;
    }

    .main-timeline .timeline-content {
        background-color: #536E79;
        min-height: 133px;
        padding: 30px 95px 30px 130px;
        display: block;
        position: relative;
        z-index: 1;
    }

    .main-timeline .timeline-content:hover {
        text-decoration: none;
    }

    .main-timeline .timeline-content:before {
        content: '';
        background: #fff;
        border-radius: 100px 20px 20px 100px;
        position: absolute;
        left: 70px;
        top: 10px;
        bottom: 10px;
        right: -30px;
        z-index: -1;
    }

    .main-timeline .timeline-year {
        color: #fff;
        font-size: 45px;
        font-weight: 600;
        line-height: 45px;
        transform: translateY(-50%) rotate(-90deg);
        position: absolute;
        left: -15px;
        top: 50%;
    }

    .main-timeline .timeline-icon {
        color: #fff;
        background-color: #536E79;
        font-size: 60px;
        text-align: center;
        line-height: 100px;
        width: 100px;
        height: 100px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
        transform: translateY(-50%);
        position: absolute;
        right: -20px;
        top: 50%;
    }

    .main-timeline .title {
        color: #536E79;
        font-size: 22px;
        font-weight: 600;
        text-transform: uppercase;
        margin: 0 0 7px 0;
    }

    .main-timeline .description {
        color: #817f7f;
        font-size: 15px;
        margin: 0;
    }

    .main-timeline .timeline:nth-child(even) {
        padding: 0 0 0 30px;
        float: right;
    }

    .main-timeline .timeline:nth-child(even) .timeline-content {
        padding: 30px 130px 30px 95px;
    }

    .main-timeline .timeline:nth-child(even) .timeline-content:before {
        border-radius: 20px 100px 100px 20px;
        left: -30px;
        right: 70px;
    }

    .main-timeline .timeline:nth-child(even) .timeline-year {
        right: -15px;
        left: auto;
    }

    .main-timeline .timeline:nth-child(even) .timeline-icon {
        right: auto;
        left: -20px;
    }

    .main-timeline .timeline:nth-child(4n+2) .timeline-content,
    .main-timeline .timeline:nth-child(4n+2) .timeline-icon {
        background-color: #00B8D4;
    }

    .main-timeline .timeline:nth-child(4n+2) .title {
        color: #00B8D4;
    }

    .main-timeline .timeline:nth-child(4n+3) .timeline-content,
    .main-timeline .timeline:nth-child(4n+3) .timeline-icon {
        background-color: #FEA726;
    }

    .main-timeline .timeline:nth-child(4n+3) .title {
        color: #FEA726;
    }

    .main-timeline .timeline:nth-child(4n+4) .timeline-content,
    .main-timeline .timeline:nth-child(4n+4) .timeline-icon {
        background-color: #01BFA5;
    }

    .main-timeline .timeline:nth-child(4n+4) .title {
        color: #01BFA5;
    }

    @media screen and (max-width:767px) {

        .main-timeline .timeline,
        .main-timeline .timeline:nth-child(even) {
            text-align: center;
            width: 100%;
            padding: 0 0 30px 0;
            margin: 0 0 30px;
        }

        .main-timeline .timeline-content,
        .main-timeline .timeline:nth-child(even) .timeline-content {
            padding: 80px 25px;
        }

        .main-timeline .timeline-content:before,
        .main-timeline .timeline:nth-child(even) .timeline-content:before {
            border-radius: 50px 50px 20px 20px;
            bottom: -30px;
            top: 65px;
            left: 10px;
            right: 10px;
        }

        .main-timeline .timeline-year,
        .main-timeline .timeline:nth-child(even) .timeline-year {
            transform: translateX(-50%) translateY(0);
            top: 10px;
            left: 50%;
        }

        .main-timeline .timeline-icon,
        .main-timeline .timeline:nth-child(even) .timeline-icon {
            font-size: 50px;
            line-height: 85px;
            width: 85px;
            height: 85px;
            transform: translateX(-50%);
            top: auto;
            bottom: -20px;
            right: auto;
            left: 50%;
        }
    }

    @media screen and (max-width:576px) {
        .main-timeline .title {
            font-size: 18px;
        }
    }


    .main-timeline .timeline-icon{
        font-size: inherit !important;
    }

</style>
