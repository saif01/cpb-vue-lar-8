import axios from "axios";
import { mapGetters } from 'vuex'
import paginateMethods from './paginate_methods'
import authenticationMethods from './authentiaction_methods'
import imageMethods from './iamge_methods'


export default {
    data() {
      return {
      
        window: {
            width: 0,
            height: 0
        },

        // DataTbl Common Featurs 
        paginate: 10,
        search: '',
        sort_direction: 'desc',
        sort_field: 'id',
        currentPageNumber: null,
        // Our data object that holds the Laravel paginator data
        allData: {},
        totalValue: '',
        dataShowFrom: '',
        dataShowTo: '',
        editmode: false,
        // Loading Animation
        dataLoading: false,

        imageMaxSize: '2111775',
        fileMaxSize: '5111775',



      }
    },

    methods: {

        // Authentication data save methods
        ...authenticationMethods,

        // Paginate Methods
        ...paginateMethods,

        // Image Upload Methods
        ...imageMethods,


    
        handleResize() {
            this.window.width = window.innerWidth;
            this.window.height = window.innerHeight;
        },


        // Add model show
        newModal() {
            this.editmode = false;
            this.form.reset();
            $('#addNew').modal('show');
        },

        // Edit Model show
        editModal(singleData) {
            this.editmode = true;
            this.form.reset();
            $('#addNew').modal('show');
            this.form.fill(singleData);
        },



        testMethod(){
            return ' Come form common';
        },


       
        
        async callApi(method, url, dataObj) {

            try {

                return await axios({
                    method: method,
                    url: url,
                    data: dataObj
                })

            } catch (e) {
                return e.response
            }

        }

        // End Methods
    },

    watch: {

        //Excuted When make change value 
        paginate: function (value) {
            this.$Progress.start();
            this.getResults();
            this.$Progress.finish();
        },

        //Excuted When make change value 
        search: function (value) {
            this.$Progress.start();
            this.getResults();
            this.$Progress.finish();
        }
       
    },

    created() {
        // window.addEventListener('resize', this.handleResize);
        // this.handleResize();

    },


    mounted() {
 
    },


    destroyed() {
        // window.removeEventListener('resize', this.handleResize);
    },


    computed : {
        // map this.count to store.state.count getLoading 
        ...mapGetters({
            'token'     : 'getAuthToken',
            'adminToken': 'getAdminAuthToken',
            'user'      : 'getUser',
            'adminUser' : 'getAdminUser',
            'loading'   : 'getLoading',
        })
    },



  }