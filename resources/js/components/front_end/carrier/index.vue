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
                            <li>Carrier</li>
                            <li>Dashboard</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="contact">
                <div class="container">

                    <div class="row">

                            <div class="col-8 mb-4">

                                <p class="text-center h4"><b>All Vacancies</b></p>

                                <div v-if="loading" class="row justify-content-center">
                                    <div class="fa-4x text-success mt-3">
                                        <i class="fas fa-spinner fa-pulse"></i>
                                    </div>
                                </div>
                                <div v-if="!Object.keys(store_data).length && !loading" class="row justify-content-center">
                                    <h3 class="text-danger">No Data Available</h3>
                                </div>

                                <div class="accordion" id="carrierPost" data-aos="fade-left">
                                <!-- <div class="accordion" id="carrierPost" data-aos="fade-left"> -->
                                   
                                    <div class="card" v-for="(item, index) in store_data" :key="index" >
                                        <div class="card-header" :id="'heading_'+index">
                                            <h2 class="mb-0">
                                                <button class="btn btn-link btn-block text-left" type="button"
                                                    data-toggle="collapse" :data-target="'#collapseOne_'+index"
                                                    aria-expanded="true" :aria-controls="'collapseOne_'+index">
                                                    <b>{{ index+1 }} : </b> {{ item.jobTitle }} <span
                                                        class="small float-right font-italic text-danger">Deadline :
                                                        {{ item.moddate }}</span>
                                                </button>
                                            </h2>
                                        </div>

                                        
                                        <div :id="'collapseOne_'+index" class="collapse"
                                            :aria-labelledby="'heading'+index" data-parent="#carrierPost">

                                            <div class="card-body">
                                                <b>Educational Requirements : </b><br>
                                                &nbsp;&nbsp;&nbsp;{{ item.education }}<br><br>

                                                <b>Job Responsibilities : </b><br>
                                                &nbsp;&nbsp;&nbsp;<span v-html="item.requirement"></span><br><br>

                                                <b>Experience Requirements : </b><br>
                                                &nbsp;&nbsp;&nbsp;<span v-html="item.experience"></span><br><br>

                                                <b>Details : </b><br>
                                                &nbsp;&nbsp;&nbsp;<span v-html="item.details"></span><br><br>

                                                <b>Job Location : </b><br>
                                                &nbsp;&nbsp;&nbsp;<span v-html="item.location"></span><br><br>

                                                <b>Salary : </b><br>
                                                &nbsp;&nbsp;&nbsp;<span v-html="item.salary"></span><br><br>

                                                
                                                <button v-if="checkApplied(item)" class="btn btn-success">Applied</button>
                                               
                                                <button v-else @click="applyForJob(item.id)" class="btn btn-primary">Apply</button>

                                               
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                

                            </div>

                            <div class="col-4" data-aos="fade-right">
                                <p class="text-center h4"><b>Send CV Without Register</b></p>
                                <form @submit.prevent="sendMsg()">
                                    <div class="php-email-form-vue">
                                      
                                        <div class="form-group">
                                            <b-form-input class="form-control" :class="{ 'is-invalid': form.errors.has('subject') }" v-model="form.subject" placeholder="Enter your Subject"></b-form-input>
                                            <div class="small text-danger" v-if="form.errors.has('subject')"
                                                v-html="form.errors.get('subject')" />
                                        </div>
                                        <div class="form-group">
                                            <b-form-textarea
                                                class="form-control"
                                               :class="{ 'is-invalid': form.errors.has('message') }"
                                                v-model="form.message"
                                                placeholder="Enter something..."
                                                rows="3"
                                                max-rows="6"
                                                ></b-form-textarea>
                                            <div class="small text-danger" v-if="form.errors.has('message')"
                                                v-html="form.errors.get('message')" />
                                        </div>

                                       

                                        <div class="form-group">
                                             <b-form-file
                                                @change="onFileChange"
                                                placeholder="Choose a file or drop it here..."
                                                drop-placeholder="Drop file here..."
                                                ></b-form-file>
                                             <div class="small text-danger" v-if="form.errors.has('document')"
                                                v-html="form.errors.get('document')" />
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
                                                Send Message </button>
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
        name:'carrier',
        data() {
            return {
               
                form: new From({
                    subject: '',
                    message: '',
                    document: '',
                }),

            }
        },

        methods: {

            // Check Applied or not
            checkApplied(item){
                //console.log(item.user_apply)
                if(this.user &&  item.user_apply){
                    if(item.user_apply.recuit_circular_id == item.id && item.user_apply.user_id == this.user.id){
                        return true;
                    }
                }
                return false;
            },

         

            async applyForJob(id) {

                if(! this.user ){
                    Swal.fire("Failed!", "Please Login to apply", "warning");
                    // Auth redirect to login
                    this.$router.push({name:'carrier_login'})
                    
                }else{
                    // After Login 
                    try {

                        const response = await axios.post('/api/carrier_job_apply', {
                            carrierId: id, user: this.user
                        });
                        console.log(response);

                        if (response.status == 200) {

                            // Update data by store
                            this.$store.dispatch('recruitData');

                            Toast.fire({
                                icon: response.data.icon,
                                title: response.data.msg
                            });
                        } else if(response.status == 203){

                        
                            // Redirect to dashboard
                            this.$router.push({ name:'carrier_login' });

                            Toast.fire({
                                icon: response.data.icon,
                                title: response.data.msg
                            });
                            

                        }else {
                            Swal.fire("Failed!", data.message, "warning");
                            console.log(response);
                        }
                        
                    } catch (error) {
                        console.error(error);
                    }

                }
                
            },

            
            // Send CV 
            async sendMsg() {
                console.log('Form submited');
                this.$Progress.start()
                // request send and get response
                const response = await this.form.post('/api/carrier_msg');
                // Input field make empty
                this.form.reset();
                this.form.errors.clear();

                this.$Progress.finish();

                if (response.status == 200) {
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
            console.log('carrier Component');

            if(!this.store_data.length){
                this.$store.dispatch('recruitData')
            }

            this.$Progress.finish();

        },

        mounted (){
            // console.log('auth Data : ', this.user, this.user.name)
        },


        computed : {
            // map this.count to store.state.count
            ...mapGetters({
                'store_data' : 'getRecruitData',
            })
        },


      

    }

</script>

