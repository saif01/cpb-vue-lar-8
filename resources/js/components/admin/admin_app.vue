<template>
    <div>
        <div v-if="adminToken">
             <!-- Sidebar Topbar -->
            <sidebar-topbar ></sidebar-topbar>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper" style="min-height: 1592.4px;">
                <!-- Content Header (Page header) -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row my-3">

                            <router-view></router-view>
                            <vue-progress-bar></vue-progress-bar>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>
            </div>
            <!-- /.content-wrapper -->

            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <strong>Copyright © 2014-2019 All rights reserved.</strong>
                </div>
            </footer>
        </div>

        <div v-else>
            <router-view></router-view>
            <vue-progress-bar></vue-progress-bar>
        </div>
       
    </div>
</template>


<script>
   
    import SidebarTopbar from './pages/common/sidebar-topbar.vue'
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

            //console.log('main_app token : ', this.adminToken);

            

            // window.axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`

        },

        components:{
            'sidebar-topbar' : SidebarTopbar
        },

       


        created() {
            this.$Progress.start();
           
            if(this.adminToken){
                // Authenticated user data
                console.log('main_app created')
                this.$store.dispatch('authAdminUserData')
            }

            console.log('main_app created', this.adminToken, this.adminUser)

            //console.log('main_app Session', this.getSessionStorage('admin_auth_token') )
            //console.log('main_app Session', this.getSessionStorage('admin_user') )
         
            this.$Progress.finish();
        },



        computed : {
            // map this.count to store.state.count
            ...mapGetters({
                //'token'     : 'getAuthToken',
                // 'user'      : 'getUser',
              
            })
        },




    }

</script>