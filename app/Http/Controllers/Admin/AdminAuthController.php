<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Hash; 
use App\Models\Auth\AuthApiToken;
use Illuminate\Support\Facades\Auth;
use DB;
 
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

        $data = User::where('login', $email )
                    //->orWhere('contact', $email)
                    ->where('password', $pass)
                    ->where('is_admin', 1)
                    ->first();

        //dd($data, $email, $pass);

        if($data){

            Auth::login($data);

            $userDetails = Auth::user();

            // Sanctum Token Generate
            $tokenResponse   = $data->createToken('admin_user')->plainTextToken;
            $arrToken   = explode("|",$tokenResponse);
            $saved_token = $arrToken[1];
           
            //Save token data in another DB
            // $tokenData = new AuthApiToken();
            // $tokenData->token_id    = $arrToken[0];
            // $tokenData->user_id     = $data->id;
            // $tokenData->raw_token   = $tokenResponse;
            // $tokenData->saved_token = $saved_token;
            //$success                = $tokenData->save();



            

            return response()->json([ 'result'=> $userDetails, 'auth_token'=>$saved_token ], 200);

        }else{

            return response()->json(['msg'=>'You have entered invalid credentials', 'icon'=>'error'], 203);

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
