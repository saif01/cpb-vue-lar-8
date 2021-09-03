<template>
    <div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-6">
                        <h3 class="card-title">User Table</h3>
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
                                <th> Image</th>
                                <th> CV</th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('name')">Name</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'name'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'name'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('email')">Email</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'email'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'email'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('contact')">Contact</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'contact'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'contact'">&darr;</span>
                                </th>

                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="singleData in allData.data" :key="singleData.id">
                                <td>{{ singleData.id }}</td>
                                <td>
                                     <span v-if="singleData.image">
                                                <img :src="imagePathSm + singleData.image" alt="Image" height="100"
                                                    width="100">
                                            </span>
                                            <span v-else class="text-danger"> No Image</span>
                                </td>
                                <td>
                                    <span v-if="singleData.document">
                                                <p>Document:</p>
                                                <a :href="'/images/recruit/' + singleData.document" download><i
                                                        class="fas fa-download"></i> CV</a>
                                            </span>
                                            <span v-else class="text-danger"> No CV</span>
                                </td>
                                <td>{{ singleData.name }}</td>
                                <td>{{ singleData.email }}</td>
                                <td>{{ singleData.contact }}</td>
                               

                                <td class="text-center">

                                    <button v-if="isDeletePermitted" @click="deleteData(singleData.id)" class="btn btn-danger btn-sm m-1"><i
                                            class="fa fa-trash red"></i> Delete</button>
                                </td>
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
                currentUrl: '/api/admin/user',

                imagePathSm: '/images/admin/small/',
                imagePath: '/images/admin/',
                imageMaxSize: '2111775',
              

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
