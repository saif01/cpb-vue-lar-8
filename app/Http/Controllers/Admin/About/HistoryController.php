<?php

namespace App\Http\Controllers\Admin\About;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\About\AboutHistory;
use Illuminate\Support\Str;
use Image;
use File;

class HistoryController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = AboutHistory::orderBy($sort_field, $sort_direction)
                ->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }


    // store
    public function store(Request $request){

        //dd($request->all(), $request->image);

        //Validate
        $this->validate($request,[
            'title'     => 'required|string|max:1000|unique:about_histories',
            'date'      => 'required|string|max:100',
            'details'   => 'required|string|max:20000',
        ]);

        $data = new AboutHistory();

      
        if($request->image){

            $imagePath = 'images/history/';

            $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            // Original Image Save
            \Image::make($request->image)
            ->save($imagePath.$name);
            // Resized image save
            \Image::make($request->image)
            ->resize(300, 200)
            ->save($imagePath.'small/'.$name);

            $data->image     = $name;
            
        }


        $data->title      = $request->title;
        $data->date       = $request->date;
        $data->details    = $request->details;
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
            'title'     => 'required|string|max:1000|unique:about_histories,title,'.$id,
            'date'      => 'required|string|max:100',
            'details'   => 'required|string|max:20000',
        ]);

        $data = AboutHistory::find($id);

      
        if( $request->image != $data->image ){

            $imagePath = 'images/history/';

            // Delete Image
            $imgDB = $data->image;
            //return $imgDB;
            if(!empty($imgDB)){
                //Delete Old File
                if (file_exists($imagePath . $imgDB)){
                    unlink( $imagePath . $imgDB );
                }
                if (file_exists($imagePath . 'small/' . $imgDB)){
                    unlink( $imagePath . 'small/' . $imgDB );
                }
            }
            

            $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            // Original Image Save
            \Image::make($request->image)
            ->save($imagePath.$name);
            // Resized image save
            \Image::make($request->image)
            ->resize(300, 200)
            ->save($imagePath.'small/'.$name);

            $data->image     = $name;
            
        }



        $data->title      = $request->title;
        $data->date       = $request->date;
        $data->details    = $request->details;
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
        $data       =  AboutHistory::find($id);

        if($data->image){
            $imagePath = 'images/history/';

            // Delete Image
            $imgDB = $data->image;
            //return $imgDB;
            if(!empty($imgDB)){
                //Delete Old File
                if (file_exists($imagePath . $imgDB)){
                    unlink( $imagePath . $imgDB );
                }
                if (file_exists($imagePath . 'small/' . $imgDB)){
                    unlink( $imagePath . 'small/' . $imgDB );
                }
            }
        }

        $success    =  $data->delete();

        return response()->json('success', 200);
      
    }


    // status
    public function status($id){

        $data       =  AboutHistory::find($id);
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
