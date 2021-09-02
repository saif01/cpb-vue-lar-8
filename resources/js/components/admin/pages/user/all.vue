<template>
    <div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-6">
                        <h3 class="card-title">Admin Table</h3>
                    </div>
                    <div class="col-6">
                        <b-button v-if="isAddPermitted" variant="outline-primary" size="sm" pill class="float-right"
                            @click="addDataModel"><i class="far fa-plus-square"></i>
                            Add</b-button>
                    </div>

                </div>
            </div>

            <div class="card-body">
                <div v-if="allData.data">
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
                                <th>Image</th>
                                <th>
                                    <a href="#" @click.prevent="change_sort('login')">Login</a>
                                    <span v-if="sort_direction == 'desc' && sort_field == 'login'">&uarr;</span>
                                    <span v-if="sort_direction == 'asc' && sort_field == 'login'">&darr;</span>
                                </th>
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
                                <th>Roles</th>

                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="singleData in allData.data" :key="singleData.id">
                                <td>{{ singleData.id }}</td>
                                <td class="text-center">
                                    <span v-if="singleData.image">
                                        <img :src="imagePathSm + singleData.image" alt="Image" height="100" width="100">
                                    </span>
                                    <span v-else class="text-danger"> No Image</span>
                                </td>
                                <td>{{ singleData.login }}</td>
                                <td>{{ singleData.name }}</td>
                                <td>{{ singleData.email }}</td>
                                <td>
                                    <span v-if="singleData.roles.length">
                                        <span v-for="(role, index) in singleData.roles" :key="index">
                                            <span>{{ role.name }}, </span>
                                        </span>
                                    </span>
                                    <span v-else>
                                        <span class="text-danger">You have no roles</span>
                                    </span>
                                </td>

                                <td class="text-center">
                                    <button v-if="isRoleManagePermitted" @click="editRoleModel(singleData)"
                                        class="btn btn-info btn-sm m-1">
                                        <i class="fab fa-r-project"></i> Role
                                    </button>
                                    <button v-if="isEditPermitted" @click="editDataModel(singleData)"
                                        class="btn btn-warning btn-sm m-1">
                                        <i class="fa fa-edit blue"></i> Edit
                                    </button>
                                    <button v-if="isDeletePermitted" @click="deleteData(singleData.id)"
                                        class="btn btn-danger btn-sm m-1"><i class="fa fa-trash red"></i> Delete</button>
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


        <b-modal ref="data-modal" :title="dataModelTitle" size="md" hide-footer>
            <form @submit.prevent="editmode ? updateData() : createData()">

                <b-form-group label="Login:">
                    <b-form-input v-model="form.login" placeholder="Enter Admin Login" size="sm"
                        :class="{ 'is-invalid': form.errors.has('login') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('login')" v-html="form.errors.get('login')" />
                </b-form-group>
                <b-form-group label="Name:">
                    <b-form-input v-model="form.name" placeholder="Enter Admin Name" size="sm"
                        :class="{ 'is-invalid': form.errors.has('name') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                </b-form-group>
                <b-form-group label="Email:">
                    <b-form-input type="email" v-model="form.email" placeholder="Enter Admin Email" size="sm"
                        :class="{ 'is-invalid': form.errors.has('email') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('email')" v-html="form.errors.get('email')" />
                </b-form-group>
                <b-form-group label="password:">
                    <b-form-input type="password" v-model="form.password" placeholder="Enter Admin password" size="sm"
                        :class="{ 'is-invalid': form.errors.has('password') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('password')"
                        v-html="form.errors.get('password')" />
                </b-form-group>
                <b-form-group label="Conform Password:">
                    <b-form-input type="password" v-model="form.conformPassword"
                        placeholder="Enter Admin Conform Password" size="sm"
                        :class="{ 'is-invalid': form.errors.has('conformPassword') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('conformPassword')"
                        v-html="form.errors.get('conformPassword')" />
                </b-form-group>


                <b-form-group label="File: (.jpg, .png, .jpeg)">
                    <b-form-file @change="upload_image" placeholder="Choose or drop Image here..." class="is-invalid"
                        size="sm" accept=".jpg, .png, .jpeg"></b-form-file>
                    <div class="small text-danger" v-if="form.errors.has('image')" v-html="form.errors.get('image')" />
                    <div class="mt-1">
                        <img :src="get_image()" height="100" width="100" />
                    </div>
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

        <b-modal ref="data-modal-role" title="Add roles" size="lg" hide-footer>

            <form @submit.prevent="updateUserRole">

                <div class="pb-4">
                    <!-- {{ currentRoles }} -->
                    <div class="row">
                        <div class="col-3" v-for="(role, index) in allRoles" :key="index">
                            <b-form-checkbox v-model="currentRoles" :value="role.id" unchecked-value="">
                                {{ role.name }}
                            </b-form-checkbox>
                        </div>

                    </div>
                </div>

                <b-form-group v-if="roleUpdating">
                    <b-progress value="100" variant="success" striped animated>
                    </b-progress>
                </b-form-group>


                <b-form-group v-if="!roleUpdating">
                    <b-button type="submit" class="btn-block" variant="primary">Update</b-button>
                </b-form-group>

            </form>

        </b-modal>


    </div>

</template>


<script>
    // vform
    import Form from 'vform';

    export default {

        data() {

            return {

                allRoles: {},

                //current page url
                currentUrl: '/api/admin/user',

                imagePathSm: '/images/admin/small/',
                imagePath: '/images/admin/',
                imageMaxSize: '2111775',

                // Form
                form: new Form({
                    id: '',
                    login: '',
                    name: '',
                    email: '',
                    password: '',
                    conformPassword: '',
                    image: '',
                }),

                currentRoles: [],
                currentRoleId: null,
                roleUpdating: false,

            }


        },

        methods: {
            // All roles
            getRoles() {
                axios.get(this.currentUrl + '/roles')
                    .then(response => {
                        //console.log(response.data)
                        this.allRoles = response.data
                    })
                    .catch(error => {
                        console.log(error)
                    })
            },

            // Add Data Model
            addRoleModel() {
                this.$refs['data-modal-role'].show();
            },

            // editRoleModel
            editRoleModel(roleData) {
                console.log(roleData.id)
                this.currentRoleId = roleData.id
                // Current role array empty
                this.currentRoles = []
                // role found then push in arry
                roleData.roles.forEach(element => {
                    // console.log('loop', element.id)
                    this.currentRoles.push(element.id)
                })

                // Role modal show
                this.$refs['data-modal-role'].show();
            },

            // update user role
            updateUserRole() {

                this.roleUpdating = true
                axios.post(this.currentUrl + '/roles_update', {
                        currentRoleId: this.currentRoleId,
                        roles: this.currentRoles,
                    })
                    .then(response => {
                        this.roleUpdating = false
                        console.log(response)
                        // Refetch
                        this.getResults();
                        // Modal closed
                        this.$refs['data-modal-role'].hide();
                        Toast.fire({
                            icon: response.data.icon,
                            title: response.data.msg
                        });
                    })
                    .catch(error => {
                        console.log(error)
                    })


            }




        },


        mounted() {
            this.$Progress.start();
            // Fetch initial results
            this.getResults();
            this.getRoles();
            this.$Progress.finish();
        },



    }

</script>
