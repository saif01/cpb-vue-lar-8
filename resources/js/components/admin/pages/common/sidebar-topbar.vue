<template>
    <div>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
            <router-link :to="{name: 'admin'}" class="navbar-brand">CPB Admin</router-link>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto sidenav" id="navAccordion">
                    <li class="nav-item active">
                        <router-link :to="{name: 'admin'}" class="nav-link"><i class="fas fa-home"></i> Home
                        </router-link>
                    </li>

                    <li class="nav-item" v-if="isAdminManagePermitted || isRoleManagePermitted">
                        <a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse"
                            data-target="#collapseSubItems2" aria-controls="collapseSubItems2" aria-expanded="false"><i
                                class="fas fa-users-cog"></i> Admin Management</a>
                        <ul class="nav-second-level collapse" id="collapseSubItems2" data-parent="#navAccordion">
                            <li class="nav-item" v-if="isAdminManagePermitted">
                                <router-link :to="{ name:'admin_user' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> User</span>
                                </router-link>
                            </li>
                            <li class="nav-item" v-if="isRoleManagePermitted">
                                <router-link :to="{ name:'admin_role' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Role</span>
                                </router-link>
                            </li>

                        </ul>
                    </li>

                    <li class="nav-item" v-if="isNewsPermitted">
                        <a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse"
                            data-target="#collapseSubItems3" aria-controls="collapseSubItems3" aria-expanded="false"><i
                                class="far fa-newspaper"></i> News Section <b-badge v-if="inactiveTotalNewsSection" variant="warning">{{ inactiveTotalNewsSection }}</b-badge></a> 
                        <ul class="nav-second-level collapse" id="collapseSubItems3" data-parent="#navAccordion">
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_event' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Event </span> <b-badge v-if="inactiveNewsEvent" variant="warning">{{ inactiveNewsEvent }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_press' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Press</span> <b-badge v-if="inactiveNewsPress" variant="warning">{{ inactiveNewsPress }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_gallery' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Gallery</span>
                                </router-link>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item" v-if="isAboutPermitted">
                        <a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse"
                            data-target="#collapseSubItems4" aria-controls="collapseSubItems4" aria-expanded="false"><i
                                class="far fa-newspaper"></i> About Section <b-badge v-if="inactiveTotalAboutSection" variant="warning">{{ inactiveTotalAboutSection }}</b-badge></a>
                        <ul class="nav-second-level collapse" id="collapseSubItems4" data-parent="#navAccordion">
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_business_operation' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Business
                                        Operations</span> <b-badge v-if="inactiveAboutBusinessOperation" variant="warning">{{ inactiveAboutBusinessOperation }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_headquarter' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i>
                                        Headquarters</span> <b-badge v-if="inactiveAboutHeadquarter" variant="warning">{{ inactiveAboutHeadquarter }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_chairman_message' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Chairman
                                        Message</span> <b-badge v-if="inactiveAboutChairmanMessage" variant="warning">{{ inactiveAboutChairmanMessage }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_president_message' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> President
                                        Message</span> <b-badge v-if="inactiveAboutPresidentMessage" variant="warning">{{ inactiveAboutPresidentMessage }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_mission' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Mission</span> <b-badge v-if="inactiveAboutMission" variant="warning">{{ inactiveAboutMission }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_vision' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Vision</span> <b-badge v-if="inactiveAboutVision" variant="warning">{{ inactiveAboutVision }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_history' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> History</span> <b-badge v-if="inactiveAboutHistory" variant="warning">{{ inactiveAboutHistory }}</b-badge>
                                </router-link>
                            </li>

                        </ul>
                    </li>

                    <li class="nav-item" v-if="isBusinessPermitted">
                        <a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse"
                            data-target="#collapseSubItems5" aria-controls="collapseSubItems5" aria-expanded="false"><i
                                class="far fa-newspaper"></i> Business Section <b-badge v-if="inactiveTotalBusinessSection" variant="warning">{{ inactiveTotalBusinessSection }}</b-badge></a>
                        <ul class="nav-second-level collapse" id="collapseSubItems5" data-parent="#navAccordion">
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_feed' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Feed</span> <b-badge v-if="inactiveBusinessFeed" variant="warning">{{ inactiveBusinessFeed }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_food' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Food</span> <b-badge v-if="inactiveBusinessFood" variant="warning">{{ inactiveBusinessFood }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_farm' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Farm</span> <b-badge v-if="inactiveBusinessFarm" variant="warning">{{ inactiveBusinessFarm }}</b-badge>
                                </router-link>
                            </li>

                        </ul>
                    </li>


                    <li class="nav-item" v-if="isRecruitPermitted">
                        <a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse"
                            data-target="#collapseSubItems6" aria-controls="collapseSubItems6" aria-expanded="false"><i
                                class="far fa-newspaper"></i> Carrier Section <b-badge v-if="inactiveRecuitCircular" variant="warning">{{ inactiveRecuitCircular }}</b-badge></a>
                        <ul class="nav-second-level collapse" id="collapseSubItems6" data-parent="#navAccordion">
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_recruit_circular' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Circular </span><b-badge v-if="inactiveRecuitCircular" variant="warning">{{ inactiveRecuitCircular }}</b-badge>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_recruit_cv' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> CV</span>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_recruit_user' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> User</span>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_recruit_applicant' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Applicant</span>
                                </router-link>
                            </li>

                        </ul>
                    </li>

                    <li class="nav-item" v-if="isLogPermitted">
                        <a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse"
                            data-target="#collapseSubItems7" aria-controls="collapseSubItems7" aria-expanded="false"><i
                                class="far fa-newspaper"></i> Login Logs</a>
                        <ul class="nav-second-level collapse" id="collapseSubItems7" data-parent="#navAccordion">
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_visitors_log' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Visitors Logs</span>
                                </router-link>
                                <router-link :to="{ name:'admin_login_log' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Admins Logs</span>
                                </router-link>
                            </li>
                        </ul>
                    </li>


                    <!-- <li class="nav-item">
                        <router-link :to="{ name:'admin_blank' }" class="nav-link"><i class="fas fa-stream"></i> Blank
                        </router-link>
                    </li> -->

                    <li class="nav-item">
                        <router-link :to="{ name:'admin_profile' }" class="nav-link"><i class="fas fa-sign-out-alt"></i>
                            My Profile</router-link>
                    </li>

                    <li class="nav-item">
                        <router-link :to="{ name:'admin_logout' }" class="nav-link"><i class="fas fa-sign-out-alt"></i>
                            Logout</router-link>
                    </li>

                </ul>
                <div class="ml-auto mt-2 mt-md-0 text-light">
                    <span v-if="adminUser">Name: {{ adminUser.name }}, <span class="text-danger"
                            v-if="isAdministrator">( Administrator ) </span> </span>

                   
                </div>

            </div>
        </nav>
    </div>
</template>


<script>
  
    export default {
       
        data() {
            return {

                inactiveRecuitCircular:0,

                inactiveNewsEvent:0,
                inactiveNewsPress:0,
                inactiveTotalNewsSection:0,

                inactiveAboutBusinessOperation:0,
                inactiveAboutChairmanMessage:0,
                inactiveAboutHeadquarter:0,
                inactiveAboutHistory:0,
                inactiveAboutMission:0,
                inactiveAboutPresidentMessage:0,
                inactiveAboutVision:0,
                inactiveTotalAboutSection:0,

                inactiveBusinessFarm:0,
                inactiveBusinessFeed:0,
                inactiveBusinessFood:0,
                inactiveTotalBusinessSection:0,
               
            }
        },
        methods: {

            getInactiveList(){
                axios.get('/api/admin/inactive_list')
                    .then(response => {
                        console.log(response.data);
                        this.inactiveNewsEvent          = response.data.NewsEvent;
                        this.inactiveNewsPress          = response.data.NewsPress;
                        this.inactiveTotalNewsSection   = response.data.TotalNewsSection;


                        this.inactiveRecuitCircular     = response.data.RecuitCircular;

                        this.inactiveAboutBusinessOperation = response.data.AboutBusinessOperation;
                        this.inactiveAboutChairmanMessage   = response.data.AboutChairmanMessage;
                        this.inactiveAboutHeadquarter       = response.data.AboutHeadquarter;
                        this.inactiveAboutHistory           = response.data.AboutHistory;
                        this.inactiveAboutMission           = response.data.AboutMission;
                        this.inactiveAboutPresidentMessage  = response.data.AboutPresidentMessage;
                        this.inactiveAboutVision            = response.data.AboutVision;
                        this.inactiveTotalAboutSection      = response.data.TotalAboutSection;

                        this.inactiveBusinessFarm       = response.data.BusinessFarm;
                        this.inactiveBusinessFeed       = response.data.BusinessFeed;
                        this.inactiveBusinessFood       = response.data.BusinessFood;
                        this.inactiveTotalBusinessSection = response.data.TotalBusinessSection;


                    })
                    .catch(error => {
                        console.log(error)
                    })
            },


         

         
           

           
        },
        created() {
            
        },
        mounted(){

            this.getInactiveList(); 
        },

        // computed: {
        //     // totalNewInactive: function(){
        //     //    return this.inactiveNewsEvent + this.inactiveNewsPress;
        //     // }
        // }



    }

</script>
