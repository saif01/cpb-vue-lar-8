import admin_index from '../components/admin/pages/index.vue';
import admin_login from '../components/admin/pages/auth/login.vue';
import admin_logout from '../components/admin/pages/auth/logout.vue';
import admin_404 from '../components/admin/pages/404_admin.vue';
import admin_blank from '../components/admin/pages/blank.vue';

// User
import admin_user from '../components/admin/pages/user/all.vue';
import admin_role from '../components/admin/pages/user/role.vue';


// News
import admin_event from '../components/admin/pages/news/event.vue';
import admin_press from '../components/admin/pages/news/press.vue';
import admin_gallery from '../components/admin/pages/news/gallery.vue';

// About 
import admin_business_operation from '../components/admin/pages/about/business-operation.vue';
import admin_headquarter from '../components/admin/pages/about/headquarter.vue';
import admin_chairman_message from '../components/admin/pages/about/chairman-message.vue';
import admin_president_message from '../components/admin/pages/about/president-message.vue';
import admin_mission from '../components/admin/pages/about/mission.vue';
import admin_vision from '../components/admin/pages/about/vision.vue';
import admin_history from '../components/admin/pages/about/history.vue';

// Business
import admin_feed from '../components/admin/pages/business/feed.vue';
import admin_food from '../components/admin/pages/business/food.vue';
import admin_farm from '../components/admin/pages/business/farm.vue';

// Recruit
import admin_recruit_circular from '../components/admin/pages/recruit/circular.vue';
import admin_recruit_user from '../components/admin/pages/recruit/user.vue';
import admin_recruit_cv from '../components/admin/pages/recruit/cv.vue';
import admin_recruit_applicant from '../components/admin/pages/recruit/applicant.vue';

//Log
import admin_visitors_log from '../components/admin/pages/logs/visitors.vue';



export default [
    {
        path: '/admin',
        component: admin_index,
        name: 'admin',
        meta:{
            title: 'Admin Dashboard',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/*',
        component: admin_404,
        name: 'admin_404',
        meta:{
            title: 'Page Not Found'
        }
    },
    {
        path: '/admin/login',
        component: admin_login,
        name: 'admin_login',
        meta:{
            title: 'Admin Login'
        },  
    },
    {
        path: '/admin/logout',
        component: admin_logout,
        name: 'admin_logout',
        meta:{
            title: 'Admin Logout',
        },  
    },
    {
        path: '/admin/blank',
        component: admin_blank,
        name: 'admin_blank',
        meta:{
            title: 'Admin Blank',
            adminAuth: true,
        },   
    },

    // User Section
    {
        path: '/admin/user',
        component: admin_user,
        name: 'admin_user',
        meta:{
            title: 'Admin User',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/role',
        component: admin_role,
        name: 'admin_role',
        meta:{
            title: 'Admin Role',
            adminAuth: true,
        },   
    },






    // News Section
    {
        path: '/admin/event',
        component: admin_event,
        name: 'admin_event',
        meta:{
            title: 'Admin News Event',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/press',
        component: admin_press,
        name: 'admin_press',
        meta:{
            title: 'Admin News Press',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/gallery',
        component: admin_gallery,
        name: 'admin_gallery',
        meta:{
            title: 'Admin News Gallery',
            adminAuth: true,
        },   
    },

    // About Section
    {
        path: '/admin/about/business_operation',
        component: admin_business_operation,
        name: 'admin_business_operation',
        meta:{
            title: 'Admin About Business Operation',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/about/headquarter',
        component: admin_headquarter,
        name: 'admin_headquarter',
        meta:{
            title: 'Admin About Headquarter',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/about/chairman_message',
        component: admin_chairman_message,
        name: 'admin_chairman_message',
        meta:{
            title: 'Admin About Chairman Message',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/about/president_message',
        component: admin_president_message,
        name: 'admin_president_message',
        meta:{
            title: 'Admin About President Message',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/about/mission',
        component: admin_mission,
        name: 'admin_mission',
        meta:{
            title: 'Admin About Mission',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/about/vision',
        component: admin_vision,
        name: 'admin_vision',
        meta:{
            title: 'Admin About Vision',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/about/history',
        component: admin_history,
        name: 'admin_history',
        meta:{
            title: 'Admin About History',
            adminAuth: true,
        },   
    },

    // Business
    {
        path: '/admin/business/feed',
        component: admin_feed,
        name: 'admin_feed',
        meta:{
            title: 'Admin Business Feed',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/business/food',
        component: admin_food,
        name: 'admin_food',
        meta:{
            title: 'Admin Business Food',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/business/farm',
        component: admin_farm,
        name: 'admin_farm',
        meta:{
            title: 'Admin Business Farm',
            adminAuth: true,
        },   
    },


    // Carrier
    {
        path: '/admin/carrier/circular',
        component: admin_recruit_circular,
        name: 'admin_recruit_circular',
        meta:{
            title: 'Admin Carrier Circular',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/carrier/user',
        component: admin_recruit_user,
        name: 'admin_recruit_user',
        meta:{
            title: 'Admin Carrier User',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/carrier/cv',
        component: admin_recruit_cv,
        name: 'admin_recruit_cv',
        meta:{
            title: 'Admin Carrier CV',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/carrier/applicant',
        component: admin_recruit_applicant,
        name: 'admin_recruit_applicant',
        meta:{
            title: 'Admin Carrier Applicant',
            adminAuth: true,
        },   
    },
    {
        path: '/admin/visitors/log',
        component: admin_visitors_log,
        name: 'admin_visitors_log',
        meta:{
            title: 'Admin Visitors Log',
            adminAuth: true,
        },   
    },



    

    

]