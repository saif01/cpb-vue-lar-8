<template>
    <div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-6">
                        <h3 class="card-title">Food Business Table</h3>
                    </div>
                    <div class="col-6">
                        <b-button v-if="isAddPermitted" variant="outline-primary" size="sm" pill class="float-right"
                            @click="addDataModel"><i class="far fa-plus-square"></i>
                            Add</b-button>
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
                                <td>{{ singleData.title }}</td>
                                <td class="text-center">

                                    <span v-if="singleData.image">
                                        <img :src="imagePathSm + singleData.image" alt="Image" height="100" width="100">
                                    </span>
                                    <span v-else class="text-danger"> No Image</span>

                                    <span v-if="singleData.image2">
                                        <img :src="imagePathSm + singleData.image2" alt="Image" height="100"
                                            width="100">
                                    </span>
                                    <span v-else class="text-danger"> No Image</span>

                                    <span v-if="singleData.image3">
                                        <img :src="imagePathSm + singleData.image3" alt="Image" height="100"
                                            width="100">
                                    </span>
                                    <span v-else class="text-danger"> No Image</span>

                                    <span v-if="singleData.image4">
                                        <img :src="imagePathSm + singleData.image4" alt="Image" height="100"
                                            width="100">
                                    </span>
                                    <span v-else class="text-danger"> No Image</span>

                                    <span v-if="singleData.image5">
                                        <img :src="imagePathSm + singleData.image5" alt="Image" height="100"
                                            width="100">
                                    </span>
                                    <span v-else class="text-danger"> No Image</span>

                                    <hr>
                                    {{ singleData.name }} <br>
                                    {{ singleData.website }}<br>
                                    <div v-html="singleData.details"></div>
                                </td>

                                <td class="text-center">

                                    <button v-if="singleData.status" @click="statusChange(singleData)"
                                        class="btn btn-success btn-sm m-1">
                                        <i class="far fa-check-circle"></i> Active
                                    </button>
                                    <button v-else @click="statusChange(singleData)" class="btn btn-warning btn-sm m-1">
                                        <i class="far fa-times-circle"></i> Inactive
                                    </button>

                                    <button v-if="isEditPermitted" @click="editDataModel(singleData)"
                                        class="btn btn-warning btn-sm m-1">
                                        <i class="fa fa-edit blue"></i> Edit
                                    </button>
                                    <button v-if="isDeletePermitted" @click="deleteData(singleData.id)"
                                        class="btn btn-danger btn-sm m-1"><i class="fa fa-trash red"></i>
                                        Delete</button>
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


        <b-modal ref="data-modal" :title="dataModelTitle" size="xl" hide-footer>
            <form @submit.prevent="editmode ? updateData() : createData()">

                <b-row>
                    <b-col>
                        <b-form-group label="Business Name:">
                            <b-form-input v-model="form.name" placeholder="Enter Business name" size="sm"
                                :class="{ 'is-invalid': form.errors.has('name') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('name')"
                                v-html="form.errors.get('name')" />
                        </b-form-group>
                    </b-col>

                    <b-col>
                        <b-form-group label="Business Website:">
                            <b-form-input v-model="form.website" placeholder="Enter Business website" size="sm"
                                :class="{ 'is-invalid': form.errors.has('website') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('website')"
                                v-html="form.errors.get('website')" />
                        </b-form-group>
                    </b-col>
                </b-row>

                <b-form-group label="Business title:">
                    <b-form-input v-model="form.title" placeholder="Enter Business title" size="sm"
                        :class="{ 'is-invalid': form.errors.has('title') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('title')" v-html="form.errors.get('title')" />
                </b-form-group>

                <b-form-group label="Details:">
                    <vue-editor v-model="form.details" :editorToolbar="customToolbar"></vue-editor>
                    <div class="small text-danger" v-if="form.errors.has('details')"
                        v-html="form.errors.get('details')" />
                </b-form-group>


                <b-row>
                    <b-col>
                        <b-form-group label="File: (.jpg, .png, .jpeg)">
                            <b-form-file @change="upload_image" placeholder="Choose or drop Image here..."
                                class="is-invalid" size="sm" accept=".jpg, .png, .jpeg"></b-form-file>
                            <div class="small text-danger" v-if="form.errors.has('image')"
                                v-html="form.errors.get('image')" />
                            <div class="mt-1">
                                <img :src="get_image()" height="100" width="100" />
                            </div>
                        </b-form-group>
                    </b-col>
                    <b-col>

                        <b-form-group label="File 2: (.jpg, .png, .jpeg)">
                            <b-form-file @change="upload_image2" placeholder="Choose or drop Image here..."
                                class="is-invalid" size="sm" accept=".jpg, .png, .jpeg"></b-form-file>
                            <div class="small text-danger" v-if="form.errors.has('image')"
                                v-html="form.errors.get('image')" />
                            <div class="mt-1">
                                <img :src="get_image2()" height="100" width="100" />
                            </div>
                        </b-form-group>

                    </b-col>
                    <b-col>
                        <b-form-group label="File 3: (.jpg, .png, .jpeg)">
                            <b-form-file @change="upload_image3" placeholder="Choose or drop Image here..."
                                class="is-invalid" size="sm" accept=".jpg, .png, .jpeg"></b-form-file>
                            <div class="small text-danger" v-if="form.errors.has('image')"
                                v-html="form.errors.get('image')" />
                            <div class="mt-1">
                                <img :src="get_image3()" height="100" width="100" />
                            </div>
                        </b-form-group>
                    </b-col>
                </b-row>


                <b-row>
                    <b-col>
                        <b-form-group label="File 4 : (.jpg, .png, .jpeg)">
                            <b-form-file @change="upload_image4" placeholder="Choose or drop Image here..."
                                class="is-invalid" size="sm" accept=".jpg, .png, .jpeg"></b-form-file>
                            <div class="small text-danger" v-if="form.errors.has('image')"
                                v-html="form.errors.get('image')" />
                            <div class="mt-1">
                                <img :src="get_image4()" height="100" width="100" />
                            </div>
                        </b-form-group>
                    </b-col>

                    <b-col>
                        <b-form-group label="File 5: (.jpg, .png, .jpeg)">
                            <b-form-file @change="upload_image5" placeholder="Choose or drop Image here..."
                                class="is-invalid" size="sm" accept=".jpg, .png, .jpeg"></b-form-file>
                            <div class="small text-danger" v-if="form.errors.has('image')"
                                v-html="form.errors.get('image')" />
                            <div class="mt-1">
                                <img :src="get_image5()" height="100" width="100" />
                            </div>
                        </b-form-group>
                    </b-col>
                </b-row>


                <b-form-group v-if="form.progress">
                    <b-progress :value="form.progress.percentage" variant="success" striped animated>
                    </b-progress>
                </b-form-group>


                <b-form-group v-if="!form.progress">
                    <b-button v-show="editmode" type="submit" class="btn-block" variant="primary">Update</b-button>
                    <b-button v-show="!editmode" type="submit" class="btn-block" variant="primary">Create</b-button>
                </b-form-group>


            </form>


        </b-modal>


    </div>

</template>


<script>
    // vform
    import Form from 'vform';
    import {
        VueEditor
    } from "vue2-editor";
    import vue2EditorToolbar from "../common/js/vue2_editor_toolbar.js";

    import multilpeImgUp from '../common/js/multiple_img_up';

    export default {
        components: {
            VueEditor
        },

        data() {

            return {

                //current page url
                currentUrl: '/api/admin/food',

                imagePathSm: '/images/business/small/',
                imagePath: '/images/business/',
                imageMaxSize: '2111775',
                // Custom Toolbar for vue2 text editor
                ...vue2EditorToolbar,

                // Form
                form: new Form({
                    id: '',
                    name: '',
                    website: '',
                    title: '',
                    details: '',
                    image: '',
                    image2: '',
                    image3: '',
                    image4: '',
                    image5: '',

                }),

            }


        },

        methods: {

            // multilpe Image Upload
            ...multilpeImgUp

        },


        mounted() {
            this.$Progress.start();
            // Fetch initial results
            this.getResults();
            this.$Progress.finish();
        },



    }

</script>
