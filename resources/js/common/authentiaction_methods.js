import axios from "axios";

// Vuex File
import store from '../vuex/store';

export default{

    getAuthTokenLocalStorage(){
        let auth_token = localStorage.getItem('auth_token');
        // console.log('getUserLocalStorage called', auth_token);
        if(auth_token){
           
                axios.defaults.headers.common['Authorization'] = 'Bearer ' + auth_token;
                axios.get('/api/athenticated').then(response=>{
                    console.log('getAuthTokenLocalStorage if', response)
                    // Response update in Store
                    store.commit('setAuthToken',  auth_token);

                }).catch (error=>{
                    localStorage.clear();
                    console.log('errrr', error)
                })
                

        }else{
            console.log('getAuthTokenLocalStorage else')
            localStorage.clear();
            return null;
            //store.state.user = null;
        }
        
    },

    getUserLocalStorage(){
        let auth_token = localStorage.getItem('auth_token');
        // console.log('getUserLocalStorage called', auth_token);
        if(auth_token){
           
                axios.defaults.headers.common['Authorization'] = 'Bearer ' + auth_token;
                axios.get('/api/user').then(response=>{
                    console.log('getUserLocalStorage if', response)
                    // Response update in Store
                    store.commit('setUser',  response.data)

                }).catch (error=>{
                    localStorage.clear();
                    console.log('errrr', error)
                })
                

        }else{
            console.log('getUserLocalStorage else')
            localStorage.clear();
            return null;
            //store.state.user = null;
        }
        
    },









    // // Get Localstorage Data
    getLocalStorage(localkey, localStrogeExpHour = 1){

        // Check Localstorage time limit
        let hours = localStrogeExpHour;
        let etl = localStorage.getItem('etl');
        if ( etl && (new Date().getTime() - etl > hours * 60 * 60 * 1000) ) {
            // Clear all localstorage
            localStorage.clear();
        }

        // Get Localstorage data
        let localStorageData = localStorage.getItem(localkey);

        if( localStorageData ){

            if (typeof localStorageData === 'string' || typeof localStorageData === 'boolean'){
                console.log('str data get');
                return localStorageData;
            }
            else{
                console.log('obj data get');
                return JSON.parse(localStorageData)
            }

        }else{
            return null;
        }

    },

    // Set localstorage
    setLocalStorage(localkey, localData){

        // Current Storage Time 
        localStorage.setItem('etl', new Date().getTime());

        if (typeof localData === 'string' || typeof localData === 'boolean'){
            console.log('i am string or bol : ', localData)
            // Store data In local
            localStorage.setItem(localkey, localData);
        }
        else{
            // Obj in local storage
            console.log('i am others : ', localData)
            // Store data In local
            localStorage.setItem(localkey, JSON.stringify(localData));
        }

       
    },


    // Clear All Local Storage
    clearLocalStorage(key = null){
        if(key){
            localStorage.removeItem(key);
        }else{
            localStorage.clear();
        }
        
    },

    // Session Value set
    setSessionStorage(localkey, localData){

        if (typeof localData === 'string' || typeof localData === 'boolean'){
            console.log('i am string or bol : ', localData)
            // Store data In local
            sessionStorage.setItem(localkey, localData);
        }
        else{
            // Obj in local storage
            console.log('i am others : ', localData)
            // Store data In local
            sessionStorage.setItem(localkey, JSON.stringify(localData));
        }

    },

    // Session Value get
    getSessionStorage(localkey){

        // Get SessionStorage data
        let sessionStorageData = sessionStorage.getItem(localkey);

        if( sessionStorageData ){

       
            if (! this.IsJsonString(sessionStorageData) ){
                console.log('str data get');
                return sessionStorageData;
            }
            else{
                console.log('obj data get');
                return JSON.parse(sessionStorageData)
            }

        }else{
            return null;
        }
    },

    // Clear All Session Storage
    clearSessionStorage(key = null){
        if(key){
            sessionStorage.removeItem(key);
        }else{
            sessionStorage.clear();
        }
        
    },

    // Check string or json stringify
    IsJsonString(str) {
        try {
            JSON.parse(str);
        } catch (e) {
            return false;
        }
        return true;
    }
    
}