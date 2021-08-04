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

use DB;

class VueController extends Controller
{
    //


    //footer
    public function footer(){

        $data = ContactInfo::where('status', '1')->orderBy('id')->first();

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
        $data = AboutMission::where('status', '1')->orderBy('id', 'desc')->get();          
        return response()->json($data, 200);
    }



    
}
