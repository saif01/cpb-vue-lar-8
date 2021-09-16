<template>
    <div>
        
       

        <div class="row justify-content-center">

            <div class="card col-md-4">
                <div class="card-body">
                    <div class="d-flex flex-column align-items-center text-center">
                        <img :src="imagePath + adminUser.image" alt="Admin"
                            class="rounded-circle" width="150">
                        <div class="mt-3">
                            <h4>{{ adminUser.name }}</h4>
                            <p class="text-secondary mb-1">ID: {{ adminUser.login }}</p>
                            <p class="text-secondary mb-1">Email: {{ adminUser.email }}</p>
                            <p class="text-muted font-size-sm">Contact: {{ adminUser.contact }}</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row justify-content-center mt-1">

                <div class="card col-md-8">
                    <ul class="list-group list-group-flush mb-4">
                        <li
                            class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-0">
                                <i class="fas fa-user-check text-success"></i> Registered at</h6>
                            <span class="text-secondary">{{ adminUser.created_at | moment("dddd, MMMM Do YYYY")  }}</span>
                        </li>
                        <li
                            class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-0"><i class="fas fa-user-edit text-warning"></i> Last Modified at</h6>
                            <span class="text-secondary">{{ adminUser.updated_at | moment("dddd, MMMM Do YYYY")  }}</span>
                        </li>
                    </ul>

                    <button class="btn btn-primary mt-3 mb-2" @click="profileModal" ><i class="fas fa-user-edit"></i> Update Your Profile</button>
                </div>
            
            
        </div>

                   

        <b-modal ref="profileModal" title="Update Your Admin Profile" size="xl" hide-footer>
            <form @submit.prevent="updateProfile">
                 <b-row>
                    <div class="col">
                <b-form-group label="Name:">
                    <b-form-input v-model="form.name" placeholder="Enter Your Name" size="sm"
                        :class="{ 'is-invalid': form.errors.has('name') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                </b-form-group>
                    </div>
                    <div class="col">
                <b-form-group label="Email:">
                    <b-form-input type="email" v-model="form.email" placeholder="Enter Your Email" size="sm"
                        :class="{ 'is-invalid': form.errors.has('email') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('email')" v-html="form.errors.get('email')" />
                </b-form-group>
                    </div>
                    <div class="col">
                 <b-form-group label="Contact:">
                    <b-form-input v-model="form.contact" placeholder="Enter Your Contact" size="sm"
                        :class="{ 'is-invalid': form.errors.has('contact') }"></b-form-input>
                    <div class="small text-danger" v-if="form.errors.has('contact')" v-html="form.errors.get('contact')" />
                </b-form-group>
                    </div>
                </b-row>
                <b-row>
                    <div class="col">
                        <b-form-group label="password:">
                            <b-form-input type="password" v-model="form.password" placeholder="Enter Your password" size="sm"
                                :class="{ 'is-invalid': form.errors.has('password') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('password')"
                                v-html="form.errors.get('password')" />
                        </b-form-group>
                    </div>
                    <div class="col">
                        <b-form-group label="Conform Password:">
                            <b-form-input type="password" v-model="form.conformPassword"
                                placeholder="Enter Your Conform Password" size="sm"
                                :class="{ 'is-invalid': form.errors.has('conformPassword') }"></b-form-input>
                            <div class="small text-danger" v-if="form.errors.has('conformPassword')"
                                v-html="form.errors.get('conformPassword')" />
                        </b-form-group>
                    </div>
                </b-row>
                
                
                <b-form-group label="File: (.jpg, .png, .jpeg)">
                    <b-form-file @change="upload_image" placeholder="Choose or drop Image here..."
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
                    <b-button type="submit" class="btn-block" variant="primary">Update</b-button>
                </b-form-group>


            </form>
        </b-modal>


     
    </div>
</template>
<script>

    import From from 'vform';
   
    export default {
        name: 'AdminProfile',
        
        data() {
            return {

                imagePathSm: '/images/admin/small/',
                imagePath: '/images/admin/',
                imageMaxSize: '2111775',

                form: new From({
                    id: '',
                    name: '',
                    email: '',
                    contact: '',
                    image: '',
                    password: '',
                    conformPassword: '',

                }),


            }
        },
        methods: {

             // Add model show
            profileModal() {
                this.form.reset();
                //this.form.fill(this.user);
                this.form.id = this.adminUser.id
                this.form.name = this.adminUser.name
                this.form.email = this.adminUser.email
                this.form.contact = this.adminUser.contact
                this.form.image = this.adminUser.image
               
                this.$refs['profileModal'].show();
            },



            // updateProfile 
            async updateProfile() {
                console.log('Form submited');
                this.$Progress.start()
                // request send and get response
                const response = await this.form.post('/api/admin/user/profile_update/'+ this.form.id);
                // Input field make empty
                this.form.reset();
                this.form.errors.clear();

                this.$Progress.finish();

                if (response.status == 200) {

                    console.log(response.data.user)

                    // store Update     
                    this.$store.commit('setAdminUser',  response.data.user);
                    // SessionStorage Update
                    this.setSessionStorage('admin_user', response.data.user);
                    this.$refs['profileModal'].hide();

                    Toast.fire({
                        icon: response.data.icon,
                        title: response.data.msg
                    });


                   

                } else {
                    Swal.fire("Failed!", data.message, "warning");
                    console.log(response);
                }
            },

    

            getDashboardData() {
                axios.get('/api/admin/dashoboard')
                    .then(response => {
                        console.log(response.data);
                        this.users = response.data.users;
                        this.admins = response.data.admins;
                        this.circulars = response.data.circulars;

                    })
                    .catch(error => {
                        console.log(error)
                    })
            },

        },

        mounted(){
            console.log('Admin', this.adminUser)
        },

        created() {

            //this.getDashboardData();

        },


    }

</script>


<style>
  

</style>
