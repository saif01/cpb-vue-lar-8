<template>
    <div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-6">
                        <h3 class="card-title">Admins Login Logs Table</h3>
                    </div>
                    <div class="col-6">

                    </div>

                </div>
            </div>

            <div class="card-body">
                <div v-if="allData.data" class="table-responsive">
                    <div class="row mb-2">
                        <div class="col form-inline small">
                            <select v-model="paginate" class="form-control form-control-sm">
                                <option value="10">10</option>
                                <option value="30">30</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                        </div>

                        <div class="col">
                            <input v-model="search" class="form-control form-control-sm" type="text"
                                placeholder="Search by any data at the table...">
                        </div>
                    </div>

                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>
                                    <a href="#" @click.prevent="change_sort('id')">ID</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'id'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'id'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('status')">Status</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'status'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'status'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('login')">login ID</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'login'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'login'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('ip')">IP</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'ip'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'ip'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('country')">Country</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'country'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'country'">&darr;</span>
                                </th>
                                 <th>
                                    <a href="#" @click.prevent="change_sort('created_at')">Visite Date</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'created_at'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'created_at'">&darr;</span>
                                </th>
                                 <th>
                                    <a href="#" @click.prevent="change_sort('device')">Device</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'device'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'device'">&darr;</span>
                                </th>
                                 <th>
                                    <a href="#" @click.prevent="change_sort('browser')">Browser</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'browser'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'browser'">&darr;</span>
                                </th>
                                 <th>
                                    <a href="#" @click.prevent="change_sort('platform')">Platform</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'platform'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'platform'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('count')">Count</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'count'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'count'">&darr;</span>
                                </th>
                              
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="singleData in allData.data" :key="singleData.id">
                                <td>{{ singleData.id }}</td>
                                 <td>
                                     <span v-if="singleData.status" class="text-success">Success</span>
                                     <span v-else class="text-danger">Failed</span>
                                 </td>
                                <td class="text-center"> 
                                    <span v-if="singleData.user">{{ singleData.user.login }}
                                        <span v-if="singleData.user.image">
                                            <img :src="'/images/admin/small/' + singleData.user.image" alt="Image" height="80" width="80">
                                        </span>
                                    </span> 
                                    <span v-else>Not-Found</span>
                                </td>
                                <td>{{ singleData.ip }}</td>
                                <td>{{ singleData.country }}</td>
                                <td>{{ singleData.created_at | moment("ddd, MMMM Do YYYY, h:mm:ss a")  }} </td>
                                <td>{{ singleData.device }}</td>
                                <td>{{ singleData.browser }} - {{ singleData.browser_version }}</td>
                                <td>{{ singleData.platform }} - {{ singleData.platform_version }}</td>
                                <td>{{ singleData.count }}</td>
                               
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <span>Total Records: {{ totalValue }}</span>
                    </div>
                    <pagination :data="allData" @pagination-change-page="getResults" class="justify-content-end">
                        <span slot="prev-nav">&lt; Previous</span>
                        <span slot="next-nav">Next &gt;</span>
                    </pagination>
                </div>
                <div v-else>
                    <div v-if="dataLoading" class="p-5 my-5">
                        <p class="text-center"><i class="fas fa-spinner fa-pulse text-success fa-10x"></i></p>
                    </div>
                </div>
                <h1 v-if="!totalValue && !dataLoading" class="text-danger text-center">Sorry !! Data Not Available</h1>

            </div>
        </div>





    </div>

</template>


<script>
    export default {

        data() {

            return {

                //current page url
                currentUrl: '/api/admin/login',

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
