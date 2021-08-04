<?php

namespace App\Models\Admin\Business;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BusinessAll extends Model
{
    use HasFactory;

    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        return $query
        ->where('name', 'LIKE', '%'.$val.'%')
        ->Orwhere('title', 'LIKE', '%'.$val.'%')
        ->Orwhere('details', 'LIKE', '%'.$val.'%'); 
    }
}
