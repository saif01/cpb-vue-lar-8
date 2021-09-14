<template>

    <div>

        <header id="header" class="fixed-top">
            <div class="container">

                <nav class="navbar navbar-expand-lg p-0 navbar-dark bg-transparent">

                    <router-link :to="{ name: 'index'}" class="navbar-brand"><img :src="'all-assets/front-end/img/logo/cpb.png'"
                            alt="cpb" width="40" height="40">
                    </router-link>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse text-white" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto forsmbg">
                            <li class="nav-item">
                                <router-link :to="{ name: 'index'}" class="nav-link">Home</router-link>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    About Us
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <router-link :to="{name:'about_history'}" class="dropdown-item">Our History</router-link>
                                    <router-link :to="{name:'about_vision'}" class="dropdown-item">Our Vision</router-link>
                                    <router-link :to="{name:'about_mission'}" class="dropdown-item">Our Mission</router-link>
                                    <router-link :to="{name:'about_chairman_message'}" class="dropdown-item">Chairman
                                        Message</router-link>
                                    <router-link :to="{name:'about_president_message'}" class="dropdown-item">President
                                        Message</router-link>
                                    <router-link :to="{name:'about_headquarter'}" class="dropdown-item">Headquarters</router-link>
                                </div>
                            </li>


                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    News
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <router-link :to="{name:'news_press'}" class="dropdown-item">Press Releases</router-link>
                                    <router-link :to="{name:'news_event'}" class="dropdown-item">All Events</router-link>
                                    <router-link :to="{name:'news_gallery'}" class="dropdown-item">Photo Gallery</router-link>

                                </div>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Business
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <router-link :to="{name:'business_feed'}" class="dropdown-item">Feed</router-link>
                                    <router-link :to="{name:'business_food'}" class="dropdown-item">Food</router-link>
                                    <router-link :to="{name:'business_farm'}" class="dropdown-item">Farm</router-link>

                                </div>
                            </li>


                            <!-- <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Business
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    
                                    <router-link v-for="(item, index) in business" :key="index"  :to="{ path: 'business_index', query: { id: item.id, data:item } }" class="dropdown-item" >{{ item.name }}</router-link>
                                   
                                </div>
                            </li> -->


                            <li class="nav-item">
                                <router-link :to="{name:'contact'}" class="nav-link">Contact Us</router-link>
                            </li>

                            <li class="nav-item">
                                <router-link :to="{name:'carrier_index'}" class="nav-link">Carrier</router-link>
                            </li>

                            <li v-if="!user" class="nav-item">
                                <router-link :to="{name:'carrier_login'}" class="nav-link">Login</router-link>
                            </li>

                            <li v-if="user" class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img :src="'images/admin/small/' + user.image" height="30"
                                            class="rounded-circle" alt="Profile-Image">
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <router-link :to="{name:'carrier_applied'}" class="dropdown-item" >Applied</router-link>
                                    <router-link :to="{name:'carrier_user_profile'}" class="dropdown-item" >My Profile</router-link>
                                    <router-link :to="{name:'carrier_logout'}" class="dropdown-item" >Logout</router-link>
                                </div>
                            </li>

                            <!-- <li class="nav-item">
                                <button @click="logout"  class="nav-link">Logout</button>
                            </li> -->





                        </ul>
                    </div>
                </nav>

            </div>
        </header>
        <!-- style="background: linear-gradient(to left, #7700aa, #8800ff);" -->

        <router-view></router-view>
        <vue-progress-bar></vue-progress-bar>



        <hr>
        <!-- <p>
            Width: {{ window.width }} px<br />
            Height: {{ window.height }} px
        </p> -->

        <front-end-footer></front-end-footer>

        <!-- Back to top btn -->
        <back-to-top bottom="50px" right="50px">
            <button type="button" class="btn btn-info btn-to-top"><i class="fa fa-chevron-up"></i></button>
        </back-to-top>
    </div>
</template>


<script>
    import FrontEndFooter from './pages/common/footer.vue';

    import { mapGetters } from 'vuex'

    export default {

        data() {
            return {
                allData: {},
            }
        },

        methods: {

            getUserData() {
                axios.get('/api/athenticated').then(res => {
                    console.log(res.data)
                  
                    // console.log(this.allData.length)
                })
            },


          


        },


        mounted() {

            // Store Visitor Log
            this.$store.dispatch('visitor_log')

            console.log('main_app mount : ', this.token,  this.user);

            // window.axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`

        },

        components: {
            // Front end footer
            'front-end-footer': FrontEndFooter
        },


        created() {
            this.$Progress.start();
            //this.getDirectData();
            //this.$store.dispatch('businessData') 

            console.log('main_app created', this.token)
            // if(this.token){
            //     // Authenticated user data
            //     console.log('main_app created')
            //     this.$store.dispatch('authUserData')
            // }
           

            // Localstorage data update at store
            // this.setAuthInStore();

            console.log('Home Component');
            this.$Progress.finish();
        },



        computed : {
            // map this.count to store.state.count
            ...mapGetters({
                // 'token'     : 'getAuthToken',
                // 'user'      : 'getUser',
               
            })
        },




    }

</script>


<style>
    .router-link-exact-active {
        color: #2bed0f !important;
        text-decoration: none;
        border-bottom: 2px solid;
    }

    @media only screen and (max-width: 992px) {

        /* For mobile phones: */
        .forsmbg {
            background-color: gray;
            padding: 5px;
        }
    }

</style>
