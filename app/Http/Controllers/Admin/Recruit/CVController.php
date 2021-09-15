<?php

namespace App\Http\Controllers\Admin\Recruit;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\Recruit\RecuitCvSend;

class CVController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = RecuitCvSend::orderBy($sort_field, $sort_direction)
                //->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }


   
    // destroy
    public function destroy($id)
    {
        
        $data       =  RecuitCvSend::find($id);
        $success    =  $data->delete();

        return response()->json('success', 200);
      
    }


    // status
    public function status($id){

        $data       =  RecuitCvSend::find($id);
        if($data){

           $status = $data->status;
           
            if($status == 1){
                $data->status = null;
            }else{
                $data->status = 1;
            }
            $success    =  $data->save();
            return response()->json('success', 200);

        }

    }



}