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
import about_history from '../components/front_end/pages/about/history.vue';

 
const routes = new VueRouter({
    mode: 'history',

    routes: [

        {
            path: '/',
            component: index,
            name: '/',
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
            name: 'Press',
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


    ]

});


// Run brfore every route request
routes.beforeEach((to, from, next) => {
    //console.log(to, to.meta.title);
    
    let appName = 'C.P.Bangladesh';
    let title = to.meta && to.meta.title ? to.meta.title : '';
    // set current title
    document.title =`${ appName } ${ title }`;

    next();
});




export default routes;