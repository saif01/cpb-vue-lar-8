import axios from "axios";

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

        imageMaxSize: '2111775',
        fileMaxSize: '5111775',



      }
    },

    methods: {
    
      handleResize() {
            this.window.width = window.innerWidth;
            this.window.height = window.innerHeight;
        },

        // Get table data
        getResults(page = 1) {
            axios.get('api/'+this.currentUrl+'?page=' + page +
                    '&paginate=' + this.paginate +
                    '&search=' + this.search +
                    '&sort_direction=' + this.sort_direction +
                    '&sort_field=' + this.sort_field
                )
                .then(response => {
                    //console.log(response.data.data);
                    //console.log(response.data.from, response.data.to);
                    this.allData = response.data;
                    this.totalValue = response.data.total;
                    this.dataShowFrom = response.data.from;
                    this.dataShowTo = response.data.to;
                 
                    // Loading Animation
                    this.dataLoading = false;

                });
        },


        // Upload Image
        upload_image(e) {
            let file = e.target.files[0];
            let reader = new FileReader();

            if (file['size'] < this.imageMaxSize) {
                reader.onloadend = (file) => {
                    //console.log('RESULT', reader.result)
                    this.form.image = reader.result;
                }
                reader.readAsDataURL(file);
            } else {
                alert('File size can not be bigger than 2 MB')
            }
        },


        // File Upload
        onFileChange(e){
            let file = e.target.files[0];

            if(file['size'] < this.fileMaxSize) {
                this.form.document = file;
            }else{
                 alert('File size can not be bigger than 5 MB')
            }
            //console.log(file)
            //console.log(this.form.document)
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


    destroyed() {
        // window.removeEventListener('resize', this.handleResize);
    },


  }