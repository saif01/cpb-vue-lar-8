<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Hash; 
use App\Models\Auth\AuthApiToken;
use Illuminate\Support\Facades\Auth;
use DB;

use GeoIP;
use Jenssegers\Agent\Agent;
use App\Models\Log\AdminLog;
 
class AdminAuthController extends Controller
{
    // Login
    public function login(Request $request){

        $this->validate($request,[
            'email'     => 'required|max:100',
            'password'  => 'required|max:64'
        ]);

      

        $email = $request->email;
        $pass  = $request->password;

        $adminData = User::with('roles')
                    ->where('login', $email )
                    //->orWhere('contact', $email)
                    ->where('password', $pass)
                    ->where('is_admin', 1)
                    ->first();

        //dd($data, $email, $pass); 


        


        if($adminData){
            

            // Auth::login($data);
            // $userDetails = Auth::user();

            // Sanctum Token Generate
            $tokenResponse   = $adminData->createToken('admin_user')->plainTextToken;
            $arrToken   = explode("|",$tokenResponse);
            $saved_token = $arrToken[1];
           
            // Save token data in another DB
            // $tokenData = new AuthApiToken();
            // $tokenData->token_id    = $arrToken[0];
            // $tokenData->user_id     = $data->id;
            // $tokenData->raw_token   = $tokenResponse;
            // $tokenData->saved_token = $saved_token;
            // $success                = $tokenData->save();

           
            // Store Success login details
            $this->successAdminLoginLogStore($adminData->id);

            return response()->json([ 'result'=> $adminData, 'auth_token'=>$saved_token ], 200);

        }else{

            // Store failed login details
            $this->faildAdminLoginLogStore($email);

            return response()->json(['msg'=>'You have entered invalid credentials', 'icon'=>'error'], 203);

        }



    }


    public function successAdminLoginLogStore($login_id = null, $satatus = null, $ip = null){


         // get IP Address
        //$clientIP = $_SERVER['REMOTE_ADDR'];
        if($ip){
            $clientIP = $ip;
        }else{
            $clientIP = $this->get_ip_address();
        }
        
        
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
        $oldData = AdminLog::where('login_id', $login_id)->orderBy('id', 'desc')->whereDate('created_at', $today_date)->first();
        if($oldData){
            
            $oldData->device       =  $device;
            $oldData->browser      =  $browser;
            $oldData->browser_version =  $browser_version;
            $oldData->platform     =   $platform;
            $oldData->platform_version =  $platform_version;
            $oldData->count =  $oldData->count + 1;
            $oldData->save();
 
        }else{
 


            $logData = new AdminLog();

            $logData->ip           =  $clientIP;
            $logData->iso_code     =  $geoip->iso_code;
            $logData->country      =  $geoip->country;
            $logData->city         =  $geoip->city;
            $logData->state_name   =  $geoip->state_name;
            $logData->postal_code  =  $geoip->postal_code;
            $logData->lat          =  $geoip->lat;
            $logData->lon          =  $geoip->lon;
            $logData->timezone     =  $geoip->timezone;
            $logData->currency     =  $geoip->currency;

            $logData->device       =  $device;
            $logData->browser      =  $browser;
            $logData->browser_version =  $browser_version;
            $logData->platform     =   $platform;
            $logData->platform_version =  $platform_version;
            $logData->status       = 1;
            $logData->count        = 1;
            $logData->login_id     =  $login_id;
            $logData->save();
        }

    }

    public function faildAdminLoginLogStore($login_id= null){


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


      
        $logData = new AdminLog();

        $logData->ip           =  $clientIP;
        $logData->iso_code     =  $geoip->iso_code;
        $logData->country      =  $geoip->country;
        $logData->city         =  $geoip->city;
        $logData->state_name   =  $geoip->state_name;
        $logData->postal_code  =  $geoip->postal_code;
        $logData->lat          =  $geoip->lat;
        $logData->lon          =  $geoip->lon;
        $logData->timezone     =  $geoip->timezone;
        $logData->currency     =  $geoip->currency;

        $logData->device       =  $device;
        $logData->browser      =  $browser;
        $logData->browser_version =  $browser_version;
        $logData->platform     =   $platform;
        $logData->platform_version =  $platform_version;
        $logData->status       = null;
        $logData->count        = 1;
        $logData->login_id     =  $login_id;
        $logData->save();
    

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


    // Logout
    public function logout(Request $request){

        $tokenable_id = $request->id;

        // Token Was delete From DB
        $success = DB::table('personal_access_tokens')
            ->where('tokenable_id', $tokenable_id)
            ->orderBy('id', 'desc')
            ->take(1)
            ->delete();

        if($success){
            return response()->json(['msg'=>'Apply Successfully &#128512', 'icon'=>'success'], 200);
        }else{
            return response()->json(['msg' => 'Data not save in DB !!'], 422);
        }

    }
}
