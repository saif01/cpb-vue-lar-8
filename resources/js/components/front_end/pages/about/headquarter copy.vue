<template>
    <div>
    <main id="main">

        <section class="breadcrumbs">
            <div class="container">

                <div class="d-flex justify-content-between align-items-center">
                    <h2>All Headquarters</h2>
                    <ol>
                       <li>
                                <router-link to="/">Home</router-link>
                            </li>
                        <li>About / Headquarters</li>
                    </ol>
                </div>

            </div>
        </section>




        <div class="container">
            <div class="timeline">

               
                <div v-for="(item, index) in allData" :key="index" class="row no-gutters justify-content-end justify-content-md-around align-items-start  timeline-nodes">
                    <div class="col-10 col-md-5 order-3 order-md-1 timeline-content" >
                        <h3 class="text-light" style="background:red">{{ item.country }}</h3>
                        <p v-if="item.company" >{{ item.company }}<br>
                        <a v-if="item.phone" :href="'tel:'+item.phone">Phone: {{ item.phone }}</a><br>
                        <a v-if="item.email" :href="'mailto:'+item.email">Email: {{ item.email }}</a><br>
                        <a v-if="item.website" :href="item.website" target="_blank">Website Link</a><br>
                        <span v-if="item.address">{{ item.address }}</span> <br>
                        </p>
                    </div>
                    <div class="col-2 col-sm-1 px-md-3 order-2 timeline-image text-md-center">
                        <img :src="'all-assets/front-end/img/logo/cpb.png'" alt="CPB" class="img-fluid">
                    </div>
                    <div class="col-10 col-md-5 order-1 order-md-3 py-3 timeline-date">

                    </div>
                </div>

            </div>
        </div>



    </main><!-- End #main -->
</div>
</template>

<script>
    export default {

        data() {
            return {
                allData: {},
            }
        },

        methods: {

            getDirectData() {
                axios.get('/api/headquaters').then(res => {
                    //console.log(res.data)
                    if (res.status == 200) {
                        this.allData = res.data
                    } else {
                        console.log(res.data)
                    }

                    // console.log(this.allData.length)

                })
            },




        },


        mounted() {
            this.$Progress.start();
            this.getDirectData();
            console.log('Mission Component');
            this.$Progress.finish();
        },


    }

</script>

<style scoped>


:root {
	--white: #ffffff;
	--black: #000000;
	--blue:#0288d1;
	--gray:#ebebeb;
	--box-shadow1:0px 0px 18px 2px rgba(10, 55, 90, 0.15);
}
body{
	font-family: 'Roboto', sans-serif;
    font-weight: lighter;
    color: #637280;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
}
:focus{
    outline: 0px solid transparent !important;
}
.timeline {
    padding: 50px 0;
    position: relative;
}
.timeline-nodes {
        padding-bottom: 25px;
        position: relative;
    }
.timeline-nodes:nth-child(even) {
    flex-direction: row-reverse;
}
.timeline h3, .timeline p {
    padding: 5px 15px;
} 
.timeline h3{
    font-weight: lighter;
    background: var(--blue);
}
.timeline p, .timeline time {
    color: var(--blue)
}
.timeline::before {
    content: "";
    display: block;
    position: absolute;
    top: 0;
    left: 50%;
    width: 0;
    border-left: 2px dashed var(--blue);
    height: 100%;
    z-index: 1;
    transform: translateX(-50%);
}
.timeline-content {
    border: 1px solid var(--blue);
    position: relative;
    border-radius: 0 0 10px 10px;
    box-shadow: 0px 3px 25px 0px rgba(10, 55, 90, 0.2)
}
.timeline-nodes:nth-child(odd) h3,
.timeline-nodes:nth-child(odd) p {
    text-align: right;
}
.timeline-nodes:nth-child(odd) .timeline-date {
    text-align: left;
}
 
.timeline-nodes:nth-child(even) .timeline-date {
    text-align: right;
}
.timeline-nodes:nth-child(odd) .timeline-content::after {
    content: "";
    position: absolute;
    top: 5%;
    left: 100%;
    width: 0;
    border-left: 10px solid var(--blue);
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
}
.timeline-nodes:nth-child(even) .timeline-content::after {
    content: "";
    position: absolute;
    top: 5%;
    right: 100%;
    width: 0;
    border-right: 10px solid var(--blue);
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
}
.timeline-image {
    position: relative;
    z-index: 100;
}
.timeline-image::before {
    content: "";
    width: 80px;
    height: 80px;
    border: 2px dashed var(--blue);
    border-radius: 50%;
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    background-color: #fff;
    z-index: 1;
    

}
.timeline-image img {
    position: relative;
    z-index: 100;
}
/*small device style*/

@media (max-width: 767px) {
    .timeline-nodes:nth-child(odd) h3,
    .timeline-nodes:nth-child(odd) p {
    text-align: left
}
.timeline-nodes:nth-child(even) {
    flex-direction: row;
}
    .timeline::before {
    content: "";
    display: block;
    position: absolute;
    top: 0;
    left: 4%;
    width: 0;
    border-left: 2px dashed var(--blue);
    height: 100%;
    z-index: 1;
    transform: translateX(-50%);
}
.timeline h3 {
    font-size: 1.7rem;
}
.timeline p {
    font-size: 14px;
}
.timeline-image {
    position: absolute;
    left: 0%;
    top: 60px;
    /*transform: translateX(-50%;);*/
}
.timeline-nodes:nth-child(odd) .timeline-content::after {
    content: "";
    position: absolute;
    top: 5%;
    left: auto;
    right: 100%;
    width: 0;
    border-left: 0;
    border-right: 10px solid var(--blue);
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
}
.timeline-nodes:nth-child(even) .timeline-content::after {
    content: "";
    position: absolute;
    top: 5%;
    right: 100%;
    width: 0;
    border-right: 10px solid var(--blue);
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
}
.timeline-nodes:nth-child(even) .timeline-date {
    text-align: left;
}
.timeline-image::before {
    width: 65px;
    height: 65px;
}
}

/*extra small device style */
@media (max-width: 575px) {
    .timeline::before {
    content: "";
    display: block;
    position: absolute;
    top: 0;
    left: 3%;
}
.timeline-image {
    position: absolute;
    left: -5%;
    }
.timeline-image::before {
    width: 60px;
    height: 60px;
}
}




</style>
