<template>
    <div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-6">
                        <h3 class="card-title">Recruit Table</h3>
                    </div>
                    <div class="col-6">
                        <b-button v-if="isAddPermitted" variant="outline-primary" size="sm" pill class="float-right" @click="addDataModel"><i
                                class="far fa-plus-square"></i>
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
                                    <a href="#" @click.prevent="change_sort('publishDate')">Publish</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'publishDate'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'publishDate'">&darr;</span>
                                </th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('jobTitle')">Title</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'jobTitle'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'jobTitle'">&darr;</span>
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
                                <td>{{ singleData.publishDate }}</td>
                                <td>{{ singleData.jobTitle }}</td>
                                <td>
                                  
                                    <hr>
                                    <div v-html="singleData.details"></div>
                                </td>

                                <td class="text-center">

                                    <button v-if="singleData.status" @click="statusChange(singleData)" class="btn btn-success btn-sm m-1">
                                        <i class="far fa-check-circle"></i> Active
                                    </button>
                                    <button v-else @click="statusChange(singleData)" class="btn btn-warning btn-sm m-1">
                                        <i class="far fa-times-circle"></i> Inactive
                                    </button>

                                    <button v-if="isEditPermitted" @click="editDataModel(singleData)" class="btn btn-warning btn-sm m-1">
                                        <i class="fa fa-edit blue"></i> Edit
                                    </button>
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


        <b-modal ref="data-modal" :title="dataModelTitle" size="xl" hide-footer>
            <form @submit.prevent="editmode ? updateData() : createData()">

                

                <b-row>
                    <b-col>
                        <b-form-group label="Job Title:">
                            <b-form-input v-model="form.jobTitle" placeholder="Enter job title" size="sm"
                                :class="{ 'is-invalid': form.errors.has('jobTitle') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('jobTitle')" v-html="form.errors.get('jobTitle')" />
                        </b-form-group>
                    </b-col>
                    <b-col>
                         <b-form-group label="Salary:">
                            <b-form-input v-model="form.salary" placeholder="Enter salary" size="sm"
                                :class="{ 'is-invalid': form.errors.has('salary') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('salary')" v-html="form.errors.get('salary')" />
                        </b-form-group>
                    </b-col>
                </b-row>

                <b-row>
                    <b-col>
                        <b-form-group label="Publish Date:">
                            <b-form-datepicker v-model="form.publishDate" today-button reset-button close-button locale="en"
                                placeholder="YYYY-MM-DD" autocomplete="off" size="sm"
                                :date-format-options="{ year: 'numeric', month: 'long', day: 'numeric' }"
                                :class="{ 'is-invalid': form.errors.has('publishDate') }">
                            </b-form-datepicker>
                            <div class="small text-danger" v-if="form.errors.has('publishDate')"
                                v-html="form.errors.get('publishDate')" />
                        </b-form-group>
                    </b-col>
                    <b-col>
                        <b-form-group label="Deadline Date:">
                            <b-form-datepicker v-model="form.deadline" today-button reset-button close-button locale="en"
                                placeholder="YYYY-MM-DD" autocomplete="off" size="sm"
                                :date-format-options="{ year: 'numeric', month: 'long', day: 'numeric' }"
                                :class="{ 'is-invalid': form.errors.has('deadline') }">
                            </b-form-datepicker>
                            <div class="small text-danger" v-if="form.errors.has('deadline')"
                                v-html="form.errors.get('deadline')" />
                        </b-form-group>
                    </b-col>

                    <b-col>
                         <b-form-group label="Department:">
                            <b-form-input v-model="form.department" placeholder="Enter department name" size="sm"
                                :class="{ 'is-invalid': form.errors.has('department') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('department')" v-html="form.errors.get('department')" />
                        </b-form-group>
                    </b-col>
                   
                </b-row>

                <b-row>
                    <b-col>
                        <b-form-group label="Location:">
                            <b-form-input v-model="form.location" placeholder="Enter job location" size="sm"
                                :class="{ 'is-invalid': form.errors.has('location') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('location')" v-html="form.errors.get('location')" />
                        </b-form-group>
                    </b-col>
                    <b-col>
                         <b-form-group label="Education:">
                            <b-form-input v-model="form.education" placeholder="Enter education requirements" size="sm"
                                :class="{ 'is-invalid': form.errors.has('education') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('education')" v-html="form.errors.get('education')" />
                        </b-form-group>
                    </b-col>
                </b-row>


                <b-row>
                    <b-col>
                        <b-form-group label="Requirement:">
                             <b-form-textarea v-model="form.requirement" placeholder="Enter job requirement" rows="2"
                        max-rows="4" :class="{ 'is-invalid': form.errors.has('requirement') }"></b-form-textarea>
                            <div class="small text-danger" v-if="form.errors.has('requirement')" v-html="form.errors.get('requirement')" />
                        </b-form-group>
                    </b-col>
                    <b-col>
                         <b-form-group label="experience:">
                             <b-form-textarea v-model="form.experience" placeholder="Enter job experience" rows="2"
                        max-rows="4" :class="{ 'is-invalid': form.errors.has('experience') }"></b-form-textarea>
                            <div class="small text-danger" v-if="form.errors.has('experience')" v-html="form.errors.get('experience')" />
                        </b-form-group>
                    </b-col>
                </b-row>


                 <b-form-group label="Details:">
                    <vue-editor v-model="form.details" :editorToolbar="customToolbar"></vue-editor>
                    <div class="small text-danger" v-if="form.errors.has('details')"
                        v-html="form.errors.get('details')" />
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
                currentUrl: '/api/admin/circular',

               
                // Custom Toolbar for vue2 text editor
                ...vue2EditorToolbar,

                // Form
                form: new Form({
                    id: '',
                    jobTitle: '',
                    salary: '',
                    publishDate: '',
                    deadline: '',
                    department: '',
                    location: '',
                    education: '',
                    requirement: '',
                    experience: '',
                    details: '',
                    
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
