<?php

namespace App\Http\Controllers\Admin\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Admin\News\NewsGallery;
use Illuminate\Support\Str;
use Image;
use File;

class GalleryController extends Controller
{
    //index
    public function index(){

        $paginate       = Request('paginate', 10);
        $search         = Request('search', '');
        $sort_direction = Request('sort_direction', 'desc');
        $sort_field     = Request('sort_field', 'id');

        $allData = NewsGallery::orderBy($sort_field, $sort_direction)
                //->search( trim(preg_replace('/\s+/' ,' ', $search)) )
                ->paginate($paginate);

        return response()->json($allData, 200);

    }

    // all
    public function all(){

      
        $allData = NewsGallery::pluck('id');

        return response()->json($allData, 200);

    }


    // bulk_store
    // public function bulk_store(Request $request){

    //     //Validate
    //     // $this->validate($request,[
    //     //     'images.*' => 'required|image|max:5000', // 1MB Max
    //     // ]);

    //    // $data = new NewsGallery();

    //     // Multiple Image Save

    //     dd($request->all());

    //      $images =  $request->file('images');


    //     foreach ($request->file('images') as $image) {

    //         $imagePath = 'images/gallery/';
    //         // $imageName = $image->hashName();

    //         // $document_name      = Str::random(5);
    //         // $ext                = strtolower($image->getClientOriginalExtension());
    //         // $name = $document_name . '.' . $ext;

    //         $name = $image->hashName();

    //         //$name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
    //         // Original Image Save
    //         \Image::make($image)
    //         ->save(public_path($imagePath).$name);
           
    //         //Store Original Image
    //         //$image->storePublicly( 'gallery', 'custom');

    //         // Resized Image Save
    //         Image::make($image)
    //         ->resize(300, 200)
    //         ->save( $imagePath.'small/'.$name );


    //         $data = new NewsGallery();
    //         $data->image      = $name;
    //         $data->status     = 1;
    //         // $data->created_by = Auth::user()->id;
    //         $data->save();

    //     }

    //     return response()->json(['msg'=>'Data Stored Successfully', 'icon'=>'success'], 200);

        
    //     // if($request->image){

    //     //     $imagePath = 'images/press/';

    //     //     $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
    //     //     // Original Image Save
    //     //     \Image::make($request->image)
    //     //     ->save(public_path($imagePath).$name);
    //     //     // Resized image save
    //     //     \Image::make($request->image)
    //     //     ->resize(300, 200)
    //     //     ->save(public_path($imagePath.'small/').$name);

    //     //     $data->image     = $name;
            
    //     // }


      
    //     // $success          = $data->save();

    //     // if($success){
    //     //     return response()->json(['msg'=>'Data Stored Successfully', 'icon'=>'success'], 200);
    //     // }else{
    //     //     return response()->json([
    //     //         'msg' => 'Data not save in DB !!'
    //     //     ], 422);
    //     // }

    // }


    public function bulk_store(Request $request)
    {
        // dd($request->file('file')->getRealPath(), $request->file('file'), $request->all());

    	$imageName = time().'.'.$request->file->getClientOriginalExtension();
        $request->file->move(public_path('images/gallery/'), $imageName);

       // dd(public_path('images/gallery/'). $imageName);
        $full_path = public_path('images/gallery/').$imageName;
        \Image::make($full_path)
        ->resize(300, 200)
        ->save(public_path('images/gallery/small/').$imageName);


        $data = new NewsGallery();
        $data->image      = $imageName;
        $data->status     = 1;
        // $data->created_by = Auth::user()->id;
        $data->save();
         
    	return response()->json(['success'=>'You have successfully upload file.']);
    }


 
    // destroy
    public function destroy($id)
    {
        $data       =  NewsGallery::find($id);

        if($data->image){
            $imagePath = 'images/gallery/';

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


     // bulk_delete
     public function bulk_delete(Request $request){
        //dd($this->selected);

        $selected = $request->selected;

       if($selected){

            foreach ($selected as $delId) {

        
                $data = NewsGallery::find($delId);

                if($data->image){
                    $imagePath = 'images/gallery/';
        
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

              
                $data->delete();

            }
        }

       
        //Tostar alert
        return response()->json('success', 200);
       
    }
    
}
