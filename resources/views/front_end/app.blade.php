<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>C.P. Banglaesh</title>
        <link href="{{ asset('css/app.css') }}" rel="stylesheet">

        {{-- <link href="{{ asset('css/style.css') }}" rel="stylesheet"> --}}

        <link href="{{ asset('all-assets/front-end/vendor/animate.css/animate.min.css') }}" rel="stylesheet">
        <link href="{{ asset('all-assets/front-end/vendor/aos/aos.css') }}" rel="stylesheet">
      
        
        {{-- <link href="https://cdn.jsdelivr.net/npm/animate.css@3.5.1" rel="stylesheet" type="text/css"> --}}
        {{-- <link rel="stylesheet" href="https://unpkg.com/vue2-animate/dist/vue2-animate.min.css"/> --}}
       

        <link href="{{ asset('all-assets/front-end/css/style.css') }}" rel="stylesheet">

        
    </head>
    <body>

    <div id="app" class="h-100">
        <main-app></main-app>
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
