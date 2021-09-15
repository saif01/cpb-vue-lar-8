<template>
    <div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-4">
                        <h3 class="card-title">Gallery Table</h3>
                    </div>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-6">
                                <b-button v-if="isDeletePermitted" variant="outline-danger" size="sm" pill @click="bulk_delete"><i
                                        class="far fa-plus-square"></i>
                                    Delete All</b-button>
                            </div>
                            <div class="col-6">
                                <b-button v-if="isAddPermitted" variant="outline-primary" size="sm" pill class="float-right"
                                    @click="addGalleryModel"><i class="far fa-plus-square"></i>
                                    Add</b-button>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

            <!-- <div>Selected data {{ selected }}</div> -->

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

                        <!-- <div class="col">
                            <input v-model="search" class="form-control form-control-sm" type="text"
                                placeholder="Search by any data at the table...">
                        </div> -->
                    </div>

                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>
                                    <a href="#" @click.prevent="change_sort('id')">ID</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'id'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'id'">&darr;</span>

                                </th>
                                <th class="text-center">
                                    <b-form-checkbox v-model="selectedAll" @change="selectedAllCheckBox" value="1"
                                        unchecked-value="">All</b-form-checkbox> 
                                </th>
                                <th>Image</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="singleData in allData.data" :key="singleData.id">
                                <td>{{ singleData.id }}</td>
                                <td class="text-center">
                                    <b-form-checkbox v-model="selected" :value="singleData.id" unchecked-value="">
                                    </b-form-checkbox>
                                </td>
                                <td class="text-center">

                                    <span v-if="singleData.image">
                                        <img :src="imagePathSm + singleData.image" alt="Image" height="100" width="100">
                                    </span>
                                    <span v-else class="text-danger"> No Image</span>

                                </td>

                                <td class="text-center">
                                    <button v-if="isDeletePermitted" @click="singleDeleteData(singleData.id)" class="btn btn-danger btn-sm"><i
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


        <!-- Modal v-bind:headers="headers" -->
        <b-modal ref="data-modal" :title="dataModelTitle" size="xl" hide-footer>

            <vue-dropzone ref="myVueDropzone" id="dropzone" :options="dropzoneOptions" @vdropzone-success="vdropzoneSuccess" ></vue-dropzone>

        </b-modal>

    </div>

</template>


