import axios from "axios"

export default{

    // async checkRole(role){
    //     try{
    //         const response = await axios.post('/api/admin/user/roles_check', {
    //             role: role 
    //         })
    //         console.log(response.data)

    //         return response.data;

    //     }
    //     catch(error){
    //         console.log(error);

    //     }
       
    // },


    checkRole(role){

        if(this.adminRoles){
            //console.log('roleCheck if')
            let result = false;

                this.adminRoles.filter(function (element) {
                
                    //console.log('roleCheck filter', element.name)
                    if(element.name == role){
                        //console.log('Found')
                        result= true ;
                    }

                })

            return result;

        }else{
            console.log('roleCheck else')
            return false;
        }
       
    },



    // Role check str or array
    checkAnyRole(roles=[]){

        if(this.adminRoles){
            //console.log('checkAnyRole if')

            let result = false;

                this.adminRoles.filter(function (element) {

                    // Check comming array or str with current element  true or false
                    let chkRes = _.includes(roles, element.name)
                
                    
                    if(chkRes){
                        //console.log('Found')
                        result= true ;
                    }

                })

            return result;

        }else{
            console.log('roleData Not Found')
            return false;
        }
       
    }

}