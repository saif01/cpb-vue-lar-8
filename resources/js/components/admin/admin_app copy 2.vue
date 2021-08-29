<template>
    <div>
        <BootstrapSidebar v-if="adminToken" :initial-show="initialShow" :links="links" :header="header" :fa="true"
            @sidebarChanged="onSidebarChanged">
            <template v-slot:navbar>
                <b-navbar id="mainNavbar" toggleable="lg" type="light" variant="light" fixed="top">
                    <b-navbar-nav>
                        <b-nav-item> Navbar 
                            <span>
                                Name: Saiff
                            </span>
                        </b-nav-item>
                         
                    </b-navbar-nav>
                </b-navbar>
            </template>

            <template v-slot:content>
                <b-container style="margin-top: 56px">

                    <router-view></router-view>
                    <vue-progress-bar></vue-progress-bar>

                </b-container>
            </template>
        </BootstrapSidebar>

        <div v-else>
            <router-view></router-view>
            <vue-progress-bar></vue-progress-bar>
        </div>

    </div>
</template>


<script>
    import SidebarTopbar from './pages/common/sidebar-topbar.vue'
    import {
        mapGetters
    } from 'vuex'

    export default {

        components: {
            'sidebar-topbar': SidebarTopbar
        },

        data() {
            return {
                allData: {},

                initialShow: true,
                header: "<h3>Sidebar</h3>",
                links: [{
                        name: "Home",
                        href: {
                            name: "admin"
                        },
                        faIcon: ["fas", "home"]
                    },
                    {
                        name: "News",
                        faIcon: ["fas", "tint"],
                        children: [{
                                name: "Event",
                                href: {
                                    name: "admin_event",
                                },
                                faIcon: ["fas", "child"],
                            },
                            {
                                name: "Child Item 2",
                                href: {
                                    name: "child-item-2",
                                },
                                faIcon: ["fas", "child"],
                            },
                        ],
                    },
                    {
                        name: "Admin Blank",
                        href: {
                            name: "admin_blank"
                        },
                        faIcon: "users"
                    },

                    {
                        name: "Logout",
                        href: {
                            name: "admin_logout"
                        },
                        faIcon: ["fas", "signOutAlt"]
                    },
                   
                ],
            }
        },

        methods: {

            onSidebarChanged() {},

            getUserData() {
                axios.get('/api/athenticated').then(res => {
                    console.log(res.data)

                    // console.log(this.allData.length)
                })
            },



        },


        mounted() {



            //console.log('main_app token : ', this.adminToken);



            // window.axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`

        },






        created() {
            this.$Progress.start();

            if (this.adminToken) {
                // Authenticated user data
                console.log('main_app created')
                this.$store.dispatch('authAdminUserData')
            }

            console.log('main_app created', this.adminToken, this.adminUser)

            //console.log('main_app Session', this.getSessionStorage('admin_auth_token') )
            //console.log('main_app Session', this.getSessionStorage('admin_user') )

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



<style lang="scss">
    /* @import "node_modules/bootstrap/scss/bootstrap";
@import "node_modules/bootstrap-vue/src/index.scss"; */
    @import "node_modules/vue-bootstrap-sidebar/src/scss/default-theme";
    

</style>
