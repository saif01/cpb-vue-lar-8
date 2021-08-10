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


use DB;
use Image;
use File;
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
        $data =  RecuitCircular::where('status', '1')->orderBy('id', 'asc')->get();      
        return response()->json($data, 200);
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




    
}
