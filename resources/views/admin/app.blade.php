<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>C.P.B. Admin </title>
        <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('/all-assets/front-end/img/logo/icon/apple-touch-icon.png') }}">
        <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('/all-assets/front-end/img/logo/icon/favicon-32x32.png') }}">
        <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('/all-assets/front-end/img/logo/icon/favicon-16x16.png') }}">
        <link rel="manifest" href="{{ asset('/all-assets/front-end/img/logo/icon/site.webmanifest') }}">

        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
      
    </head>
    <body>
    <div id="app">
        <admin-app></admin-app>
    </div>

    <script src="{{ asset('js/app.js') }}"></script> 
  
    </body>
</html>
