<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Circular</h2>
                        <ol>
                            <li>
                                <router-link :to="{name:'index'}">Home</router-link>
                            </li>
                            <li>Register</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="contact">
                <div class="container">

                    <div class="row justify-content-center">
                        <div class="col-6">

                             <p class="text-center h4"><b>Register</b></p>

                           
                                <form @submit.prevent="register()">
                                    <div class="php-email-form-vue">

                                         <div class="form-group">
                                            <b-form-input class="form-control" :class="{ 'is-invalid': form.errors.has('name') }" v-model="form.name" placeholder="Enter your name"></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('name')"
                                                v-html="form.errors.get('name')" />
                                        </div>

                                         <div class="form-group">
                                            <b-form-input class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" v-model="form.email" placeholder="Enter your E-mail"></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('email')"
                                                v-html="form.errors.get('email')" />
                                        </div>

                                         <div class="form-group">
                                            <b-form-input class="form-control" :class="{ 'is-invalid': form.errors.has('contact') }" v-model="form.contact" placeholder="Enter your contact "></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('contact')"
                                                v-html="form.errors.get('contact')" />
                                        </div>

                                        <div class="form-group">
                                            <b-form-input type="password" class="form-control" :class="{ 'is-invalid': form.errors.has('password') }" v-model="form.password" placeholder="Enter your password"></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('password')"
                                                v-html="form.errors.get('password')" />
                                        </div>
                                      
                                       <div class="form-group">
                                            <b-form-input type="password" class="form-control" :class="{ 'is-invalid': form.errors.has('conformPassword') }" v-model="form.conformPassword" placeholder="Enter your conform password"></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('conformPassword')"
                                                v-html="form.errors.get('conformPassword')" />
                                        </div>

                                        <div class="form-group">
                                             <b-form-file
                                                @change="onFileChange"
                                                placeholder="Choose CV or drop it here..."
                                                drop-placeholder="Drop file here..."
                                                ></b-form-file>
                                             <div class="small text-danger" v-if="form.errors.has('document')"
                                                v-html="form.errors.get('document')" />
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
                                      


                                        <!-- Form Progress Bar -->
                                        <div v-if="form.progress" class="progress m-2">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated"
                                                role="progressbar" :aria-valuenow="form.progress.percentage"
                                                aria-valuemin="0" aria-valuemax="100"
                                                :style="'width:'+form.progress.percentage+'%'"><i
                                                    class="fas fa-spinner fa-pulse"></i></div>
                                        </div>

                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary"><i class="fas fa-plus-square"></i>
                                               Register </button>
                                        </div>

                                    </div>
                                </form>

                        </div>
                    </div>

        


                </div>

            </section>


        </main><!-- End #main -->
    </div>
</template>



<script>
    import From from 'vform';
    // in full builds helpers are exposed as Vuex.mapState
    import { mapGetters } from 'vuex'
  
    export default {
        name:'Register',
        data() {
            return {

                form: new From({
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

           

            // register 
            async register() {
                console.log('Form submited');
                this.$Progress.start()
                // request send and get response
                const response = await this.form.post('/api/circular_register');
                // Input field make empty
                this.form.reset();
                this.form.errors.clear();

                this.$Progress.finish();

                if (response.status == 200) {

                    console.log(response.data)

                    Toast.fire({
                        icon: response.data.icon,
                        title: response.data.msg
                    });
                   

                    // Redirect to dashboard
                    this.$router.push({name:'circular_login'})

                }else {
                    Swal.fire("Failed!", data.message, "warning");
                    console.log(response);
                }
            },

        },


        created() {

            this.$Progress.start();
            if(this.token){
                // Auth true redirect to dashboard
                this.$router.push('circular_index')
            }
            console.log('Circular Register Component');
            this.$Progress.finish();

        },


        computed : {
            // map this.count to store.state.count
            ...mapGetters({
                //'token'     : 'getAuthToken',
            })
        },

      

    }

</script>

