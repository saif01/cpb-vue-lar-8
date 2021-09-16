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
                            <div class="col-12" v-if="!form.progress">
                                <button type="submit" class="btn btn-primary btn-block">Sign In <i
                                        class="fas fa-sign-in-alt"></i></button>
                            </div>
                        </div>

                        <b-form-group v-if="form.progress">
                            <b-progress :value="form.progress.percentage" variant="success" striped animated>
                            </b-progress>
                        </b-form-group>



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

                    if (response.status == 200) {

                        let userData = response.data.result
                        let userRoleData = response.data.result.roles
                        let token = response.data.auth_token

                        console.log('login', userData, userRoleData)

                        // Store update
                        this.$store.commit('setAdminAuthToken', token)
                        // store update
                        this.$store.commit('setAdminUser', userData)
                        // Set Admin role permission
                        this.$store.commit('setAdminRoles', userRoleData)

                        //   // Localstorage Update
                        //   this.setLocalStorage('admin_auth_token', token)
                        //   // Localstorage Update
                        //   this.setLocalStorage('admin_user', userData)

                        // Clear All Session
                        this.setSessionStorage()
                        // SessionStorage Update
                        this.setSessionStorage('admin_auth_token', token)
                        // SessionStorage Update
                        this.setSessionStorage('admin_user', userData)
                        // SessionStorage Update
                        this.setSessionStorage('admin_roles', userRoleData)


                        // Redirect with reload
                        // window.location = '/'
                        // Redirect to dashboard
                        this.$router.push({
                            name: 'admin'
                        })


                    } else {
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



<style scoped>
    .login-logo,
    .register-logo {
        font-size: 2.1rem;
        font-weight: 300;
        margin-bottom: .9rem;
        text-align: center;
    }

    .login-logo a,
    .register-logo a {
        color: #495057;
    }

    .login-page,
    .register-page {
        -webkit-align-items: center;
        -ms-flex-align: center;
        align-items: center;
        background-color: #e9ecef;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
        height: 100vh;
        -webkit-justify-content: center;
        -ms-flex-pack: center;
        justify-content: center;
    }

    .login-box,
    .register-box {
        width: 360px;
    }

    @media (max-width: 576px) {

        .login-box,
        .register-box {
            margin-top: .5rem;
            width: 90%;
        }
    }

    .login-box .card,
    .register-box .card {
        margin-bottom: 0;
    }

    .login-card-body,
    .register-card-body {
        background-color: #fff;
        border-top: 0;
        color: #666;
        padding: 20px;
    }

    .login-card-body .input-group .form-control,
    .register-card-body .input-group .form-control {
        border-right: 0;
    }

    .login-card-body .input-group .form-control:focus,
    .register-card-body .input-group .form-control:focus {
        box-shadow: none;
    }

    .login-card-body .input-group .form-control:focus~.input-group-prepend .input-group-text,
    .login-card-body .input-group .form-control:focus~.input-group-append .input-group-text,
    .register-card-body .input-group .form-control:focus~.input-group-prepend .input-group-text,
    .register-card-body .input-group .form-control:focus~.input-group-append .input-group-text {
        border-color: #80bdff;
    }

    .login-card-body .input-group .form-control.is-valid:focus,
    .register-card-body .input-group .form-control.is-valid:focus {
        box-shadow: none;
    }

    .login-card-body .input-group .form-control.is-valid~.input-group-prepend .input-group-text,
    .login-card-body .input-group .form-control.is-valid~.input-group-append .input-group-text,
    .register-card-body .input-group .form-control.is-valid~.input-group-prepend .input-group-text,
    .register-card-body .input-group .form-control.is-valid~.input-group-append .input-group-text {
        border-color: #28a745;
    }

    .login-card-body .input-group .form-control.is-invalid:focus,
    .register-card-body .input-group .form-control.is-invalid:focus {
        box-shadow: none;
    }

    .login-card-body .input-group .form-control.is-invalid~.input-group-append .input-group-text,
    .register-card-body .input-group .form-control.is-invalid~.input-group-append .input-group-text {
        border-color: #dc3545;
    }

    .login-card-body .input-group .input-group-text,
    .register-card-body .input-group .input-group-text {
        background-color: transparent;
        border-bottom-right-radius: 0.25rem;
        border-left: 0;
        border-top-right-radius: 0.25rem;
        color: #777;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .login-box-msg,
    .register-box-msg {
        margin: 0;
        padding: 0 20px 20px;
        text-align: center;
    }

    .social-auth-links {
        margin: 10px 0;
    }

    .dark-mode .login-card-body,
    .dark-mode .register-card-body {
        background-color: #343a40;
        border-color: #6c757d;
        color: #fff;
    }

    .dark-mode .login-logo a,
    .dark-mode .register-logo a {
        color: #fff;
    }

</style>
