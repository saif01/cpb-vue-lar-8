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
        $clientIP = $this->get_ip_address();
        
        //$clientIP   = '10.64.5.1';
        //$clientIP   = '202.51.181.142';
        $geoip      =  geoip()->getLocation($clientIP);

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

            $data->ip           =  $clientIP;
            $data->iso_code     =  $geoip->iso_code;
            $data->country      =  $geoip->country;
            $data->city         =  $geoip->city;
            $data->state_name   =  $geoip->state_name;
            $data->postal_code  =  $geoip->postal_code;
            $data->lat          =  $geoip->lat;
            $data->lon          =  $geoip->lon;
            $data->timezone     =  $geoip->timezone;
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


    // Function to get the client ip address
    public function get_ip_address(){
        foreach (array('HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED', 'HTTP_X_CLUSTER_CLIENT_IP', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED', 'REMOTE_ADDR') as $key){
            if (array_key_exists($key, $_SERVER) === true){
                foreach (explode(',', $_SERVER[$key]) as $ip){
                    $ip = trim($ip); // just to be safe
    
                    if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE) !== false){
                        return $ip;
                    }
                }
            }
        }
    }


}
