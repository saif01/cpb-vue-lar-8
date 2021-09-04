<?php

namespace App\Http\Controllers\Admin\Recruit;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\Recruit\RecruitApply;

class ApplicantController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = RecruitApply::orderBy($sort_field, $sort_direction)
                ->with('circular', 'user')
                //->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->search( $search )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }


   
    // destroy
    public function destroy($id)
    {
        $data       =  RecruitApply::find($id);

        $success    =  $data->delete();

        return response()->json('success', 200);
      
    }


    // status
    public function status($id){

        $data       =  RecruitApply::find($id);
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