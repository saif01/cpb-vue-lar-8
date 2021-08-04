<template>
    <div>
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-4 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="http://cpb-8">Home</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="http://cpb-8/contact">Contact us</a>
                                </li>
                                <li><i class="bx bx-chevron-right"></i> <a href="http://cpb-8/about/headquarters">Our
                                        Headquarters</a></li>
                            </ul>
                        </div>



                        <div class="col-lg-4 col-md-6 footer-contact">
                            <h4>Contact Us</h4>
                            <p>
                                {{ allData.address }} <br><br>
                                <strong>Phone:</strong> <a :href="'tel:'+allData.phone">{{ allData.phone }}</a> <br>
                                <strong>Email:</strong> <a :href="'mailto:'+allData.email">{{ allData.email }}</a>
                                <br>
                            </p>

                        </div>

                        <div class="col-lg-4 col-md-6 footer-info">
                            <h3>We Certified From</h3>
                            <div class="row">
                                <div class="col">
                                    <img src="http://cpb-8/all-assets/front-end/img/footer/ISO.png"
                                        class="img-fluid rounded" alt="CPB-Image">
                                </div>
                                <div class="col">
                                    <img src="http://cpb-8/all-assets/front-end/img/footer/Halal.png"
                                        class="img-fluid rounded" alt="CPB-Image">
                                </div>
                                <div class="col">
                                    <img src="http://cpb-8/all-assets/front-end/img/footer/GMP.png"
                                        class="img-fluid rounded" alt="CPB-Image">
                                </div>
                                <div class="col">
                                    <img src="http://cpb-8/all-assets/front-end/img/footer/HACCP.png"
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
                            src="http://cpb-8/all-assets/common/logo/cpb/cpbit-96x96.png" height="24" weidth="24"
                            alt=""></strong>&nbsp;&nbsp; All Rights Reserved
                </div>
            </div>
        </footer>

        <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
    </div>
</template>


<script>

    export default {

        data(){

            return{
                allData: '',
            }
        },

        methods:{

        
        },

        async created() {
            const res = await this.callApi('get', '/api/footer')
            if( res.status == 200 ){
                this.allData = res.data
            }else{
                console.log(res)
            }
        },


    }

</script>
