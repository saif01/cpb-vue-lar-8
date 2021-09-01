<template>
    <div>
        <div v-if="adminToken">
            <sidebar-topbar></sidebar-topbar>

            <main class="content-wrapper">
                <div class="container-fluid px-2 py-1">
                   
                    <router-view></router-view>
                    <vue-progress-bar></vue-progress-bar>
                   
                </div>
            </main>

            <admin-footer></admin-footer>
        </div>

        <div v-else>
            <router-view></router-view>
            <vue-progress-bar></vue-progress-bar>
        </div>


    </div>
</template>


<script>
    import SidebarTopbar from './pages/common/sidebar-topbar.vue'
    import adminFooter from './pages/common/footer.vue'
    import {
        mapGetters
    } from 'vuex'

    export default {

        components: {
            'sidebar-topbar': SidebarTopbar,
            'admin-footer': adminFooter
        },

        data() {
            return {
                allData: {},

            }
        },

        methods: {

            onSidebarChanged() {},

            getUserData() {
                axios.get('/api/user').then(res => {
                    //console.log('from request', res.data)
                   
                    // console.log(this.allData.length)
                })
            },



            checkR(role){

                let result = false;

                this.adminRoles.filter(function (element) {
                
                    //console.log('roleCheck filter', element.name)
                    if(element.name == role){
                        //console.log('Found')
                        result= true ;
                    }

                })

                return result;

            }


             



        },


        mounted() {


            let res = this.checkRole('Administrator');

            let resarr = this.checkAnyRole(['Administrator2', 'Add', 'dddd',])
            
            
            console.log('Role mounted :', res,  resarr, this.isAdministrator)

            // window.axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`

        },






        created() {
            this.$Progress.start();

            // if (this.adminToken) {
            //     // Authenticated user data
            //     console.log('main_app created')
            //     this.$store.dispatch('authAdminUserData')
            // }

            console.log('main_app created', this.adminUser, this.adminRoles)
            

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


<style>
    .content-wrapper {
        margin-top: 55px !important;
        min-height: 100vh;
    }

    .nav-link:hover {
        transition: all 0.4s;
    }

    .nav-link-collapse:after {
        float: right;
        content: "\f067";
        font-family: "Font Awesome\ 5 Free";
        font-weight: 900;
    }

    .nav-link-show:after {
        float: right;
        content: "\f068";
        font-family: "Font Awesome\ 5 Free";
        font-weight: 900;
    }

    .nav-item ul.nav-second-level {
        padding-left: 0;
    }

    .nav-item ul.nav-second-level>.nav-item {
        padding-left: 20px;
    }

    @media (min-width: 992px) {
        .sidenav {
            position: absolute;
            top: 0;
            left: 0;
            width: 220px;
            height: calc(100vh - 3.5rem);
            margin-top: 3.5rem;
            background: #343a40;
            box-sizing: border-box;
            border-top: 1px solid rgba(0, 0, 0, 0.3);
        }

        .navbar-expand-lg .sidenav {
            flex-direction: column;
        }

        .content-wrapper {
            margin-left: 215px;
        }


    }

    /* .footer {
        width: calc(100% - 230px);
        margin-top: auto;
        margin-left: 220px;
        position: absolute;
        bottom: 0;
        width: 100%;
        height: 3.5rem;
        line-height: 3.5rem;
        background-color: #ccc;
    } */

    /* .footer {
        position: absolute;
        right: 0;
        bottom: 0;
        left: 0;
        padding: 1rem;
        background-color: #d94575;
        text-align: center;
        color: #fff;
    } */

    body{ 
        display:flex; 
        flex-direction:column; 
    }

    .footer{
    margin-top:auto; 
    }

   

</style>
