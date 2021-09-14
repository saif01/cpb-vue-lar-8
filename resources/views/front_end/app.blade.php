<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>C.P. Banglaesh</title>
        <meta name="description" content="C.P. Bangladesh Co.Ltd is a sister concern of C.P Group Founded in 1999. C.P Bangladesh Co.Ltd is doing business in the Agricultural industry">
        <meta name="keywords" content="Agricultural, Food, Feed, Farm">
        <meta name="author" content="Md.Syful Islam">
         <meta name="author" content="Md.Syful Islam, syful.cse.bd@gmail.com">
        <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('/all-assets/front-end/img/logo/icon/apple-touch-icon.png') }}">
        <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('/all-assets/front-end/img/logo/icon/favicon-32x32.png') }}">
        <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('/all-assets/front-end/img/logo/icon/favicon-16x16.png') }}">
        <link rel="manifest" href="{{ asset('/all-assets/front-end/img/logo/icon/site.webmanifest') }}">

        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
        <link href="{{ asset('all-assets/front-end/vendor/animate.css/animate.min.css') }}" rel="stylesheet">
        <link href="{{ asset('all-assets/front-end/vendor/aos/aos.css') }}" rel="stylesheet">
        <link href="{{ asset('all-assets/front-end/css/style.css') }}" rel="stylesheet">
        {{-- <link href="{{ asset('css/style.css') }}" rel="stylesheet"> --}}
    </head>
    <body>
    <div id="app" class="h-100">
        <frontend-app></frontend-app>
    </div>


    <script src="{{ asset('js/app.js') }}"></script> 
    <script src="{{ asset('all-assets/front-end/vendor/aos/aos.js') }}"></script>

    <script>
         AOS.init({
            offset: 200,
            duration: 1000,
            easing: 'ease-in-sine',
            once: true
        });
    </script>
       
    </body>
</html>
