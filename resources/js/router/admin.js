import admin_index from '../components/admin/pages/index.vue';

export default [
    {
        path: '/admin',
        component: admin_index,
        name: 'admin',
        meta:{
            title: 'Admin Dashboard'
        }
    }
]