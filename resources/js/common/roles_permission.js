export default {
    isAdministrator(){
        return this.checkRole('Administrator');
    },

    isViewPermitted(){
        //console.log(this.userPermission)
        return this.checkAnyRole(['Administrator', 'View']);
    },
    isAddPermitted(){
        return this.checkAnyRole(['Administrator', 'Add']);
    },
    isEditPermitted(){
        return this.checkAnyRole(['Administrator', 'Edit']);
    },
    isDeletePermitted(){
        return this.checkAnyRole(['Administrator', 'Delete']);
    },

    
    isAdminManagePermitted(){
        return this.checkAnyRole(['Administrator', 'Admin-manage']);
    },
    isRoleManagePermitted(){
        return this.checkAnyRole(['Administrator', 'Role-manage']);
    },
    isRecruitPermitted(){
        return this.checkAnyRole(['Administrator', 'Recruit']);
    },
    isBusinessPermitted(){
        return this.checkAnyRole(['Administrator', 'Business']);
    },
    isNewsPermitted(){
        return this.checkAnyRole(['Administrator', 'News']);
    },
    isAboutPermitted(){
        return this.checkAnyRole(['Administrator', 'About']);
    }
}