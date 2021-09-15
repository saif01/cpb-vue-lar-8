<?php

namespace App\Http\Controllers\Admin\Business;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\Business\BusinessFood;
use Illuminate\Support\Str;
use Image;
use File;
use App\Http\Controllers\Common\ImageUpload;

class FoodController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = BusinessFood::orderBy($sort_field, $sort_direction)
                ->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }


    // store
    public function store(Request $request){

        //dd($request->all(), $request->image);

        //Validate
        $this->validate($request,[
            'title'      => 'required|string|max:1000|unique:business_food',
            'website'    => 'nullable|string|max:1000',
            'name'       => 'required|string|max:100',
            'details'    => 'required|string|max:40000',
        ]);

        $data = new BusinessFood();

        $imagePath = 'images/business/';
      
        if($request->image){
            $data->image  =  ImageUpload::imgSingleUpload($request->image, $imagePath);
        }
        if($request->image2){
            $data->image2 =  ImageUpload::imgSingleUpload($request->image2, $imagePath);
        }
        if($request->image3){
            $data->image3 =  ImageUpload::imgSingleUpload($request->image3, $imagePath);
        }
        if($request->image4){
            $data->image4 =  ImageUpload::imgSingleUpload($request->image4, $imagePath);
        }
        if($request->image5){
            $data->image5 =  ImageUpload::imgSingleUpload($request->image5, $imagePath);
        }
       

        $data->title      = $request->title;
        $data->website    = $request->website;
        $data->name       = $request->name;
        $data->details    = $request->details;
        $data->status     = null;
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
            'title'      => 'required|string|max:1000|unique:business_food,title,'.$id,
            'website'    => 'nullable|string|max:1000',
            'name'       => 'required|string|max:100',
            'details'    => 'required|string|max:40000',
        ]);

        $data = BusinessFood::find($id);

      

        $imagePath = 'images/business/';

        if($request->image != $data->image){
            $data->image  =  ImageUpload::imgSingleEdit($request->image, $data->image, $imagePath);
        }
        if($request->image2 != $data->image2){
            $data->image2 =  ImageUpload::imgSingleEdit($request->image2, $data->image2, $imagePath);
        }
        if($request->image3 != $data->image3){
            $data->image3 =  ImageUpload::imgSingleEdit($request->image3, $data->image3, $imagePath);
        }
        if($request->image4 != $data->image4){
            $data->image4 =  ImageUpload::imgSingleEdit($request->image4, $data->image4, $imagePath);
        }
        if($request->image5 != $data->image5){
            $data->image5 =  ImageUpload::imgSingleEdit($request->image5, $data->image5, $imagePath);
        }
       

        $data->title      = $request->title;
        $data->website    = $request->website;
        $data->name       = $request->name;
        $data->details    = $request->details;
        $data->status     = null;
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
        $data       =  BusinessFood::find($id);

        $imagePath = 'images/business/';
        if($data->image){
            ImageUpload::imgSingleDelete($data->image, $imagePath);
        }
        if($data->image2){
            ImageUpload::imgSingleDelete($data->image2, $imagePath);
        }
        if($data->image3){
            ImageUpload::imgSingleDelete($data->image3, $imagePath);
        }
        if($data->image4){
            ImageUpload::imgSingleDelete($data->image4, $imagePath);
        }
        if($data->image5){
            ImageUpload::imgSingleDelete($data->image5, $imagePath);
        }

        $success    =  $data->delete();

        return response()->json('success', 200);
      
    }


    // status
    public function status($id){

        $data       =  BusinessFood::find($id);
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
