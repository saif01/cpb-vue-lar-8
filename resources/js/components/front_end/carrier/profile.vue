<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Carrier</h2>
                        <ol>
                            <li>
                                <router-link :to="{name:'index'}">Home</router-link>
                            </li>
                            <li>My Profile</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="contact">
                <div class="container">

                    <div class="row">
                     
                            <div class="card col-md-4">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img :src="'/images/admin/' + user.image" alt="User"
                                            class="rounded-circle" width="150">
                                        <div class="mt-3">
                                            <h4>{{ user.name }}</h4>
                                            <p class="text-secondary mb-1">Email: {{ user.email }}</p>
                                            <p class="text-muted font-size-sm">Contact: {{ user.contact }}</p>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card col-md-8">
                                <ul class="list-group list-group-flush mb-4">
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">
                                           <i class="fas fa-user-check text-success"></i> Registered at</h6>
                                        <span class="text-secondary">{{ user.created_at | moment("dddd, MMMM Do YYYY")  }}</span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><i class="fas fa-user-edit text-warning"></i> Last Modified at</h6>
                                        <span class="text-secondary">{{ user.updated_at | moment("dddd, MMMM Do YYYY")  }}</span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"> <i class="far fa-address-card text-info"></i> Your CV</h6>
                                        <span class="text-secondary"><span v-if="user.document">
                                        <a :href="'/images/recruit/' + user.document" download><i
                                                class="fas fa-download"></i> CV of {{ user.name }}</a>
                                    </span>
                                    <span v-else class="text-danger"> No CV</span></span>
                                    </li>
                                  
                                 
                                </ul>

                                <button class="btn btn-primary mt-3" @click="profileModal" ><i class="fas fa-user-edit"></i> Update Your Profile</button>
                            </div>
                       
                       
                    </div>

                   


                </div>

            </section>


        </main><!-- End #main -->


          <b-modal ref="profileModal" title="Update Your Profile" size="xl" hide-footer>
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
                
                

                <b-form-group label="File: (.DOC,.DOCX, .PDF)">
                        <b-form-file
                        @change="onFileChange" placeholder="Choose CV or drop it here..."
                        size="sm" accept=".DOC, .DOCX, .PDF"></b-form-file>
                        <div class="small text-danger" v-if="form.errors.has('document')"
                        v-html="form.errors.get('document')" />
                </b-form-group>


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
    // in full builds helpers are exposed as Vuex.mapState
    import {
        mapGetters
    } from 'vuex'

    export default {
        name: 'Register',
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
                    document: '',
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
                this.form.id = this.user.id
                this.form.name = this.user.name
                this.form.email = this.user.email
                this.form.contact = this.user.contact
                this.form.image = this.user.image
               
                this.$refs['profileModal'].show();
            },



            // updateProfile 
            async updateProfile() {
                console.log('Form submited');
                this.$Progress.start()
                // request send and get response
                const response = await this.form.post('/api/carrier_profile_update/'+ this.form.id);
                // Input field make empty
                this.form.reset();
                this.form.errors.clear();

                this.$Progress.finish();

                if (response.status == 200) {

                    //console.log(response.data)

                    // store Update     
                    this.$store.commit('setUser',  response.data.user);
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

        },


        created() {

            this.$Progress.start();

            console.log('carrier Password Reset');
            this.$Progress.finish();

        },


        computed: {
            // map this.count to store.state.count
            ...mapGetters({
                //'token'     : 'getAuthToken',
            })
        },



    }

</script>
