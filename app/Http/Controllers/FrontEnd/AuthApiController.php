<?php

namespace App\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Hash; 
use App\Models\Auth\AuthApiToken; 

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

            //Auth::login($data);

            // Sanctum Token Generate
            $tokenResponse   = $data->createToken('frontend_user')->plainTextToken;
            $arrToken   = explode("|",$tokenResponse);
            $saved_token = $arrToken[1];
           
            //Save token data in another DB
            $tokenData = new AuthApiToken();
            $tokenData->token_id    = $arrToken[0];
            $tokenData->user_id     = $data->id;
            $tokenData->raw_token   = $tokenResponse;
            $tokenData->saved_token = $saved_token;
            //$success                = $tokenData->save();

            

            return response()->json([ 'result'=>$data, 'auth_token'=>$saved_token ], 200);

        }else{

            return response()->json(['msg'=>'You have entered invalid credentials', 'icon'=>'error'], 203);

        }



    }
}
