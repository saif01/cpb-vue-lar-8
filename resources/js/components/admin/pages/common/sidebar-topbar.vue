<template>
    <div>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="#">Sidebar Nav</a>
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

                    <li class="nav-item">
                        <a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse"
                            data-target="#collapseSubItems2" aria-controls="collapseSubItems2" aria-expanded="false"><i class="fas fa-users-cog"></i> User Management</a>
                        <ul class="nav-second-level collapse" id="collapseSubItems2" data-parent="#navAccordion">
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_user' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> User</span>
                                </router-link>
                            </li>
                             <li class="nav-item">
                                <router-link :to="{ name:'admin_role' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Role</span>
                                </router-link>
                            </li>
                           
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse"
                            data-target="#collapseSubItems3" aria-controls="collapseSubItems3" aria-expanded="false"><i
                                class="far fa-newspaper"></i> News</a>
                        <ul class="nav-second-level collapse" id="collapseSubItems3" data-parent="#navAccordion">
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_event' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Event</span>
                                </router-link>
                            </li>
                             <li class="nav-item">
                                <router-link :to="{ name:'admin_press' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Press</span>
                                </router-link>
                            </li>
                            <li class="nav-item">
                                <router-link :to="{ name:'admin_gallery' }" class="nav-link">
                                    <span class="nav-link-text"><i class="far fa-hand-point-right"></i> Gallery</span>
                                </router-link>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <router-link :to="{ name:'admin_blank' }" class="nav-link"><i class="fas fa-stream"></i> Blank
                        </router-link>
                    </li>

                    <li class="nav-item">
                        <router-link :to="{ name:'admin_logout' }" class="nav-link"><i class="fas fa-sign-out-alt"></i>
                            Logout</router-link>
                    </li>

                </ul>
                <div class="ml-auto mt-2 mt-md-0 text-light">
                    <span v-if="adminUser">Name: {{ adminUser.name }}</span>
                </div>
               
            </div>
        </nav>
    </div>
</template>








