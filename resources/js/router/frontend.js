import index from '../components/front_end/pages/index.vue'
import contact from '../components/front_end/pages/contact.vue'

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

// Circulars
import circular_index from '../components/front_end/circular/index.vue';
import circular_login from '../components/front_end/circular/login.vue';
import circular_logout from '../components/front_end/circular/logout.vue';
import circular_applied from '../components/front_end/circular/applied.vue';
import circular_register from '../components/front_end/circular/register.vue';

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
        path: '/news_gallery',
        component: news_gallery,
        name: 'news_gallery',
        meta:{
            title: 'Gallery'
        }
    },
    {
        path: '/news_press',
        component: news_press,
        name: 'news_press',
        meta:{
            title: 'Presses'
        }
    },
    {
        path: '/news_event',
        component: news_event,
        name: 'news_event',
        meta:{
            title: 'Events'
        }
    },

    {
        path: '/about_chairman_message',
        component: about_chairman_message,
        name: 'about_chairman_message',
        meta:{
            title: 'Chairman Message'
        }
    },
    {
        path: '/about_president_message',
        component: about_president_message,
        name: 'about_president_message',
        meta:{
            title: 'President Message'
        }
    },
    {
        path: '/about_vision',
        component: about_vision,
        name: 'about_vision',
        meta:{
            title: 'Visions'
        }
    },
    {
        path: '/about_mission',
        component: about_mission,
        name: 'about_mission',
        meta:{
            title: 'Missions'
        }
    },
    {
        path: '/about_headquarter',
        component: about_headquarter,
        name: 'about_headquarter',
        meta:{
            title: 'Headquarters'
        }
    },
    {
        path: '/about_history',
        component: about_history,
        name: 'about_history',
        meta:{
            title: 'Histories'
        }
    },
    {
        path: '/business_index',
        component: business_index,
        name: 'business_index',
        props: true,
        meta:{
            title: 'Business Index'
        }
    },

    {
        path: '/business_feed',
        component: business_feed,
        name: 'business_feed',
        meta:{
            title: 'Business Feed'
        }
    },
    {
        path: '/business_farm',
        component: business_farm,
        name: 'business_farm',
        meta:{
            title: 'Business Farm'
        }
    },
    {
        path: '/business_food',
        component: business_food,
        name: 'business_food',
        meta:{
            title: 'Business food'
        }
    },





    {
        path: '/circular_index',
        component: circular_index,
        name: 'circular_index',
        meta:{
            title: 'Circular Index'
        }
    },

    {
        path: '/circular_login',
        component: circular_login,
        name: 'circular_login',
        meta:{
            title: 'Circular Login'
        }
    },

    {
        path: '/circular_logout',
        component: circular_logout,
        name: 'circular_logout',
        meta:{
            title: 'Circular Logout'
        }
    },
    {
        path: '/circular_register',
        component: circular_register,
        name: 'circular_register',
        meta:{
            title: 'Circular Register'
        }
    },


    {
        path: '/circular_applied',
        component: circular_applied,
        name: 'circular_applied',
        meta:{
            title: 'Circular Applied',
            auth: true
        }
    },
]