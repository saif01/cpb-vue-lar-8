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
                            <li>Reset Password</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="contact">
                <div class="container">

                    <div class="row justify-content-center">
                        <div class="col-6">

                             <p class="text-center h4"><b>Reset Login Password</b></p>

                                <div v-if="error" class="alert alert-danger text-center">
                                    <span>{{ errorMsg }}</span>
                                </div>

                           
                                <form @submit.prevent="register()">
                                    <div class="php-email-form-vue">

                                        

                                         <div class="form-group">
                                            <b-form-input type="email" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" v-model="form.email" placeholder="Enter your E-mail"></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('email')"
                                                v-html="form.errors.get('email')" />
                                        </div>

                                         <div class="form-group">
                                            <b-form-input class="form-control" :class="{ 'is-invalid': form.errors.has('contact') }" v-model="form.contact" placeholder="Enter your contact "></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('contact')"
                                                v-html="form.errors.get('contact')" />
                                        </div>

                                        <div class="form-group">
                                            <b-form-input type="password" class="form-control" :class="{ 'is-invalid': form.errors.has('password') }" v-model="form.password" placeholder="Enter new password"></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('password')"
                                                v-html="form.errors.get('password')" />
                                        </div>
                                      
                                       <div class="form-group">
                                            <b-form-input type="password" class="form-control" :class="{ 'is-invalid': form.errors.has('conformPassword') }" v-model="form.conformPassword" placeholder="Enter new conform password"></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('conformPassword')"
                                                v-html="form.errors.get('conformPassword')" />
                                        </div>

                                         <b-form-group v-if="form.progress">
                                            <b-progress :value="form.progress.percentage" variant="success" striped animated>
                                            </b-progress>
                                        </b-form-group>
                                      
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary"><i class="fas fa-plus-square"></i>
                                               Submit </button>
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
    
    export default {
        name:'ResetPassword',
        data() {
            return {

                error: false,
                errorMsg:'',

                form: new From({
                    email: '',
                    contact: '',
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
                const response = await this.form.post('/api/carrier_reset_pass');
                // Input field make empty
                this.form.reset();
                this.form.errors.clear();

                this.$Progress.finish();

                if (response.status == 200) {

                    console.log(response)

                    Toast.fire({
                        icon: response.data.icon,
                        title: response.data.msg
                    });
                   

                    // Redirect to dashboard
                    this.$router.push({name:'carrier_login'})

                }else if(response.status == 203){

                    this.error = true;
                    this.errorMsg = response.data.msg;

                    Toast.fire({
                        icon: response.data.icon,
                        title: response.data.msg
                    });

                   // console.log('else if', response.data, response.data.msg)

                }else {
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


      

    }

</script>