<script>
   
    import axios from 'axios';

    import vue2Dropzone from 'vue2-dropzone'
    import 'vue2-dropzone/dist/vue2Dropzone.min.css'

    export default {
        components: {
        vueDropzone: vue2Dropzone
      },


        data() {

            return {

                //current page url
                currentUrl: '/api/admin/gallery',

                imagePathSm: '/images/gallery/small/',
                imagePath: '/images/gallery/',
                imageMaxSize: '2111775',

                selected: [],
                selectedAll: '',

              

                dropzoneOptions: {
                    
                    url: '/api/admin/gallery/bulk_store',
                    maxFilesize: 2,
                    maxFiles: 10,
                    parallelUploads: 2,
                    acceptedFiles: 'image/jpeg,image/png,image/jpg',
                    dictDefaultMessage: "Drop your file here to upload",
                    withCredentials: true,
                    headers: {
                        "Authorization": 'Bearer ' + this.$store.state.adminAuthToken,
                    }
                },

              

            }


        },

        // computed: { 
        //     headers() { 
        //         let token = document.head.querySelector('meta[name="csrf-token"]');
        //         console.log('compute token',this.adminToken, token)
        //         return { 

        //                 "X-CSRF-TOKEN": document.head.querySelector("[name=csrf-token]").content,
        //                 "Authorization": 'bearer '+ this.adminToken 
                    
        //             } 
                
        //     } 
        // },

        methods: {

            // Get table data
            getGallery(page = 1) {
                this.dataLoading = true;
                axios.get(this.currentUrl + '/index?page=' + page +
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

                        // Loading Animation
                        this.dataLoading = false;

                    });
            },


            // selectedAllCheckBox 
            selectedAllCheckBox() {
                // console.log('selected all : ', this.selectedAll)

                if (this.selectedAll == 1) {
                    console.log('selected if: ')
                    axios.get(this.currentUrl + '/all')
                        .then(response => {
                            // console.log(response.data);
                            this.selected = response.data
                        })
                        .catch(error => {
                            console.log(error)
                        })
                } else {
                    // console.log('selected else: ')
                    this.selected = []
                }

            },

            // Add Data Model
            addGalleryModel(){
                this.$refs['data-modal'].show();
            },

            // Dropzone Upload complete 
            vdropzoneSuccess() {
                let data = this.$refs.myVueDropzone.dropzone.getUploadingFiles()
                //console.log(data)
                if(data.length == 0) {
                    this.getGallery();
                    this.$refs['data-modal'].hide();
                    console.log('All Files uploaded')
                }
            },

             // bulk_delete
            bulk_delete() {

                if(this.selected.length < 1){
                    console.log('bulk delete if :', this.selected.length)
                    alert('Please, select item for delete');
                }else{
                

                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        showCancelButton: true,
                        confirmButtonColor: '#d33',
                        cancelButtonColor: '#3085d6',
                        confirmButtonText: 'Yes, delete All!'
                    }).then((result) => {

                        // Send request to the server
                        if (result.value) {
                            //console.log(id);
                            this.$Progress.start();
                            console.log('delete data', this.selected)

                            axios({
                                    method: 'delete',
                                    url: this.currentUrl + '/bulk_delete/',
                                    data: {
                                        selected: this.selected,
                                    }
                                }).then((response) => {
                                    console.log(response);
                                    Swal.fire(
                                        'Deleted!',
                                        'Your file has been deleted.',
                                        'success'
                                    );
                                    // Refresh Tbl Data with current page
                                    this.selected = [];
                                    this.selectedAll = '';
                                    this.getGallery();
                                    this.$Progress.finish();

                                }).catch((data) => {
                                    Swal.fire("Failed!", data.message, "warning");
                                });

                        
                        }
                    })
                    
                }
            },


            // Delete Data
            singleDeleteData(id) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {

                    // Send request to the server
                    if (result.value) {
                        //console.log(id);
                        this.$Progress.start();
                        axios.delete(this.currentUrl + '/destroy/' + id).then((response) => {
                            //console.log(response);
                            Swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            );
                            // Refresh Tbl Data with current page
                            this.getGallery();
                            this.$Progress.finish();

                        }).catch((data) => {
                            Swal.fire("Failed!", data.message, "warning");
                        });
                    }
                })
            },


            // galleryImgUpload
            // galleryImgUpload() {
            //     console.log('Form submited');
            //     this.$Progress.start()
            //     // request send and get response
            //     //const response = await this.form.post(this.currentUrl +'/bulk_store');
            //     axios({
            //         method: 'post',
            //         url: this.currentUrl +'/bulk_store',
            //         data: {
            //             images: this.images,
            //         }
            //     }).then((response) => {
            //         console.log(response);
            //         // Hide model
            //         this.$refs['data-modal'].hide();
            //         // Refresh Tbl Data with current page
            //         this.getGallery();
            //         this.$Progress.finish();

            //     }).catch((data) => {
            //         Swal.fire("Failed!", data.message, "warning");
            //     });
            
            // },



            // vdropzoneSuccessMultiple: function(response){
            //     console.log( 'All Files uploaded', response)
            // },

            // vdropzoneComplete: function(response){
            //     //console.log(response, response.status)
            // },
            
           

        },

       


        mounted() {
            this.$Progress.start();
            // Fetch initial results
            console.log('mount token',this.adminToken)
            this.getGallery();
            this.$Progress.finish();
        },

        created() {
             console.log('created token',this.adminToken, this.$store.state.adminAuthToken)
        },



    }

</script>
