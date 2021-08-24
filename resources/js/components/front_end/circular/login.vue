<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Circular</h2>
                        <ol>
                            <li>
                                <router-link to="/">Home</router-link>
                            </li>
                            <li>Login</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="contact">
                <div class="container">

                    <div class="row justify-content-center">
                        <div class="col-6">

                             <p class="text-center h4"><b>Login</b></p>

                            <div v-if="error" class="alert alert-danger text-center">
                               <span>{{ errorMsg }}</span>
                            </div>

                                <form @submit.prevent="login()">
                                    <div class="php-email-form-vue">
                                      
                                        <div class="form-group">
                                            <b-form-input class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" v-model="form.email" placeholder="Enter your E-mail / Phome "></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('email')"
                                                v-html="form.errors.get('email')" />
                                        </div>

                                         <div class="form-group">
                                            <b-form-input type="password" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" v-model="form.password" placeholder="Enter your password"></b-form-input>
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
                                               Login </button>
                                        </div>

                                        <div class="row mt-4 justify-content-center">
                                            <router-link to="circular_register" class="btn btn-info btn-sm text-white" >Do you want to register ?</router-link>
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
        name:'Login',
        data() {
            return {

                error: false,
                errorMsg:'',
                
                form: new From({
                    email: '',
                    password: '',
                }),

            }
        },

        methods: {


            // Set localstorage
            setLocalStorage(localkey, localData){
                // Current Storage Time 
                localStorage.setItem('etl', new Date().getTime());
                // Store data In local
                localStorage.setItem(localkey, localData);
            },



            // login 
            async login() {
                console.log('Form submited');
                this.$Progress.start()
                // request send and get response
                const response = await this.form.post('/api/circular_login');
                // Input field make empty
                this.form.reset();
                this.form.errors.clear();

                this.$Progress.finish();

                if (response.status == 200) {

                    console.log(response.data.auth_token, response.data.result)

                   
                    // Set Localstorage data
                    //this.setLocalStorage( 'auth_user', true );
                    this.setLocalStorage( 'auth_token', response.data.auth_token );
                    //this.setLocalStorage( 'user_data', JSON.stringify(response.data.result) );
                         
                    // store Update     
                    this.$store.commit('setUser',  response.data.result);
                    this.$store.commit('setAuthToken',  response.data.auth_token);
                    //this.$store.commit('setAuth',  true);

                    // console.log(  this.$store.state.user  )
                    // console.log( JSON.parse( this.$store.state.user ) )

                    // Redirect to dashboard
                    this.$router.push('circular_index')

                   
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

            if(this.token){
                // Auth true redirect to dashboard
                this.$router.push('circular_index')
            }

            this.$Progress.start();
            //this.getDirectData();
            console.log('Circular Login Component');
            this.$Progress.finish();

        },


        computed : {
            // map this.count to store.state.count
            ...mapGetters({
               // 'token'     : 'getAuthToken',
            })
        },

      

    }

</script>

