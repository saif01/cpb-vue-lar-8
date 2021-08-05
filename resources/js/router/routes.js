import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

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

 
const routes = new VueRouter({
    mode: 'history',
    routes: [

        {
            path: '/',
            component: index,
            name: '/'
        },
        {
            path: '/contact',
            component: contact,
            name: 'contact'
        },

        {
            path: '/news_gallery',
            component: news_gallery,
            name: 'news_gallery'
        },
        {
            path: '/news_press',
            component: news_press,
            name: 'news_press'
        },
        {
            path: '/news_event',
            component: news_event,
            name: 'news_event'
        },

        {
            path: '/about_chairman_message',
            component: about_chairman_message,
            name: 'about_chairman_message'
        },
        {
            path: '/about_president_message',
            component: about_president_message,
            name: 'about_president_message'
        },
        {
            path: '/about_vision',
            component: about_vision,
            name: 'about_vision'
        },
        {
            path: '/about_mission',
            component: about_mission,
            name: 'about_mission'
        },
        {
            path: '/about_headquarter',
            component: about_headquarter,
            name: 'about_headquarter'
        },


    ]

});


export default routes;