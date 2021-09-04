<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use GeoIP;

class AdminController extends Controller
{
    // index
    public function index(){

        // $log =  geoip()->getLocation('202.51.181.142');

        // dd($log);


        return view('admin.app');
    }
}
