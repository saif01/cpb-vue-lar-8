<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/athenticated', function () {
    return true;
});

Route::namespace('App\Http\Controllers\FrontEnd')->group( function(){

    Route::get('/auth_test', 'AuthApiController@auth_test');

    //Route::get('/footer', 'VueController@footer')->middleware('auth:sanctum');
    Route::get('/footer', 'VueController@footer');
    Route::get('/business', 'VueController@business');
    Route::get('/business_by_id/{id}', 'VueController@businessById');


    Route::get('/contact', 'VueController@contact');
    Route::post('/contact_msg', 'VueController@contactMsg');

    // News
    Route::prefix('news')->group(function(){
        Route::get('/gallery/index', 'VueController@gallery');
        Route::get('/press/index', 'VueController@press');
        Route::get('/event/index', 'VueController@event')->name('user.event');
    });
   

    // About
    Route::get('/chairman_message', 'VueController@chairman_message');
    Route::get('/president_message', 'VueController@president_message');
    Route::get('/vision', 'VueController@vision');
    Route::get('/mission', 'VueController@mission');
    Route::get('/headquaters', 'VueController@headquaters');
    Route::get('/history', 'VueController@history');

    // Circular
    Route::get('/circular', 'VueController@circular');
    Route::post('/circular_msg', 'VueController@circular_msg');

    // Route::post('/circular_login', 'VueController@circular_login');
    //Route::post('/circular_logout', 'VueController@circular_logout');
    Route::post('/circular_login', 'AuthApiController@login');
    Route::post('/circular_logout', 'AuthApiController@logout');

    Route::post('/circular_job_apply', 'VueController@circular_job_apply');
    Route::post('/circular_register', 'VueController@circular_register');
    Route::post('/circular_job_applied', 'VueController@circular_job_applied')->middleware('auth:sanctum');


});


Route::namespace('App\Http\Controllers\Admin')->group( function(){

    Route::post('/admin_login', 'AdminAuthController@login')->name('login');
    Route::post('/admin_logout', 'AdminAuthController@logout');

    Route::middleware('auth:sanctum')->group( function(){

        // News Section
        Route::namespace('User')->group( function(){ 

            Route::prefix('admin/user')->group( function(){
                Route::get('/index', 'UserController@index');
                Route::post('/store', 'UserController@store');
                Route::put('/update/{id}', 'UserController@update');
                Route::delete('/destroy/{id}', 'UserController@destroy');

                Route::get('/roles', 'UserController@roles');
                Route::post('/roles_update', 'UserController@roles_update');

            });

            Route::prefix('admin/role')->group( function(){
                Route::get('/index', 'RoleController@index');
                Route::post('/store', 'RoleController@store');
                Route::put('/update/{id}', 'RoleController@update');
                Route::delete('/destroy/{id}', 'RoleController@destroy');
            });

        });

        // News Section
        Route::namespace('News')->group( function(){ 

            Route::prefix('admin/event')->group( function(){
                Route::get('/index', 'EventController@index');
                Route::post('/store', 'EventController@store');
                Route::put('/update/{id}', 'EventController@update');
                Route::delete('/destroy/{id}', 'EventController@destroy');
            });
        
            Route::prefix('admin/press')->group( function(){
                Route::get('/index', 'PressController@index');
                Route::post('/store', 'PressController@store');
                Route::put('/update/{id}', 'PressController@update');
                Route::delete('/destroy/{id}', 'PressController@destroy');
            });
    
            Route::prefix('admin/gallery')->group( function(){
                Route::get('/index', 'GalleryController@index');
                Route::get('/all', 'GalleryController@all');
                Route::post('/store', 'GalleryController@store');
                Route::delete('/destroy/{id}', 'GalleryController@destroy');
    
                Route::post('/bulk_store', 'GalleryController@bulk_store');
                Route::delete('/bulk_delete', 'GalleryController@bulk_delete');
            });

        });

       

    });

   


});