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

// Artisan Start
Route::namespace('App\Http\Controllers\Cmd')->prefix('cmd')->group( function () {
        
    Route::get('/', 'ArtisanController@index')->name('cmd.index');
    Route::get('config-cache', 'ArtisanController@config')->name('cmd.config.cache');
    Route::get('optimize', 'ArtisanController@optimize')->name('cmd.config.optimize');
    //Clear Cache facade value:
    Route::get('cache-clear', 'ArtisanController@cacheClear')->name('cmd.cache.clear');
    //Route cache:
    Route::get('route-cache', 'ArtisanController@routeCache')->name('cmd.route.cache');
    //Clear Route cache:
    Route::get('route-clear', 'ArtisanController@routeClear')->name('cmd.route.clear');
    //Clear View cache:
    Route::get('view-clear', 'ArtisanController@viewClear')->name('cmd.view.clear');
    Route::get('clear', 'ArtisanController@clear')->name('cmd.clear');

});
// Artisan End



Route::get('/admin/{any?}', 'App\Http\Controllers\Admin\AdminController@index')->where('any', '.*')->name('admin');

Route::get('{any}', 'App\Http\Controllers\FrontEnd\IndexController@index')->where('any', '.*');






