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
    Route::get('/gallery', 'VueController@gallery');
    Route::get('/press', 'VueController@press');
    Route::get('/event', 'VueController@event');

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
    Route::post('/circular_logout', 'VueController@circular_logout');
    Route::post('/login', 'AuthApiController@login');
    Route::post('/logout', 'AuthApiController@logout')->middleware('auth:sanctum');

    Route::post('/circular_job_apply', 'VueController@circular_job_apply');
    Route::post('/circular_register', 'VueController@circular_register');
    Route::post('/circular_job_applied', 'VueController@circular_job_applied')->middleware('auth:sanctum');


});


Route::namespace('App\Http\Controllers\Admin')->group( function(){

    Route::post('/admin_login', 'AdminAuthController@login');
    Route::post('/admin_logout', 'AdminAuthController@logout');

    Route::namespace('News')->prefix('admin/news')->group( function(){

        Route::get('/index', 'EventController@index');
        Route::get('/store', 'EventController@store');

    });


});