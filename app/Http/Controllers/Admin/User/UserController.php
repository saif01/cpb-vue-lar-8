<?php

namespace App\Http\Controllers\Admin\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Carbon\Carbon;
use DB;
use App\Models\User;
use App\Models\Auth\Role;

class UserController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = User::orderBy($sort_field, $sort_direction)
                ->where('is_admin', 1)
                ->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }


    // store
    public function store(Request $request){

        //dd($request->all(), $request->image);

        //Validate
        $this->validate($request,[
            'title'     => 'required|string|max:1000|unique:news_events',
            'date'      => 'required|string|max:1000',
            'details'   => 'required|string|max:40000',
            // 'image'     => 'nullable|max:1024', // 1MB Max
            // 'document'  => 'nullable|max:5000', // 1MB Max
        ]);

        $data = new User();

      
        if($request->image){

            $imagePath = 'images/event/';

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
            $upload_path        = 'images/event/';
            $document_url       = $upload_path . $document_full_name;
            $successImg         = $document->move($upload_path, $document_full_name);

            $data->document     = $document_full_name;
        }


        $data->title      = $request->title;
        $data->date       = $request->date;
        $data->details    = $request->details;
        $success          = $data->save();

        if($success){
            return response()->json(['msg'=>'Data Stored Successfully', 'icon'=>'success'], 200);
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
            'title'     => 'required|string|max:1000|unique:news_events,title,'.$id,
            'date'      => 'required|string|max:1000',
            'details'   => 'required|string|max:40000',
            // 'image'     => 'nullable|max:1024', // 1MB Max
            // 'document'  => 'nullable|max:5000', // 1MB Max
        ]);

        $data = User::find($id);

      
        if( $request->image != $data->image ){

            $imagePath = 'images/event/';

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


       $document = $request->file('document');
       // Direct any file store
        if ($document) {
            $document_name      = Str::random(5);
            $ext                = strtolower($document->getClientOriginalExtension());
            $document_full_name = $document_name . '.' . $ext;
            $upload_path        = 'images/event/';
            $document_url       = $upload_path . $document_full_name;
            $successImg         = $document->move($upload_path, $document_full_name);

            $data->document     = $document_full_name;
        }


        $data->title      = $request->title;
        $data->date       = $request->date;
        $data->details    = $request->details;
        $success          = $data->save();

        if($success){
            return response()->json(['msg'=>'Data Updated Successfully', 'icon'=>'success'], 200);
        }else{
            return response()->json([
                'msg' => 'Data not save in DB !!'
            ], 422);
        }

    }

    // destroy
    public function destroy($id)
    {
        $data       =  User::find($id);

        if($data->image){
            $imagePath = 'images/event/';

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



}
