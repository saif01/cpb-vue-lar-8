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
                Route::get('/index', 'UserController@index')->middleware('role:Administrator,Admin-manage');
                Route::post('/store', 'UserController@store')->middleware('role:Administrator,Add');
                Route::put('/update/{id}', 'UserController@update')->middleware('role:Administrator,Edit');
                Route::delete('/destroy/{id}', 'UserController@destroy')->middleware('role:Administrator,Delete');

                Route::get('/roles', 'UserController@roles');
                Route::post('/roles_update', 'UserController@roles_update');
                Route::post('/roles_check', 'UserController@roles_check');
            });

            Route::prefix('admin/role')->group( function(){
                Route::get('/index', 'RoleController@index')->middleware('role:Administrator,Role-manage');
                Route::post('/store', 'RoleController@store')->middleware('role:Administrator,Add');
                Route::put('/update/{id}', 'RoleController@update')->middleware('role:Administrator,Edit');
                Route::delete('/destroy/{id}', 'RoleController@destroy')->middleware('role:Administrator,Delete');
            });

        });

        // News Section
        Route::namespace('News')->group( function(){ 

            Route::prefix('admin/event')->group( function(){
                Route::get('/index', 'EventController@index');
                Route::post('/store', 'EventController@store');
                Route::put('/update/{id}', 'EventController@update');
                Route::delete('/destroy/{id}', 'EventController@destroy');
                Route::post('/status/{id}', 'EventController@status');
            });
        
            Route::prefix('admin/press')->group( function(){
                Route::get('/index', 'PressController@index');
                Route::post('/store', 'PressController@store');
                Route::put('/update/{id}', 'PressController@update');
                Route::delete('/destroy/{id}', 'PressController@destroy');
                Route::post('/status/{id}', 'PressController@status');
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


        // About Section
        Route::namespace('About')->group( function(){ 

            Route::prefix('admin/business_operation')->group( function(){
                Route::get('/index', 'BusinessOperationController@index');
                Route::post('/store', 'BusinessOperationController@store');
                Route::put('/update/{id}', 'BusinessOperationController@update');
                Route::delete('/destroy/{id}', 'BusinessOperationController@destroy');
                Route::post('/status/{id}', 'BusinessOperationController@status');
            });

            Route::prefix('admin/headquarter')->group( function(){
                Route::get('/index', 'HeadquarterController@index');
                Route::post('/store', 'HeadquarterController@store');
                Route::put('/update/{id}', 'HeadquarterController@update');
                Route::delete('/destroy/{id}', 'HeadquarterController@destroy');
                Route::post('/status/{id}', 'HeadquarterController@status');
            });

            Route::prefix('admin/chairman_message')->group( function(){
                Route::get('/index', 'ChairmanMessageController@index');
                Route::post('/store', 'ChairmanMessageController@store');
                Route::put('/update/{id}', 'ChairmanMessageController@update');
                Route::delete('/destroy/{id}', 'ChairmanMessageController@destroy');
                Route::post('/status/{id}', 'ChairmanMessageController@status');
            });

            Route::prefix('admin/president_message')->group( function(){
                Route::get('/index', 'PresidentMessageController@index');
                Route::post('/store', 'PresidentMessageController@store');
                Route::put('/update/{id}', 'PresidentMessageController@update');
                Route::delete('/destroy/{id}', 'PresidentMessageController@destroy');
                Route::post('/status/{id}', 'PresidentMessageController@status');
            });

            Route::prefix('admin/mission')->group( function(){
                Route::get('/index', 'MissionController@index');
                Route::post('/store', 'MissionController@store');
                Route::put('/update/{id}', 'MissionController@update');
                Route::delete('/destroy/{id}', 'MissionController@destroy');
                Route::post('/status/{id}', 'MissionController@status');
            });

            Route::prefix('admin/mission')->group( function(){
                Route::get('/index', 'MissionController@index');
                Route::post('/store', 'MissionController@store');
                Route::put('/update/{id}', 'MissionController@update');
                Route::delete('/destroy/{id}', 'MissionController@destroy');
                Route::post('/status/{id}', 'MissionController@status');
            });

            Route::prefix('admin/vision')->group( function(){
                Route::get('/index', 'VisionController@index');
                Route::post('/store', 'VisionController@store');
                Route::put('/update/{id}', 'VisionController@update');
                Route::delete('/destroy/{id}', 'VisionController@destroy');
                Route::post('/status/{id}', 'VisionController@status');
            });

            Route::prefix('admin/history')->group( function(){
                Route::get('/index', 'HistoryController@index');
                Route::post('/store', 'HistoryController@store');
                Route::put('/update/{id}', 'HistoryController@update');
                Route::delete('/destroy/{id}', 'HistoryController@destroy');
                Route::post('/status/{id}', 'HistoryController@status');
            });


        });


        // Business Section
        Route::namespace('Business')->group( function(){ 

            Route::prefix('admin/feed')->group( function(){
                Route::get('/index', 'FeedController@index');
                Route::post('/store', 'FeedController@store');
                Route::put('/update/{id}', 'FeedController@update');
                Route::delete('/destroy/{id}', 'FeedController@destroy');
                Route::post('/status/{id}', 'FeedController@status');
            });


        });
       

    });

   


});