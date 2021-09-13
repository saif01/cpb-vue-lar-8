<?php

namespace App\Http\Controllers\Common;
use Illuminate\Support\Str;

class ImageUpload{

    // Image Single Edit
    public static function imgSingleUpload($image, $imagePath, $imagePathsm = null){

        $imgPathSm = $imagePathsm ?? $imagePath.'small/';
        $randomStr = Str::random(8);
        $name =$randomStr. time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
       
        // Original Image Save
        \Image::make($image)
        ->save(public_path($imagePath).$name);
        // Resized image save
        \Image::make($image)
        ->resize(300, 200)
        ->save(public_path($imgPathSm).$name);

        return $name;
    }

    // Image Single Edit
    public static function imgSingleEdit($image, $oldImg = null, $imagePath, $imagePathsm = null){

        $imgPathSm = $imagePathsm ?? $imagePath.'small/';


        if(!empty( $oldImg )){
            //Delete Old File
            if (file_exists( $imagePath . $oldImg )){
                unlink( $imagePath . $oldImg );
            }
            if (file_exists( $imgPathSm . $oldImg )){
                unlink( $imgPathSm . $oldImg );
            }
        }
        $randomStr = Str::random(8);
        $name = $randomStr. time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
        // Original Image Save
        \Image::make($image)
        ->save(public_path($imagePath).$name);
        // Resized image save
        \Image::make($image)
        ->resize(300, 200)
        ->save(public_path($imgPathSm).$name); 

        return $name;
    }


    // Image delete
    public static function imgSingleDelete($image, $imagePath, $imagePathsm = null){

        $imgPathSm = $imagePathsm ?? $imagePath.'small/';

        if(!empty( $image )){
            //Delete Old File
            if (file_exists( $imagePath . $image )){
                unlink( $imagePath . $image );
            }
            if (file_exists( $imgPathSm . $image )){
                unlink( $imgPathSm . $image );
            }
        }
    }





}