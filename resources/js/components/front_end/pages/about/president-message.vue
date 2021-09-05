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

</style>

<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>President Message</h2>
                        <ol>
                            <li>
                                <router-link :to="{name:'index'}">Home</router-link>
                            </li>
                            <li>About / President Message</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="features pb-5">
                <div class="container">

                    <div class="section-title">
                        <h2>President Message</h2>
                        <p>C.P.Bangladesh Co. Ltd. President Message</p>
                    </div>

                    <div class="card border-0" v-if="allData">

                        <div class="card-header text-center">
                            <img :src="'images/president/small/'+allData.image" data-aos="zoom-in" class="picture"
                                alt="CPB">
                        </div>
                        <div class="card-body text-center">
                            <h4 class="card-title colorthm-1">{{ allData.title }}</h4>

                            <div>
                                <div class="first-letter" v-html="allData.details"></div>
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

        name: 'PresidentMessage',

        data() {
            return {
                allData: '',
            }
        },

        methods: {

            getDirectData() {
                axios.get('/api/president_message').then(res => {

                    if (res.status == 200) {
                        this.allData = res.data
                        // console.log(this.allData)
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
            //console.log('president_message Component');
            this.$Progress.finish();

        },


    }

</script>
