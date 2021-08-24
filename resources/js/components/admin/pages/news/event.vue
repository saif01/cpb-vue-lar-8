<template>
        <div class="col-md-12">

        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Category Table</h3>
                <button class="btn btn-primary btn-sm float-right"  @click="newModal"><i class="far fa-plus-square"></i>
                    Add</button>
            </div>
            <div class="card-body">
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
                                <a href="#" @click.prevent="change_sort('date')">Date</a>
                                <span v-if="sort_direction == 'desc' && sort_field == 'date'">&uarr;</span>
                                <span v-if="sort_direction == 'asc' && sort_field == 'date'">&darr;</span>
                            </th>
                             <th>
                                <a href="#" @click.prevent="change_sort('title')">Title</a>
                                <span v-if="sort_direction == 'desc' && sort_field == 'title'">&uarr;</span>
                                <span v-if="sort_direction == 'asc' && sort_field == 'title'">&darr;</span>
                            </th>
                             <th>
                                <a href="#" @click.prevent="change_sort('details')">Details</a>
                                <span v-if="sort_direction == 'desc' && sort_field == 'details'">&uarr;</span>
                                <span v-if="sort_direction == 'asc' && sort_field == 'details'">&darr;</span>
                            </th>

                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="singleData in allData.data" :key="singleData.id">
                            <td>{{ singleData.id }}</td>
                            <td>{{ singleData.date }}</td>
                            <td>{{ singleData.title }}</td>
                            <td class="text-center">
                                <span v-if="singleData.image">
                                    <img :src="imagePath + singleData.image" alt="Image" height="100" width="100">
                                </span>
                                <span v-else class="text-danger"> No Image</span>
                                <div v-html="singleData.details" ></div>
                            </td>
                            
                            <td class="text-center">
                                <button @click="editModal(singleData)" class="btn btn-warning btn-sm">
                                    <i class="fa fa-edit blue"></i> Edit
                                </button>
                                <button @click="deleteData(singleData.id)" class="btn btn-danger btn-sm"><i
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
        </div>



        <!-- Modal -->
        <div class="modal fade" id="addNew" tabindex="-1" role="dialog" aria-labelledby="addNew" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editmode">Create New Product</h5>
                        <h5 class="modal-title" v-show="editmode">Edit Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <form @submit.prevent="editmode ? updateData() : createData()">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="">Category Name</label>
                                <input type="text" v-model="form.name" class="form-control" placeholder="Category Name"
                                    :class="{ 'is-invalid': form.errors.has('name') }">
                                <div class="small text-danger" v-if="form.errors.has('name')"
                                    v-html="form.errors.get('name')" />
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <input type="file" @change='upload_image'
                                        :class="{ 'is-invalid': form.errors.has('image') }" name="image">
                                    <div class="small text-danger" v-if="form.errors.has('image')"
                                        v-html="form.errors.get('image')" />
                                    <div class="mt-1">
                                        <img :src="get_image()" height="100" width="100" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Form Progress Bar -->
                        <div v-if="form.progress" class="progress m-2">
                            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"
                                :aria-valuenow="form.progress.percentage" aria-valuemin="0" aria-valuemax="100"
                                :style="'width:'+form.progress.percentage+'%'"><i class="fas fa-spinner fa-pulse"></i>
                            </div>
                        </div>

                        <div class="modal-footer" v-if="!form.progress">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Create</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!-- End Modal -->

    </div>

</template>


<script>
    // vform
    import Form from 'vform';

    export default {

        data() { 

            return {

                //current page url
                currentUrl: '/api/admin/news/index',

                imagePathSm: '/images/event/small/',
                imagePath: '/images/event/',
                imageMaxSize: '2111775',

                // Form
                form: new Form({
                    id: '',
                    name: '',
                    image: '',
                }),

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