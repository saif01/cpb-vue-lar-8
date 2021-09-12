<template>
    <div>
        <div class="row m-2">
            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box gradient-r">
                    <div class="inner">
                        <h3>{{ admins }}</h3>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users-cog"></i>
                    </div>
                    <p class="small-box-footer">Total Admins</p>
                </div>
            </div>
            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box gradient-g">
                    <div class="inner">
                        <h3>{{ users }}</h3>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <p class="small-box-footer">Total Users</p>
                </div>
            </div>
            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box gradient-b">
                    <div class="inner">
                        <h3>{{ circulars }}</h3>
                    </div>
                    <div class="icon">
                        <i class="far fa-newspaper"></i>
                    </div>
                    <p class="small-box-footer">Live Circulars</p>
                </div>
            </div>
           

        </div>

        <b-card no-body class="m-3 p-2" shadow>
            <b-card-text class="text-center h3">
                Monthly visitor's chart
            </b-card-text>
            <BarChart />
        </b-card>


    </div>
</template>
<script>
    import BarChart from './common/chart/BarChart.vue'

    export default {
        name: 'AdminDashboard',
        components: {
            BarChart
        },
        data() {
            return {

                users: 0,
                admins: 0,
                circulars: 0,


            }
        },
        methods: {

            getDashboardData() {
                axios.get('/api/admin/dashoboard')
                    .then(response => {
                        console.log(response.data);
                        this.users = response.data.users;
                        this.admins = response.data.admins;
                        this.circulars = response.data.circulars;

                    })
                    .catch(error => {
                        console.log(error)
                    })
            },

        },
        created() {

            this.getDashboardData();

        },


    }

</script>


<style scoped>
    .small-box {
        border-radius: 0.25rem;
        box-shadow: 0 0 1px rgba(0, 0, 0, 0.125), 0 1px 3px rgba(0, 0, 0, 0.2);
        display: block;
        margin-bottom: 20px;
        position: relative;
    }

    .small-box>.inner {
        padding: 10px;
    }

    .small-box>.small-box-footer {
        background-color: rgba(0, 0, 0, 0.1);
        color: rgba(10, 0, 0, 0.8);
        display: block;
        padding: 3px 0;
        position: relative;
        text-align: center;
        text-decoration: none;
        z-index: 10;
    }

    .small-box>.small-box-footer:hover {
        background-color: rgba(0, 0, 0, 0.15);
        color: #fff;
    }

    .small-box h3 {
        font-size: 2.2rem;
        font-weight: 700;
        margin: 0 0 10px;
        padding: 0;
        white-space: nowrap;
    }

    @media (min-width: 992px) {

        .col-xl-2 .small-box h3,
        .col-lg-2 .small-box h3,
        .col-md-2 .small-box h3 {
            font-size: 1.6rem;
        }

        .col-xl-3 .small-box h3,
        .col-lg-3 .small-box h3,
        .col-md-3 .small-box h3 {
            font-size: 1.6rem;
        }
    }

    @media (min-width: 1200px) {

        .col-xl-2 .small-box h3,
        .col-lg-2 .small-box h3,
        .col-md-2 .small-box h3 {
            font-size: 2.2rem;
        }

        .col-xl-3 .small-box h3,
        .col-lg-3 .small-box h3,
        .col-md-3 .small-box h3 {
            font-size: 2.2rem;
        }
    }

    .small-box p {
        font-size: 1rem;
    }

    .small-box p>small {
        color: #f8f9fa;
        display: block;
        font-size: .9rem;
        margin-top: 5px;
    }

    .small-box h3,
    .small-box p {
        z-index: 5;
    }

    .small-box .icon {
        color: rgba(0, 0, 0, 0.15);
        z-index: 0;
    }

    .small-box .icon>i {
        font-size: 90px;
        position: absolute;
        right: 15px;
        top: 15px;
        transition: -webkit-transform 0.3s linear;
        transition: transform 0.3s linear;
        transition: transform 0.3s linear, -webkit-transform 0.3s linear;
    }

    .small-box .icon>i.fa,
    .small-box .icon>i.fas,
    .small-box .icon>i.far,
    .small-box .icon>i.fab,
    .small-box .icon>i.fal,
    .small-box .icon>i.fad,
    .small-box .icon>i.ion {
        font-size: 70px;
        top: 20px;
    }

    .small-box .icon svg {
        font-size: 70px;
        position: absolute;
        right: 15px;
        top: 15px;
        transition: -webkit-transform 0.3s linear;
        transition: transform 0.3s linear;
        transition: transform 0.3s linear, -webkit-transform 0.3s linear;
    }

    .small-box:hover {
        text-decoration: none;
    }

    .small-box:hover .icon>i,
    .small-box:hover .icon>i.fa,
    .small-box:hover .icon>i.fas,
    .small-box:hover .icon>i.far,
    .small-box:hover .icon>i.fab,
    .small-box:hover .icon>i.fal,
    .small-box:hover .icon>i.fad,
    .small-box:hover .icon>i.ion {
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }

    .small-box:hover .icon>svg {
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }

    @media (max-width: 767.98px) {
        .small-box {
            text-align: center;
        }

        .small-box .icon {
            display: none;
        }

        .small-box p {
            font-size: 12px;
        }
    }

</style>

<style>
    .gradient-r {
        background-image: linear-gradient(to right, rgba(255, 0, 0, 0), rgba(255, 0, 0, 1));
    }

    .gradient-g {
        background-image: linear-gradient(to right, rgba(255, 0, 0, 0), rgb(0, 255, 64));
    }

    .gradient-y {
        background-image: linear-gradient(to right, rgba(255, 0, 0, 0), rgb(238, 255, 0));
    }

    .gradient-b {
        background-image: linear-gradient(to right, rgba(255, 0, 0, 0), rgb(0, 4, 255));
    }

    .gradient-bl {
        background-image: linear-gradient(to right, rgba(255, 0, 0, 0), rgb(5, 5, 5));
    }

</style>
