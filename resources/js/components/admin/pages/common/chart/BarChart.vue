



<script>
    import {
        Bar
    } from "vue-chartjs";
    import axios from 'axios';

    export default {
        extends: Bar,
        data() {
            return {
               
                // labels: [
                //     "January",
                //     "February",
                //     "March",
                //     "April",
                //     "May",
                //     "June",
                //     "July",
                //     "August",
                //     "September",
                //     "October",
                //     "November",
                //     "December"
                // ],

                // data: [40, 20, 12, 39, 10, 40, 39, 80, 40, 20, 12, 11],

                gradient: null,
                level_date: null,
                total_hit: null,
                chartLoadingSt: true,

            };
        },

        methods: {

            getDirectData() {
                axios.get('/api/admin/chart_data')
                    .then(response => {
                        // console.log(response.data.allData)
                        this.level_date = response.data.level_date;
                        this.total_hit = response.data.total_hit;
                        this.chartLoadingSt = false
                        // Call Chart
                        this.barChart()

                        //console.log(this.total_hit)
                        //console.log(this.level_date)

                    })
                    .catch(error => {
                        console.log(error)
                    })
            },

            async getAsyncData() {
                try {
                    const response = await axios.get('/api/admin/chart_data');
                    //console.log(response);
                    this.level_date = response.data.level_date;
                    this.total_hit = response.data.total_hit;

                    this.barChart()

                    console.log(this.total_hit)
                    console.log(this.level_date)
                } catch (error) {
                    console.error(error);
                }
            },




            barChart() {
                this.gradient = this.$refs.canvas
                    .getContext("2d")
                    .createLinearGradient(0, 0, 0, 650);

                // this.gradient.addColorStop(0, "rgba(255, 0,0, 0.5)");
                // this.gradient.addColorStop(0.5, "rgba(255, 0, 0, 0.25)");
                // this.gradient.addColorStop(1, "rgba(255, 0, 0, 0)");

                this.gradient.addColorStop(0, "rgba(0, 231, 255, 0.9)");
                this.gradient.addColorStop(0.5, "rgba(0, 231, 255, 0.25)");
                this.gradient.addColorStop(1, "rgba(0, 231, 255, 0)");

                this.renderChart({
                    labels: this.level_date,
                    datasets: [{
                        label: "Total Hit",
                        backgroundColor: this.gradient,
                        data: this.total_hit,
                    }]
                }, {
                    responsive: true,
                    maintainAspectRatio: false
                });
            }

        },

        mounted() {
            //    this.barChart()
        },

        created() {

            this.getDirectData();
            //this.getAsyncData();

        },
    };

</script>
