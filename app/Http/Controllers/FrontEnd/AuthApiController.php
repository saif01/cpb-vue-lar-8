<?php

namespace App\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Hash; 
use App\Models\Auth\AuthApiToken;
use Illuminate\Support\Facades\Auth;

use DB;

class AuthApiController extends Controller
{
    //

    // login
    public function login(Request $request){

        $this->validate($request,[
            'email'     => 'required|max:100',
            'password'  => 'required|max:64'
        ]);

      

        $email = $request->email;
        $pass  = $request->password;

        $data = User::where('email', $email )
                    ->orWhere('contact', $email)
                    ->where('password', $pass)
                    ->first();

        //dd($data, $email, $pass);

        if($data){

            if($data->is_admin == 1){
                return response()->json(['msg'=>'You have no user access', 'icon'=>'error'], 203);
            }

            // Auth::login($data);
            //$userDetails = Auth::user();

            // Sanctum Token Generate
            $tokenResponse   = $data->createToken('frontend_user')->plainTextToken;
            $arrToken   = explode("|",$tokenResponse);
            $saved_token = $arrToken[1];
        
            //Save token data in another DB
            // $tokenData = new AuthApiToken();
            // $tokenData->token_id    = $arrToken[0];
            // $tokenData->user_id     = $data->id;
            // $tokenData->raw_token   = $tokenResponse;
            // $tokenData->saved_token = $saved_token;
            //$success                = $tokenData->save();

            return response()->json([ 'result'=> $data, 'auth_token'=>$saved_token ], 200);

           
        }else{

            return response()->json(['msg'=>'You have entered invalid credentials', 'icon'=>'error'], 203);

        }



    }


    //logout
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

    


    // auth_test
    public function auth_test(Request $request){

        if( Auth::check() ){
            return 'user Authenticated';
        }else{
            return 'user  UnAuthenticated'; 
        }
    }



}
