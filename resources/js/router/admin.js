import admin_index from '../components/admin/pages/index.vue';
import admin_login from '../components/admin/pages/auth/login.vue';
import admin_logout from '../components/admin/pages/auth/logout.vue';
import admin_404 from '../components/admin/pages/404.vue';
import admin_blank from '../components/admin/pages/blank.vue';

// User
import admin_user from '../components/admin/pages/user/all.vue';
import admin_role from '../components/admin/pages/user/role.vue';


// News
import admin_event from '../components/admin/pages/news/event.vue';
import admin_press from '../components/admin/pages/news/press.vue';
import admin_gallery from '../components/admin/pages/news/gallery.vue';

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
    

]