<?php

namespace App\Http\Controllers\Admin\About;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\About\AboutHeadquarter;

class HeadquarterController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = AboutHeadquarter::orderBy($sort_field, $sort_direction)
                ->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }


    // store
    public function store(Request $request){

        //Validate
        $this->validate($request,[
            'country'     => 'required|string|max:1000',
            'company'     => 'required|string|max:1000',
            'address'     => 'required|string|max:1000',
            'phone'       => 'nullable|string|max:1000',
            'email'       => 'nullable|string|max:1000',
            'website'     => 'nullable|string|max:1000',
        ]);

        $data = new AboutHeadquarter();

        $data->country    = $request->country;
        $data->company    = $request->company;
        $data->address    = $request->address;
        $data->phone      = $request->phone;
        $data->email      = $request->email;
        $data->website    = $request->website;
      
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
            'country'     => 'required|string|max:1000',
            'company'     => 'required|string|max:1000',
            'address'     => 'required|string|max:1000',
            'phone'       => 'nullable|string|max:1000',
            'email'       => 'nullable|string|max:1000',
            'website'     => 'nullable|string|max:1000',
        ]);

        $data = AboutHeadquarter::find($id);

        $data->country    = $request->country;
        $data->company    = $request->company;
        $data->address    = $request->address;
        $data->phone      = $request->phone;
        $data->email      = $request->email;
        $data->website    = $request->website;
      
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
        $data       =  AboutHeadquarter::find($id);
        $success    =  $data->delete();

        return response()->json('success', 200);
      
    }


    // status
    public function status($id){

        $data       =  AboutHeadquarter::find($id);
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
