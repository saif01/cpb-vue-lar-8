<template>
    <div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-6">
                        <h3 class="card-title">Headquarter Table</h3>
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
                                    <a href="#" @click.prevent="change_sort('country')">Country</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'country'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'country'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('company')">Company</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'company'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'company'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('address')">Address</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'address'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'address'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('phone')">Phone</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'phone'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'phone'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('email')">email</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'email'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'email'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('website')">Website</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'website'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'website'">&darr;</span>
                                </th>
                              

                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="singleData in allData.data" :key="singleData.id">
                                <td>{{ singleData.id }}</td>
                                <td>{{ singleData.country }}</td>
                                <td>{{ singleData.company }}</td>
                                <td>{{ singleData.address }}</td>
                                <td>{{ singleData.phone }}</td>
                                <td>{{ singleData.email }}</td>
                                <td>{{ singleData.website }}</td>
                               
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

                <b-form-group label="Country Name:">
                    <b-form-input v-model="form.country" placeholder="Enter country name" size="sm"
                        :class="{ 'is-invalid': form.errors.has('country') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('country')"
                        v-html="form.errors.get('country')" />
                </b-form-group>
                <b-form-group label="Company Name:">
                    <b-form-input v-model="form.company" placeholder="Enter company name" size="sm"
                        :class="{ 'is-invalid': form.errors.has('company') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('company')"
                        v-html="form.errors.get('company')" />
                </b-form-group>
                <b-form-group label="Company Address:">
                    <b-form-textarea v-model="form.address" placeholder="Enter company full address..." rows="3"
                        max-rows="6"></b-form-textarea>
                    <div class="small text-danger" v-if="form.errors.has('address')"
                        v-html="form.errors.get('address')" />
                </b-form-group>

                 <b-form-group label="Company email:">
                    <b-form-input v-model="form.email" placeholder="Enter company email" size="sm"
                        :class="{ 'is-invalid': form.errors.has('email') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('email')"
                        v-html="form.errors.get('email')" />
                </b-form-group>

                 <b-form-group label="Company phone number:">
                    <b-form-input v-model="form.phone" placeholder="Enter phone phone number" size="sm"
                        :class="{ 'is-invalid': form.errors.has('phone') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('phone')"
                        v-html="form.errors.get('phone')" />
                </b-form-group>
                 <b-form-group label="Company website:">
                    <b-form-input v-model="form.website" placeholder="Enter website website" size="sm"
                        :class="{ 'is-invalid': form.errors.has('website') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('website')"
                        v-html="form.errors.get('website')" />
                </b-form-group>

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
    import vue2EditorToolbar from "../common/js/vue2_editor_toolbar.js"

    export default {
        components: {
            VueEditor
        },

        data() {

            return {

                //current page url
                currentUrl: '/api/admin/headquarter',

                // Custom Toolbar for vue2 text editor
                ...vue2EditorToolbar,

                // Form
                form: new Form({
                    id: '',
                    country: '',
                    company: '',
                    address: '',
                    email: '',
                    phone: '',
                    website: '',
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
