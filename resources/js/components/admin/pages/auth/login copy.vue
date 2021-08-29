<template>
    <div class="login-page">
        <div class="login-box align-items-center"> 
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    <h1><b>C.P.</b>Bangladesh</h1>
                </div>
                <div class="card-body">
                    <p class="login-box-msg">Sign in to start your session</p>

                   <form @submit.prevent="login" method="post">

                        <div class="mb-3">

                            <div class="input-group">
                                <input type="text" v-model="form.email" class="form-control" placeholder="Enter Email"
                                    :class="{ 'is-invalid': form.errors.has('email') }">
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-envelope"></span>
                                    </div>
                                </div>

                            </div>
                            <div class="small text-danger" v-if="form.errors.has('email')">
                                Invalid credentials
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="input-group">
                                <input type="password" v-model="form.password" class="form-control"
                                    placeholder="Password" :class="{ 'is-invalid': form.errors.has('email') }">
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="small text-danger" v-if="form.errors.has('email')">
                                Invalid credentials
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="remember">
                                    <label for="remember">
                                        Remember Me
                                    </label>
                                </div>
                            </div>

                            <!-- /.col -->
                            <div class="col-4" v-if="!form.progress">
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                            <!-- /.col -->
                        </div>

                        <!-- Form Progress Bar -->
                        <div v-if="form.progress" class="progress m-2">
                            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"
                                :aria-valuenow="form.progress.percentage" aria-valuemin="0" aria-valuemax="100"
                                :style="'width:'+form.progress.percentage+'%'"><i class="fas fa-spinner fa-pulse"></i>
                            </div>
                        </div>

                    </form>

                  
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>
</template>


<script>

    // vform
    import Form from 'vform';
   
    import {
        mapGetters
    } from 'vuex'

    export default {

        data() {
            return {
                // Form
                form: new Form({
                    email: '',
                    password: '',
                }),

            }
        },

        methods: {

           async login() {

                try {
                    //console.log('Form submited');
                    this.$Progress.start()
                    // request send and get response
                    const response = await this.form.post('/api/admin_login');
                    console.log(response.status)
                    // Input field make empty
                    this.form.reset();
                    this.$Progress.finish();

                    if(response.status == 200){

                        let userData = response.data.result
                        let token = response.data.auth_token

                      // Store update
                      this.$store.commit('setAdminAuthToken', token)
                      // store update
                      this.$store.commit('setAdminUser', userData)

                        //   // Localstorage Update
                        //   this.setLocalStorage('admin_auth_token', token)
                        //   // Localstorage Update
                        //   this.setLocalStorage('admin_user', userData)

                      // SessionStorage Update
                      this.setSessionStorage('admin_auth_token', token)
                      // SessionStorage Update
                      this.setSessionStorage('admin_user', userData)

                      
                      // Redirect with reload
                      // window.location = '/'
                      // Redirect to dashboard
                      this.$router.push({
                          name: 'admin'
                      })
                   

                    }
                    else{
                        Swal.fire("Failed!", response.data.msg, response.data.icon);
                        console.log(response)
                    }

                 

                } catch (response) {

                    //Swal.fire("Failed!", data.message, "warning");

                   // Swal.fire("Failed!", "Incorrect login details", "error");
                    console.log(response.status);
                    console.log(response);
                }



            },

    

         


         



        },


        mounted() {

          console.log('main_app token : ', this.token, this.user, );

        },

    


        created() {
            this.$Progress.start();
            console.log('Loging Component', this.adminToken);
          

            if (this.adminToken) {
                // Redirect to dashboard
                this.$router.push({
                    name: 'admin'
                })

            }

            this.$Progress.finish();
        },



        computed: {
            // map this.count to store.state.count
            ...mapGetters({
                //'token'     : 'getAuthToken',
                // 'user'      : 'getUser',

            })
        },




    }

</script>
