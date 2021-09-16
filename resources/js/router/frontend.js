import index from '../components/front_end/pages/index.vue';
import not_found from '../components/front_end/pages/404.vue';
import contact from '../components/front_end/pages/contact.vue';

// News
import news_gallery from '../components/front_end/pages/news/gallery.vue';
import news_press from '../components/front_end/pages/news/press.vue';
import news_event from '../components/front_end/pages/news/event.vue';

// About
import about_chairman_message from '../components/front_end/pages/about/chairman-message.vue';
import about_president_message from '../components/front_end/pages/about/president-message.vue';
import about_vision from '../components/front_end/pages/about/vision.vue';
import about_mission from '../components/front_end/pages/about/mission.vue';
import about_headquarter from '../components/front_end/pages/about/headquarter.vue';
import about_history from '../components/front_end/pages/about/history.vue';
import business_index from '../components/front_end/pages/business/index.vue';

// carriers
import carrier_index from '../components/front_end/carrier/index.vue';
import carrier_login from '../components/front_end/carrier/login.vue';
import carrier_logout from '../components/front_end/carrier/logout.vue';
import carrier_applied from '../components/front_end/carrier/applied.vue';
import carrier_register from '../components/front_end/carrier/register.vue';
import carrier_user_profile from '../components/front_end/carrier/profile.vue';
import carrier_reset_pass from '../components/front_end/carrier/reset_pass.vue';


// Business
import business_feed from '../components/front_end/pages/business/feed.vue';
import business_food from '../components/front_end/pages/business/food.vue';
import business_farm from '../components/front_end/pages/business/farm.vue';


export default [
    {
        path: '/',
        component: index,
        name: 'index',
        meta:{
            title: 'Home'
        }
    },
    {
        path: '/contact',
        component: contact,
        name: 'contact',
        meta:{
            title: 'Contacts'
        }
    },

    {
        path: '/news/gallery',
        component: news_gallery,
        name: 'news_gallery',
        meta:{
            title: 'Gallery'
        }
    },
    {
        path: '/news/press',
        component: news_press,
        name: 'news_press',
        meta:{
            title: 'Presses'
        }
    },
    {
        path: '/news/event',
        component: news_event,
        name: 'news_event',
        meta:{
            title: 'Events'
        }
    },

    {
        path: '/about/chairman-message',
        component: about_chairman_message,
        name: 'about_chairman_message',
        meta:{
            title: 'Chairman Message'
        }
    },
    {
        path: '/about/president-message',
        component: about_president_message,
        name: 'about_president_message',
        meta:{
            title: 'President Message'
        }
    },
    {
        path: '/about/vision',
        component: about_vision,
        name: 'about_vision',
        meta:{
            title: 'Visions'
        }
    },
    {
        path: '/about/mission',
        component: about_mission,
        name: 'about_mission',
        meta:{
            title: 'Missions'
        }
    },
    {
        path: '/about/headquarter',
        component: about_headquarter,
        name: 'about_headquarter',
        meta:{
            title: 'Headquarters'
        }
    },
    {
        path: '/about/history',
        component: about_history,
        name: 'about_history',
        meta:{
            title: 'Histories'
        }
    },
    

    {
        path: '/business/feed',
        component: business_feed,
        name: 'business_feed',
        meta:{
            title: 'Business Feed'
        }
    },
    {
        path: '/business/farm',
        component: business_farm,
        name: 'business_farm',
        meta:{
            title: 'Business Farm'
        }
    },
    {
        path: '/business/food',
        component: business_food,
        name: 'business_food',
        meta:{
            title: 'Business food'
        }
    },


    {
        path: '/carrier',
        component: carrier_index,
        name: 'carrier_index',
        meta:{
            title: 'Carrier Index'
        }
    },
    {
        path: '/recruit/dashboard',
        redirect: { name: 'carrier_index' }
    },


    {
        path: '/carrier/login',
        component: carrier_login,
        name: 'carrier_login',
        meta:{
            title: 'Carrier Login'
        }
    },

    {
        path: '/carrier/logout',
        component: carrier_logout,
        name: 'carrier_logout',
        meta:{
            title: 'Carrier Logout'
        }
    },
    {
        path: '/carrier/register',
        component: carrier_register,
        name: 'carrier_register',
        meta:{
            title: 'Carrier Register'
        }
    },


    {
        path: '/carrier/applied',
        component: carrier_applied,
        name: 'carrier_applied',
        meta:{
            title: 'Carrier Applied',
            auth: true
        }
    },

    {
        path: '/carrier/user-profile',
        component: carrier_user_profile,
        name: 'carrier_user_profile',
        meta:{
            title: 'Carrier User Profile',
            auth: true
        }
    },

    {
        path: '/carrier/reset-password',
        component: carrier_reset_pass,
        name: 'carrier_reset_pass',
        meta:{
            title: 'Carrier reset password',
        }
    },





    

    {
        path: '*',
        component: not_found,
        name: 'not_found',
        meta:{
            title: 'Not Found'
        }
    },
]