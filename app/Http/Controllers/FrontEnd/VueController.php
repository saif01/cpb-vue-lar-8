<?php

namespace App\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\Setting\ContactInfo;
use App\Models\Admin\Setting\CustomerQuery;

use App\Models\Admin\News\NewsGallery;
use App\Models\Admin\News\NewsPress;
use App\Models\Admin\News\NewsEvent;

use App\Models\Admin\About\AboutChairmanMessage;
use App\Models\Admin\About\AboutPresidentMessage;
use App\Models\Admin\About\AboutVision;
use App\Models\Admin\About\AboutMission;
use App\Models\Admin\About\AboutHeadquarter;
use App\Models\Admin\About\AboutHistory;

use App\Models\Admin\Business\BusinessAll;
use App\Models\Admin\Recruit\RecuitCircular;
use App\Models\Admin\Recruit\RecuitCvSend;
use App\Models\Admin\Recruit\RecruitApply;

use App\Models\Admin\Business\BusinessFeed;
use App\Models\Admin\Business\BusinessFood;
use App\Models\Admin\Business\BusinessFarm;


use Auth;
use App\Models\User;
use App\Models\Admin\Recruit\RecuitUser;


use DB;
use Image;
use File;
use Session;
use Illuminate\Support\Str;

class VueController extends Controller
{
    //


    //footer
    public function footer(){
        $data = ContactInfo::where('status', '1')->orderBy('id')->first();
        return response()->json($data, 200);
    }

    // business
    public function business(){
        $data = BusinessAll::where('status', '1')->orderBy('name')->get();
        return response()->json($data, 200);
    }

    // businessById
    public function businessById($id){

        $data = BusinessAll::where('status', '1')->where('id', $id)->first();
        return response()->json($data, 200);
    }


    // feed
    public function feed(){
        $data = BusinessFeed::where('status', 1)->orderBy('id', 'desc')->first();
        return response()->json($data, 200);
    }

    // food
    public function food(){
        $data = BusinessFood::where('status', 1)->orderBy('id', 'desc')->first();
        return response()->json($data, 200);
    }

    // farm
    public function farm(){
        $data = BusinessFarm::where('status', 1)->orderBy('id', 'desc')->first();
        return response()->json($data, 200);
    }



    //contact
    public function contact(){
       
        $data = ContactInfo::where('status', 1)->first();       
        return response()->json($data, 200);
    }

    // contactMsg
    public function contactMsg(Request $request){
         //Validate
         $this->validate($request, [
            'name'     => 'nullable|string|max:100',
            'email'    => 'nullable|string|max:100',
            'subject'  => 'nullable|string|max:1000',
            'message'  => 'required|string|max:20000',
        ]);

        $data = new CustomerQuery();

        $data->name     = $request->name;
        $data->email    = $request->email;
        $data->subject  = $request->subject;
        $data->message  = $request->message;
        $success        = $data->save();


        if($success){
            return response()->json(['msg'=>'Message Send successfully', 'icon'=>'success'], 200);
        }else{
            return response()->json([
               'msg' => 'Data not save in DB !!'
           ], 422);
        }

    }

    // gallery
    public function gallery(Request $request){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = NewsGallery::orderBy($sort_field, $sort_direction)
                //->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                //->select('image')
                // ->addSelect(DB::raw("'fakeValue' as fakeColumn"))
                ->paginate($paginate);

        return response()->json($allData, 200);

    }

    // press
    public function press(Request $request){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = NewsPress::orderBy($sort_field, $sort_direction)
                ->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }

    // event
    public function event(Request $request){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = NewsEvent::orderBy($sort_field, $sort_direction)
                ->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }


    // chairman_message
    public function chairman_message(){ 
        $data = AboutChairmanMessage::where('status', 1)->first();       
        return response()->json($data, 200);
    }

    // president_message
    public function president_message(){ 
        $data = AboutPresidentMessage::where('status', 1)->first();       
        return response()->json($data, 200);
    }

    // vision
    public function vision(){ 
       // $data = AboutVision::where('status', '1')->orderBy('id', 'desc')->get();    
        $data = AboutVision::where('status', 1)->orderBy('id', 'desc')->first();         
        return response()->json($data, 200);
    }

    // mission
    public function mission(){ 
       $data =  AboutMission::where('status', '1')->orderBy('id', 'desc')->select('details')->get();      
        return response()->json($data, 200);
    }

    // headquaters
    public function headquaters(){ 
        $data =  AboutHeadquarter::where('status', '1')->orderBy('id', 'asc')->get();      
        return response()->json($data, 200);
    }


    //history
    public function history(){ 
        $data =  AboutHistory::where('status', '1')->orderBy('id', 'asc')->get();      
        return response()->json($data, 200);
    }


