import admin_index from '../components/admin/pages/index.vue';
import admin_login from '../components/admin/pages/auth/login.vue';
import admin_logout from '../components/admin/pages/auth/logout.vue';
import admin_404 from '../components/admin/pages/404.vue';
import admin_blank from '../components/admin/pages/blank.vue';

//News
import admin_event from '../components/admin/pages/news/event.vue';

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
    {
        path: '/admin/event',
        component: admin_event,
        name: 'admin_event',
        meta:{
            title: 'Admin News Event',
            adminAuth: true,
        },   
    },

]