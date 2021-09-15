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
                ->with('roles')
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
            'login'     => 'required|string|max:100|unique:users',
            'name'      => 'required|string|max:100',
            'email'     => 'nullable|string|email|max:255',
            'password'  => 'required|string|same:conformPassword',
            'image'     => 'required',
        ]);

        $data = new User();

      
        if($request->image){

            $imagePath = 'images/admin/';

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


        $data->login    = $request->login;
        $data->name     = $request->name;
        $data->email    = $request->email;
        $data->is_admin = 1;
        $data->password = $request->password;
        $success        = $data->save();

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
            'login'     => 'required|string|max:100|unique:users,login,'.$id,
            'name'      => 'required|string|max:100',
            'email'     => 'nullable|string|email|max:255',
            'password'  => 'nullable|string|same:conformPassword',
            'image'     => 'nullable',
        ]);

        $data = User::find($id);

      
        if( $request->image != $data->image ){

            $imagePath = 'images/admin/';

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
            //->save(public_path($imagePath).$name);
            // Resized image save
            \Image::make($request->image)
            ->resize(300, 200)
            ->save($imagePath.'small/'.$name);

            $data->image     = $name;
            
        }


        $data->login    = $request->login;
        $data->name     = $request->name;
        $data->email    = $request->email;
        $data->is_admin = 1;
        if($request->password){
            $data->password = $request->password;
        }
        $success        = $data->save();

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
        $data       =  User::find($id);

        if($data->image){
            $imagePath = 'images/admin/';

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


     // roles
     public function roles(){
        $allData = Role::orderBy('name')->get();
        return response()->json($allData, 200);
    }


    // roles_update
    public function roles_update(Request $request ){

        $id = $request->currentRoleId;

        if($id){
            $user = User::find($id);
            //Update Role in Roles table
            $success = $user->roles()->sync($request->roles);

            if($success){
                return response()->json(['msg'=>'Stored Successfully &#128513;', 'icon'=>'success'], 200);
            }else{
                return response()->json([
                    'msg' => 'Data not save in DB !!'
                ], 422);
            }

        }else{
            return response()->json([
                'msg' => 'User id not found!!'
            ], 422);
        }

        
    }


    // roles_check
    public function roles_check(Request $request){

        $roleData = $request->role;

       $data =  $request->user()->hasRole($roleData);

       return response()->json($data, 200);

       
    }



}
