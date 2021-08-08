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

Route::namespace('App\Http\Controllers\FrontEnd')->group( function(){

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

    



});
