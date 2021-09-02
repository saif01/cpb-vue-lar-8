<?php

namespace App\Http\Controllers\Admin\About;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\About\AboutChairmanMessage;

class ChairmanMessageController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = AboutChairmanMessage::orderBy($sort_field, $sort_direction)
                ->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }


    // store
    public function store(Request $request){

        // dd($request->all(), $request->image);

        //Validate
        $this->validate($request,[
            'title'     => 'required|string|max:1000|unique:about_chairman_messages',
            'details'   => 'required|string|max:40000',
        ]);

        $data = new AboutChairmanMessage();

      
        if($request->image){

            $imagePath = 'images/chairman/';

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




        $data->title      = $request->title;
        $data->details    = $request->details;
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
            'title'     => 'required|string|max:1000|unique:about_chairman_messages,title,'.$id,
            'details'   => 'required|string|max:40000',
        ]);

        $data = AboutChairmanMessage::find($id);

      
        if( $request->image != $data->image ){

            $imagePath = 'images/chairman/';

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
            ->save(public_path($imagePath).$name);
            // Resized image save
            \Image::make($request->image)
            ->resize(300, 200)
            ->save(public_path($imagePath.'small/').$name);

            $data->image     = $name;
            
        }



        $data->title      = $request->title;
        $data->details    = $request->details;
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
        $data       =  AboutChairmanMessage::find($id);

        if($data->image){
            $imagePath = 'images/chairman/';

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

        $data       =  AboutChairmanMessage::find($id);
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

