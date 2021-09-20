<?php

namespace App\Http\Controllers\Admin\Recruit;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\Recruit\RecuitCircular;

class CircularController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = RecuitCircular::orderBy($sort_field, $sort_direction)
                ->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }

    // inactive
    public function inactive(){
        $allData = RecuitCircular::where('status', null)->count();
        return response()->json($allData, 200);
    }


    // store
    public function store(Request $request){

        //dd($request->all(), $request->image);

        //Validate
        $this->validate($request,[
            'jobTitle'      => 'required|string|max:1000|unique:recuit_circulars',
            'publishDate'   => 'required',
            'deadline'      => 'required',
            'location'      => 'required|string|max:300',
            'education'     => 'required|string|max:300',
            'department'    => 'required|string|max:300',
            'details'       => 'required|string|max:100000',
            'requirement'   => 'required|string|max:10000',
            'experience'    => 'required|string|max:10000',
            'salary'        => 'required|string|max:100',
           
        ]);

        $data = new RecuitCircular();

      
        $data->jobTitle     = $request->jobTitle;
        $data->publishDate  = $request->publishDate;
        $data->deadline     = $request->deadline;
        $data->location     = $request->location;
        $data->education    = $request->education;
        $data->department   = $request->department;
        $data->details      = $request->details;
        $data->requirement  = $request->requirement;
        $data->experience   = $request->experience;
        $data->salary       = $request->salary;
        $data->status       = null;
        $data->created_by = request()->user()->id ?? null;
        $success          = $data->save();

        if($success){
            return response()->json(['msg'=>'Stored Successfully &#128513;', 'icon'=>'success'], 200);
        }else{
            return response()->json([
                'msg' => 'Data not save in DB !!'
            ], 422);
        }

    }


    // update
    public function update(Request $request, $id){

        //Validate
        $this->validate($request,[
            'jobTitle'      => 'required|string|max:1000|unique:recuit_circulars,jobTitle,'.$id,
            'publishDate'   => 'required',
            'deadline'      => 'required',
            'location'      => 'required|string|max:300',
            'education'     => 'required|string|max:300',
            'department'    => 'required|string|max:300',
            'details'       => 'required|string|max:100000',
            'requirement'   => 'required|string|max:10000',
            'experience'    => 'required|string|max:10000',
            'salary'        => 'required|string|max:100',
        ]);

        $data = RecuitCircular::find($id);


        $data->jobTitle     = $request->jobTitle;
        $data->publishDate  = $request->publishDate;
        $data->deadline     = $request->deadline;
        $data->location     = $request->location;
        $data->education    = $request->education;
        $data->department   = $request->department;
        $data->details      = $request->details;
        $data->requirement  = $request->requirement;
        $data->experience   = $request->experience;
        $data->salary       = $request->salary;
        $data->status       = null;
        $data->created_by = request()->user()->id ?? null;
        $success          = $data->save();

        if($success){
            return response()->json(['msg'=>'Updated Successfully &#128515;', 'icon'=>'success'], 200);
        }else{
            return response()->json([
                'msg' => 'Data not save in DB !!'
            ], 422);
        }

    }

    // destroy
    public function destroy($id)
    {
        $data       =  RecuitCircular::find($id);

        $success    =  $data->delete();

        return response()->json('success', 200);
      
    }


    // status
    public function status($id){

        $data       =  RecuitCircular::find($id);
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

