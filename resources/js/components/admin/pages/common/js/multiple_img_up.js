export default {


    // Upload Image 2
    upload_image2(e) {
        let file = e.target.files[0];
        let reader = new FileReader();

        if (file['size'] < this.imageMaxSize) {
            reader.onloadend = (file) => {
                //console.log('RESULT', reader.result)
                this.form.image2 = reader.result;
            }
            reader.readAsDataURL(file);
        } else {
            alert('File size can not be bigger than 2 MB')
        }
    },

    //For getting Instant Uploaded Photo2
    get_image2() {

        if (this.form.image2) {
            let photo = (this.form.image2.length > 100) ? this.form.image2 : this.imagePathSm + this.form.image2;
            return photo;
        }
        return null;
    },

    // Upload Image 3
    upload_image3(e) {
        let file = e.target.files[0];
        let reader = new FileReader();

        if (file['size'] < this.imageMaxSize) {
            reader.onloadend = (file) => {
                //console.log('RESULT', reader.result)
                this.form.image3 = reader.result;
            }
            reader.readAsDataURL(file);
        } else {
            alert('File size can not be bigger than 2 MB')
        }
    },

    //For getting Instant Uploaded Photo3
    get_image3() {

        if (this.form.image3) {
            let photo = (this.form.image3.length > 100) ? this.form.image3 : this.imagePathSm + this.form.image3;
            return photo;
        }
        return null;
    },


    // Upload Image 4
    upload_image4(e) {
        let file = e.target.files[0];
        let reader = new FileReader();

        if (file['size'] < this.imageMaxSize) {
            reader.onloadend = (file) => {
                //console.log('RESULT', reader.result)
                this.form.image4 = reader.result;
            }
            reader.readAsDataURL(file);
        } else {
            alert('File size can not be bigger than 2 MB')
        }
    },

    //For getting Instant Uploaded Photo 4
    get_image4() {

        if (this.form.image4) {
            let photo = (this.form.image4.length > 100) ? this.form.image4 : this.imagePathSm + this.form.image4;
            return photo;
        }
        return null;
    },

    // Upload Image 5
    upload_image5(e) {
        let file = e.target.files[0];
        let reader = new FileReader();

        if (file['size'] < this.imageMaxSize) {
            reader.onloadend = (file) => {
                //console.log('RESULT', reader.result)
                this.form.image5 = reader.result;
            }
            reader.readAsDataURL(file);
        } else {
            alert('File size can not be bigger than 2 MB')
        }
    },

    //For getting Instant Uploaded Photo
    get_image5() {

        if (this.form.image5) {
            let photo = (this.form.image5.length > 100) ? this.form.image5 : this.imagePathSm + this.form.image5;
            return photo;
        }
        return null;
    },



}
