<?php

namespace App\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use GeoIP;
use Jenssegers\Agent\Agent;
use App\Models\Log\VisitorLog;

class IndexController extends Controller
{
    // index
    public function index(){
        return view('front_end.app');
    }


    public function visitor_log(Request $request){

        // get IP Address
        //$clientIP = $_SERVER['REMOTE_ADDR'];
        $clientIP = $my_current_ip=exec("ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'");
        //$clientIP = '202.51.181.142';
        $geoip =  geoip()->getLocation($clientIP);

        $agent = new Agent();
        if( $agent->isDesktop() ){
            $device         = 'Desktop';
        }else{
            $device         = $agent->device();
        }
        
        $browser            = $agent->browser();
        $browser_version    = $agent->version($browser);
        $platform           = $agent->platform();
        $platform_version   = $agent->version($platform);

        $today_date = date('Y-m-d');
        // dd($agent, $device, $browser, $browser_version, $platform, $platform_version);
        $oldData = VisitorLog::where('ip', $clientIP)->orderBy('id', 'desc')->whereDate('created_at', $today_date)->first();
        if($oldData){

            $oldData->count =  $oldData->count + 1;
            $oldData->save();

        }else{

            $data = new VisitorLog();

            $data->ip           =  $geoip->ip;
            $data->iso_code     =  $geoip->iso_code;
            $data->country      =  $geoip->country;
            $data->city         =  $geoip->city;
            $data->state_name   =  $geoip->state_name;
            $data->postal_code  =  $geoip->postal_code;
            $data->lat          =  $geoip->lat;
            $data->lon          =  $geoip->lon;
            $data->timezone     = $geoip->timezone;
            $data->currency     =  $geoip->currency;
    
            $data->device       =  $device;
            $data->browser      =  $browser;
            $data->browser_version =  $browser_version;
            $data->platform     =   $platform;
            $data->platform_version =  $platform_version;
            $data->count        = 1;
            $data->login_id     =  $request->user()->id ?? null;
            $data->save();
            
        }

        return response()->json($clientIP, 200);
    }


}
