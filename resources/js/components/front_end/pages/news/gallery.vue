<template>
    <div>

        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Our Photo Gallery</h2>
                        <ol>
                            <li>
                                <router-link :to="{name:'index'}">Home</router-link>
                            </li>
                            <li>News / Photo Gallery</li>
                        </ol>
                    </div>

                </div>
            </section>

            <section class="pb-4 pt-0" v-if="allData.data">
                <div class="container">
                    <div class="float-right small">Showing {{ dataShowFrom }} to {{ dataShowTo }} out of
                        {{ totalValue }} items</div><br>
                    <div class="pagination justify-content-end">
                        <pagination :data="allData" @pagination-change-page="getGalleryData"
                            class="justify-content-end">
                            <span slot="prev-nav">&lt; Previous</span>
                            <span slot="next-nav">Next &gt;</span>
                        </pagination>
                    </div>
                </div>

                <div class="container">

                    <CoolLightBox :items="images" :index="index" @close="index = null">
                    </CoolLightBox>
                    <div class="row images-wrapper">
                        <div class="image my-1 rounded mx-auto d-block hober-effect"
                            v-for="(image, imageIndex) in images" :key="imageIndex" @click="index = imageIndex"
                            :style="{ backgroundImage: 'url(' + image.thumb + ')' }">
                        </div>
                    </div>

                </div>
                <div class="container">
                    <div class="float-right small">Showing {{ dataShowFrom }} to {{ dataShowTo }} out of
                        {{ totalValue }} items</div><br>
                    <div class="pagination justify-content-end">
                        <pagination :data="allData" @pagination-change-page="getGalleryData"
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
            <!-- <h1 v-if="!totalValue && !dataLoading" class="text-danger text-center">Sorry !! Data Not Available</h1> -->


        </main>

    </div>
</template>


<script>
    import CoolLightBox from "vue-cool-lightbox";
    import "vue-cool-lightbox/dist/vue-cool-lightbox.min.css";

    export default {
        name: 'Gallery',
        components: {
            // vue-cool-lightbox 
            CoolLightBox,
        },

        data() {
            return {

                // DataTbl Common Featurs 
                paginate: 12,
                dataLoading: true,
                // vue-cool-lightbox
                images: [],
                index: null,

            }
        },

        methods: {

            // Get table data
            getGalleryData(page = 1) {
                axios.get('/api/news/gallery/index?page=' + page +
                        '&paginate=' + this.paginate +
                        '&search=' + this.search +
                        '&sort_direction=' + this.sort_direction +
                        '&sort_field=' + this.sort_field
                    )
                    .then(response => {
                        //console.log(response.data.data);
                        //console.log(response.data.from, response.data.to);
                        this.allData = response.data;
                        this.totalValue = response.data.total;
                        this.dataShowFrom = response.data.from;
                        this.dataShowTo = response.data.to;
                        // Set data vue-cool-lightbox
                        this.images = response.data.data;
                        // Loading Animation
                        this.dataLoading = false;

                    });
            },



        },

        mounted() {
            // Store Visitor Log
            this.$store.dispatch('visitor_log')
        },

        created() {
            this.$Progress.start();
            // Fetch initial results
            this.getGalleryData();
            this.$Progress.finish();
        },



    }

</script>


<style scoped>
    .image {
        height: 200px;
        width: 272px;
    }

    .hober-effect:hover {
        opacity: 0.6;
        transform: scale(1.1);
        transition: all 0.3s ease-in-out;
        cursor: pointer;
    }

</style>
