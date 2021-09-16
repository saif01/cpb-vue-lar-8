<template>

    <div>

        <header id="header" class="fixed-top">
            <div class="container">

                <b-navbar toggleable="lg" type="dark" variant="dark" class="p-0 bg-transparent">
                    <b-navbar-brand :to="{ name: 'index'}">
                        <img :src="'/all-assets/front-end/img/logo/cpb.png'"
                             width="40" height="40">
                    </b-navbar-brand>

                    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

                    <b-collapse id="nav-collapse" is-nav>

                        <!-- Right aligned nav items -->
                        <b-navbar-nav class="ml-auto forsmbg">

                            <b-nav-item :to="{ name: 'index'}">
                                Home
                            </b-nav-item>

                            <b-nav-item-dropdown text="About Us" right>
                                <b-dropdown-item :to="{name:'about_history'}">Our History</b-dropdown-item>
                                <b-dropdown-item :to="{name:'about_vision'}">Our Vision</b-dropdown-item>
                                <b-dropdown-item :to="{name:'about_mission'}">Our Mission</b-dropdown-item>
                                <b-dropdown-item :to="{name:'about_chairman_message'}">Chairman Message</b-dropdown-item>
                                <b-dropdown-item :to="{name:'about_president_message'}">President Message</b-dropdown-item>
                                <b-dropdown-item :to="{name:'about_headquarter'}">Headquarters</b-dropdown-item>
                            </b-nav-item-dropdown>

                            <b-nav-item-dropdown text="News" right>
                                <b-dropdown-item :to="{name:'news_press'}">Press Releases</b-dropdown-item>
                                <b-dropdown-item :to="{name:'news_event'}">All Events</b-dropdown-item>
                                <b-dropdown-item :to="{name:'news_gallery'}">Photo Gallery</b-dropdown-item>
                            </b-nav-item-dropdown>

                            <b-nav-item-dropdown text="Business" right>
                                <b-dropdown-item :to="{name:'business_feed'}">Feed</b-dropdown-item>
                                <b-dropdown-item :to="{name:'business_food'}">Food</b-dropdown-item>
                                <b-dropdown-item :to="{name:'business_farm'}">Farm</b-dropdown-item>
                            </b-nav-item-dropdown>

                            <b-nav-item :to="{ name: 'contact'}">Contact Us</b-nav-item>
                            <b-nav-item :to="{ name: 'carrier_index'}">Carrier</b-nav-item>

                            <b-nav-item v-if="!user" :to="{ name: 'carrier_login'}" >Login</b-nav-item>

                            <b-nav-item-dropdown v-if="user" right>

                                <template #button-content>
                                        <img :src="'images/admin/small/' + user.image" height="30"
                                            class="rounded-circle" alt="Profile">
                                </template>
                                <b-dropdown-item :to="{name:'carrier_applied'}">Applied</b-dropdown-item>
                                <b-dropdown-item :to="{name:'carrier_user_profile'}">My Profile
                                </b-dropdown-item>
                                <b-dropdown-item :to="{name:'carrier_logout'}">Logout</b-dropdown-item>
                            </b-nav-item-dropdown>

                        </b-navbar-nav>
                    </b-collapse>
                </b-navbar>

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

    import {
        mapGetters
    } from 'vuex'

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

            console.log('main_app mount : ', this.token, this.user);

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



        computed: {
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
