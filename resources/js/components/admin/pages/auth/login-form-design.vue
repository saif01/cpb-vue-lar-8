<template>
    <div class="login-page">
        <div class="login-box">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    <a href="../../index2.html" class="h1"><b>Admin</b>LTE</a>
                </div>
                <div class="card-body">
                    <p class="login-box-msg">Sign in to start your session</p>

                    <form action="../../index3.html" method="post">

                        <b-input-group prepend="Login" class="mb-4">
                            
                                <b-form-input type="text" ></b-form-input>
                                <b-input-group-append is-text>
                                    <i class="far fa-id-badge"></i>
                                </b-input-group-append>

                        </b-input-group>
                        

                        <b-input-group prepend="Pass." class="mb-4">
                            <b-form-input type="password" ></b-form-input>
                            <b-input-group-append is-text>
                                <i class="fas fa-key"></i>
                            </b-input-group-append>
                        </b-input-group>

                       

                        <b-input-group>
                            <b-button type="submit" class="btn-block" variant="outline-primary">Button <i class="fas fa-sign-in-alt"></i></b-button>
                        </b-input-group>

                     
                    </form>

                  
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>

    </div>
</template>

<style scoped>
    .login-logo,
    .register-logo {
        font-size: 2.1rem;
        font-weight: 300;
        margin-bottom: .9rem;
        text-align: center;
    }

    .login-logo a,
    .register-logo a {
        color: #495057;
    }

    .login-page,
    .register-page {
        -webkit-align-items: center;
        -ms-flex-align: center;
        align-items: center;
        background-color: #e9ecef;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
        height: 100vh;
        -webkit-justify-content: center;
        -ms-flex-pack: center;
        justify-content: center;
    }

    .login-box,
    .register-box {
        width: 360px;
    }

    @media (max-width: 576px) {

        .login-box,
        .register-box {
            margin-top: .5rem;
            width: 90%;
        }
    }

    .login-box .card,
    .register-box .card {
        margin-bottom: 0;
    }

    .login-card-body,
    .register-card-body {
        background-color: #fff;
        border-top: 0;
        color: #666;
        padding: 20px;
    }

    .login-card-body .input-group .form-control,
    .register-card-body .input-group .form-control {
        border-right: 0;
    }

    .login-card-body .input-group .form-control:focus,
    .register-card-body .input-group .form-control:focus {
        box-shadow: none;
    }

    .login-card-body .input-group .form-control:focus~.input-group-prepend .input-group-text,
    .login-card-body .input-group .form-control:focus~.input-group-append .input-group-text,
    .register-card-body .input-group .form-control:focus~.input-group-prepend .input-group-text,
    .register-card-body .input-group .form-control:focus~.input-group-append .input-group-text {
        border-color: #80bdff;
    }

    .login-card-body .input-group .form-control.is-valid:focus,
    .register-card-body .input-group .form-control.is-valid:focus {
        box-shadow: none;
    }

    .login-card-body .input-group .form-control.is-valid~.input-group-prepend .input-group-text,
    .login-card-body .input-group .form-control.is-valid~.input-group-append .input-group-text,
    .register-card-body .input-group .form-control.is-valid~.input-group-prepend .input-group-text,
    .register-card-body .input-group .form-control.is-valid~.input-group-append .input-group-text {
        border-color: #28a745;
    }

    .login-card-body .input-group .form-control.is-invalid:focus,
    .register-card-body .input-group .form-control.is-invalid:focus {
        box-shadow: none;
    }

    .login-card-body .input-group .form-control.is-invalid~.input-group-append .input-group-text,
    .register-card-body .input-group .form-control.is-invalid~.input-group-append .input-group-text {
        border-color: #dc3545;
    }

    .login-card-body .input-group .input-group-text,
    .register-card-body .input-group .input-group-text {
        background-color: transparent;
        border-bottom-right-radius: 0.25rem;
        border-left: 0;
        border-top-right-radius: 0.25rem;
        color: #777;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .login-box-msg,
    .register-box-msg {
        margin: 0;
        padding: 0 20px 20px;
        text-align: center;
    }

    .social-auth-links {
        margin: 10px 0;
    }

    .dark-mode .login-card-body,
    .dark-mode .register-card-body {
        background-color: #343a40;
        border-color: #6c757d;
        color: #fff;
    }

    .dark-mode .login-logo a,
    .dark-mode .register-logo a {
        color: #fff;
    }

</style>