    //circular
    public function circular(){ 

        $now = date('Y-m-d');
        $data= RecuitCircular::with('user_apply')
            ->where('status', '1')
            //->where('publishDate', '<=', $now)
            //->where('deadline', '>=', $now)
            ->orderBy('publishDate')
            ->get();

        //dd($data);
        // $data =  RecuitCircular::where('status', '1')->orderBy('id', 'asc')->get();      
        return response()->json($data, 200);
    }


    //circular_apply
    public function circular_job_apply(Request $request){

        //dd( $request->circularId, $request->user);


        $circularId = $request->circularId;
        //$user       = (object) $request->user;

        // Current User
        $user =  $request->user();

       
        //dd($user->is_admin);

        // Check login or not
        

        if($user){

            // Check admin or user
            if($user->is_admin == 1){
                return response()->json(['msg'=>'Please Login as User', 'icon'=>'error'], 200);
            }

            $data = new RecruitApply();

            $data->user_id              = $user->id;
            $data->recuit_circular_id   = $circularId;
            $success                    = $data->save();

            
            if($success){
                return response()->json(['msg'=>'Apply Successfully &#128512', 'icon'=>'success'], 200);
            }else{
                return response()->json(['msg' => 'Data not save in DB !!'], 422);
            }

        }else{
            //Tostar alert
            return response()->json(['msg'=>'Sonthing going wrong', 'icon'=>'error'], 200);
        }
 

    }


    //circular_msg
    public function circular_msg(Request $request){ 

        $this->validate($request,[
            'subject'   => 'nullable|string|max:100',
            'message'   => 'nullable|string|max:10000',
            'document'  => 'required',
        ]);

      

        $data = new RecuitCvSend();


        $document = $request->file('document');
        // Direct any file store
        if ($document) {
            $document_name      = Str::random(5);
            $ext                = strtolower($document->getClientOriginalExtension());
            $document_full_name = $document_name . '.' . $ext;
            $upload_path        = 'images/recruit/';
            $document_url       = $upload_path . $document_full_name;
            $successImg         = $document->move($upload_path, $document_full_name);

            $data->document     = $document_full_name;
        }

        
        $data->subject  = $request->subject;
        $data->message  = $request->message;
        $success        = $data->save();

        if($success){
            return response()->json(['msg'=>'CV Send successfully', 'icon'=>'success'], 200);
        }else{
            return response()->json([
               'msg' => 'Data not save in DB !!'
           ], 422);
        }
       
    }


    // circular_login
    public function circular_login(Request $request){

        $this->validate($request,[
            'email'     => 'required|max:100',
            'password'  => 'required|max:64'
        ]);

      

        $email = $request->email;
        $pass = $request->password;

        $data = User::where('email', $email )
                    ->orWhere('contact', $email)
                    ->where('password', $pass)
                    ->first();

        //dd($data, $email, $pass);

        if($data){

            Auth::login($data);

            $authData = Auth::user();

            return response()->json($authData, 200);

        }else{

            return response()->json(['msg'=>'You have entered invalid credentials', 'icon'=>'error'], 203);

        }



    }


    // circular_logout
    public function circular_logout(){
        Session::flush();
        Auth::logout();
        return response()->json(['msg'=>'Logout successfully', 'icon'=>'success'], 200);
    }


    // circular_job_applied
    public function circular_job_applied(Request $request){ 

       
        // Current User
        $user_data =  $request->user();

        $user_id = $user_data->id;

        $data =  RecruitApply::with('circular', 'user')
                    ->where('user_id', $user_id)
                    ->orderBy('created_at')
                    ->get();

        return response()->json($data, 200);
    }



    // circular_register
    public function circular_register(Request $request){

          //Validate
          $this->validate($request,[
            'name'     => 'required|string|max:100',
            'email'    => 'nullable|string|max:100',
            'contact'  => 'required|string|max:1000',
            'password' => 'required|string|same:conformPassword',
            'image'    => 'nullable',
            'document' => 'nullable',
        ]);

        $data = new User();


        if($request->image){

            $imagePath = 'images/admin/';

            $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            // Original Image Save
            \Image::make($request->image)
            ->save(public_path($imagePath).$name);
            // Resized image save
            \Image::make($request->image)
            ->resize(300, 200)
            ->save(public_path($imagePath.'small/').$name);

            $data->image     = $name;
           
        }


        $document = $request->file('document');
        // Direct any file store
        if ($document) {
            $document_name      = Str::random(5);
            $ext                = strtolower($document->getClientOriginalExtension());
            $document_full_name = $document_name . '.' . $ext;
            $upload_path        = 'images/recruit/';
            $document_url       = $upload_path . $document_full_name;
            $successImg         = $document->move($upload_path, $document_full_name);

            $data->document     = $document_full_name;
        }


        $data->name      = $request->name;
        $data->email     = $request->email;
        $data->contact   = $request->contact;
        $data->password  = $request->password;
        $success         = $data->save();

        if($success){
            return response()->json(['msg'=>'Register successfully', 'icon'=>'success'], 200);
        }else{
            return response()->json([
               'msg' => 'Data not save in DB !!'
           ], 422);
        }

    }






    
}
