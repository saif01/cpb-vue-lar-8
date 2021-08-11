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
                            <li>Circular</li>
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
                              
                                <div class="accordion" id="circularPost" data-aos="fade-left">
                                   
                                    <div class="card" v-for="(item, index) in allData" :key="index" >
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
                                            :aria-labelledby="'heading'+index" data-parent="#circularPost">

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

                                                
                                                <button class="btn btn-success">Applied</button>
                                               
                                                <button class="btn btn-primary">Apply</button>
                                               

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

                           User: {{ user }}
                           Auth: {{ auth }}

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
        name:'Circular',
        data() {
            return {

                allData: '',
                
                form: new From({
                    subject: '',
                    message: '',
                    document: '',
                }),

            }
        },

        methods: {

            getDirectData() {
                axios.get('/api/circular').then(res => {

                    if (res.status == 200) {
                        this.allData = res.data
                         console.log(this.allData)
                    } else {
                        console.log(res.data)
                    }

                })
            },

            
            // Send CV 
            async sendMsg() {
                console.log('Form submited');
                this.$Progress.start()
                // request send and get response
                const response = await this.form.post('/api/circular_msg');
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

            this.getDirectData();
            console.log('Circular Component');

            this.$Progress.finish();

        },

        mounted (){
            // console.log('auth Data : ', this.user, this.user.name)
        },


        computed : {
            // map this.count to store.state.count
            ...mapGetters({
                'auth' : 'getUserAuth',
                'user' : 'getUser'
            })
        },


      

    }

</script>

