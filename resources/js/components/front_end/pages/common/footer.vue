<template>
    <div>
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-4 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <router-link :to="{ name: 'index'}">Home</router-link>
                                <li><i class="bx bx-chevron-right"></i> <router-link :to="{ name: 'contact' }">Contact us</router-link>
                                </li>
                                <li><i class="bx bx-chevron-right"></i> <router-link :to="{ name: 'about_headquarter' }">Our
                                        Headquarters</router-link></li>
                            </ul>
                        </div>



                        <div class="col-lg-4 col-md-6 footer-contact">
                            <h4>Contact Us</h4>
                            <p>
                                {{ footer.address }} <br><br>
                                <strong>Phone:</strong> <a :href="'tel:'+footer.phone">{{ footer.phone }}</a> <br>
                                <strong>Email:</strong> <a :href="'mailto:'+footer.email">{{ footer.email }}</a>
                                <br>
                            </p>

                        </div>

                        <div class="col-lg-4 col-md-6 footer-info">
                            <h3>We Certified From</h3>
                            <div class="row">
                                <div class="col">
                                    <img src="/all-assets/front-end/img/footer/ISO.png"
                                        class="img-fluid rounded" alt="CPB-Image">
                                </div>
                                <div class="col">
                                    <img src="/all-assets/front-end/img/footer/Halal.png"
                                        class="img-fluid rounded" alt="CPB-Image">
                                </div>
                                <div class="col">
                                    <img src="/all-assets/front-end/img/footer/GMP.png"
                                        class="img-fluid rounded" alt="CPB-Image">
                                </div>
                                <div class="col">
                                    <img src="/all-assets/front-end/img/footer/HACCP.png"
                                        class="img-fluid rounded" alt="CPB-Image">
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong><span>CPB-IT</span> <img
                            src="/all-assets/common/logo/cpb/cpbit-96x96.png" height="24" weidth="24"
                            alt=""></strong>&nbsp;&nbsp; All Rights Reserved
                </div>
            </div>
        </footer>


        <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
    </div>
</template>


<script>

    import { mapGetters } from 'vuex'

    export default { 
        
        name:'Footer',

        data(){

            return{
                allData: '',
            }
        },

        methods:{

        
        },

        // mounted(){
        //     console.log('footer: ', this.footer)
        // },

        // async created() {
        //     const res = await this.callApi('get', '/api/footer')
        //     if( res.status == 200 ){
        //         this.allData = res.data
        //     }else{
        //         console.log(res)
        //     }
        // },

        created() {
            this.$store.dispatch('footerData');
        },

         computed : {
            // map this.count to store.state.count
            ...mapGetters({
                'footer' : 'getFooterData',
              
            })
        },


    }

</script>
