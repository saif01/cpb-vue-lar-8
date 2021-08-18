<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('app');
// });



// Route::get('/', 'App\Http\Controllers\FrontEnd\IndexController@index');
// Route::get('{slug}', 'App\Http\Controllers\FrontEnd\IndexController@index');

Route::get('/admin/{any?}', 'App\Http\Controllers\Admin\AdminController@index')->where('any', '.*')->name('admin');

Route::get('{any}', 'App\Http\Controllers\FrontEnd\IndexController@index')->where('any', '.*');



