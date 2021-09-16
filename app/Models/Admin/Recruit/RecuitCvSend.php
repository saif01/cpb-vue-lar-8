<?php

namespace App\Models\Admin\Recruit;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecuitCvSend extends Model
{
    use HasFactory;

    protected $guarded = [];


    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        
    return $query
    ->where('subject', 'LIKE', '%'.$val.'%')
    ->Orwhere('message', 'LIKE', '%'.$val.'%')
    ->Orwhere('created_at', 'LIKE', '%'.$val.'%');
    
    }



}
