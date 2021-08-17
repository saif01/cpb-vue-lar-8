<template>
    <div>
    <main id="main">

        <section class="breadcrumbs">
            <div class="container">

                <div class="d-flex justify-content-between align-items-center">
                    <h2>Appiled</h2>
                    <ol>
                        <li>
                            <router-link to="/">Home</router-link>
                        </li>
                        <li>
                            <router-link to="/circular_index">Recruit</router-link>
                        </li>
                        <li>Appiled</li>
                    </ol>
                </div>

            </div>
        </section>


        <section class="contact">
            <div class="container">

                <div v-if="loading" class="row justify-content-center">
                    <div class="fa-4x text-success mt-3">
                        <i class="fas fa-spinner fa-pulse"></i>
                    </div>
                </div>
                <div v-if="!Object.keys(store_data).length && !loading" class="row justify-content-center">
                    <h3 class="text-danger">No Data Available</h3>
                </div>

                <div v-if="Object.keys(store_data).length" class="row justify-content-center">

                    <table class="table table-bordered table-striped">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Circular</th>
                                <th scope="col">Name</th>
                                <th scope="col">Apply Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item, index) in store_data" :key="index">
                                <th scope="row">{{ index + 1 }}</th>
                                <td>{{ item.circular.jobTitle }}</td>
                                <td>{{ item.user.name }}</td>
                                <td>{{ item.created_at }}</td>
                            </tr>
                        </tbody>
                    </table>

                </div>


            </div>
        </section>



    </main>
</div>

</template>

<script>

    // in full builds helpers are exposed as Vuex.mapState
    import { mapGetters } from 'vuex'

    export default {
        name: 'Applied',

        data(){

            return{
               
            }

        },

        methods:{

            // getDirectData() {
            //     this.loading = true;
            //     //axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.token
            //     //axios.post('/api/circular_job_applied', { user_id : this.user.id })

            //     axios.post('/api/circular_job_applied')
                
            //     .then(res => {
            //         //console.log('applied respose', res.data)
            //         if (res.status == 200) {
            //             this.allData = res.data;
            //             this.loading = false;
                        
            //         } else {
            //             console.log(res.data)
            //         }
            //     })
            // },

        },

        mounted() {
            //this.getDirectData();
        },


        created() {
            this.$Progress.start();
            console.log('Applied Component');
            if( !this.store_data.length ){
                this.$store.dispatch('recruitAppliedData')
            }
            this.$Progress.finish();
        },

        computed : {
            // map this.count to store.state.count
            ...mapGetters({
                'store_data' : 'getRecruitAppliedData', 
            })
        },


    }

</script>