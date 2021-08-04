<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Contact</h2>
                        <ol>
                            <li>
                                <router-link to="/">Home</router-link>
                            </li>
                            <li>Contact</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="contact">
                <div class="container">

                    <div class="row">

                        <div class="col-lg-6" data-aos="fade-left">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="info-box">
                                        <i class="fas fa-map-marked-alt"></i>
                                        <h3>Our Address</h3>
                                        <p>{{ allData.address }}</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info-box">
                                        <i class="fas fa-mail-bulk"></i>
                                        <h3>Email Us</h3>
                                        <p><a v-if="allData.email"
                                                :href="'mailto:'+allData.email">{{ allData.email }}</a></p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info-box">
                                        <i class="fas fa-phone-volume"></i>
                                        <h3>Call Us</h3>
                                        <p><a v-if="allData.phone" :href="'tel:'+allData.phone">{{ allData.phone }}</a>
                                        </p>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-6">
                            <form @submit.prevent="sendMsg()">
                                <div class="php-email-form-vue">
                                    <div class="form-row">
                                        <div class="col-md-6 form-group">
                                            <input type="text" v-model="form.name" class="form-control"
                                                placeholder="Your Name" />
                                            <div class="small text-danger" v-if="form.errors.has('name')"
                                                v-html="form.errors.get('name')" />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <input type="email" class="form-control" v-model="form.email"
                                                placeholder="Your Email" />
                                            <div class="small text-danger" v-if="form.errors.has('email')"
                                                v-html="form.errors.get('email')" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" v-model="form.subject"
                                            placeholder="Subject" />
                                        <div class="small text-danger" v-if="form.errors.has('subject')"
                                            v-html="form.errors.get('subject')" />
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" v-model="form.message" rows="5"
                                            placeholder="Message"
                                            :class="{ 'is-invalid': form.errors.has('message') }"></textarea>
                                        <div class="small text-danger" v-if="form.errors.has('message')"
                                            v-html="form.errors.get('message')" />
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


            <!-- ======= Map Section ======= -->
            <mapview></mapview>
            <!-- End Map Section -->

        </main><!-- End #main -->
    </div>
</template>



<script>
    import From from 'vform';
    import mapview from './common/map.vue';

    export default {

        data() {
            return {

                allData: '',

                form: new From({
                    name: '',
                    email: '',
                    subject: '',
                    message: '',
                }),
            }
        },

        methods: {

            getDirectData() {
                axios.get('/api/contact').then(res => {

                    if (res.status == 200) {
                        this.allData = res.data
                        //console.log(this.allData.address)
                    } else {
                        console.log(res.data)
                    }

                })
            },


            async sendMsg() {
                console.log('Form submited');
                this.$Progress.start()
                // request send and get response
                const response = await this.form.post('/api/contact_msg');
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
            console.log('Contact Component');

            this.$Progress.finish();

        },

        components:{
            mapview
        }

    }

</script>
