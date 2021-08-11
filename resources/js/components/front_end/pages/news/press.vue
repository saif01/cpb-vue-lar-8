<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Our Press Releases</h2>
                        <ol>
                            <li><router-link to="/">Home</router-link></li>
                            <li>News / Press Releases</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="features">
                <div class="container">

                    <div class="row">
                        <div class="col">
                            <input v-model="search" class="form-control form-control-sm" type="text"
                                placeholder="Search ...">
                        </div>
                    </div>

                    <section class="about" v-if="allData.data">
                        <div class="container">

                            <div class="row" v-for="(item, index) in  allData.data" :key="index">
                                <div class="col-lg-6" data-aos="fade-left">
                                    <img :src="'images/press/'+item.image" class="img-fluid" alt="CPB">
                                </div>
                                <div class="col-lg-6 pt-4 pt-lg-0" data-aos="fade-right">
                                    <h3>{{ item.title }}</h3>
                                    <b class="float-right mx-2 text-muted"><i class='bx bx-calendar-event'></i>
                                        {{ item.date }} </b>
                                    <hr>
                                    <div v-html="item.details"></div>

                                    <hr>
                                    <a v-if="item.document" class="btn btn-sm btn-success float-right mt-2"
                                        :href="'images/press/'+item.document" download="PressNew"><i
                                            class='bx bx-download'></i> Documnet</a>

                                </div>
                            </div>

                        </div>
                        <div class="container">
                            <div class="float-right small">Showing {{ dataShowFrom }} to {{ dataShowTo }} out of
                                {{ totalValue }} items</div><br>
                            <div class="pagination justify-content-end">
                                <pagination :data="allData" @pagination-change-page="getResults"
                                    class="justify-content-end">
                                    <span slot="prev-nav">&lt; Previous</span>
                                    <span slot="next-nav">Next &gt;</span>
                                </pagination>
                            </div>
                        </div>
                    </section>

                    <div v-else>
                        <div v-if="dataLoading" class="p-5 my-5">
                            <p class="text-center"><i class="fas fa-spinner fa-pulse text-success fa-10x"></i></p>
                        </div>
                    </div>

                    <h1 v-if="!totalValue && !dataLoading" class="text-danger text-center">Sorry !! Data Not Available
                    </h1>

                </div>
            </section>

        </main>
    </div>
</template>


<script>
    export default {

        name:'Press',

        data() {
            return {
                // Loading Animation
                dataLoading: true,
                currentUrl: 'press',

            }
        },

        methods: {


        },

        mounted() {
            this.$Progress.start();
            // Fetch initial results
            this.getResults();
            this.$Progress.finish();
        },




    }

</script>
