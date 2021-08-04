<?php

namespace App\Models\Admin\About;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutHeadquarter extends Model
{
    use HasFactory;

    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        return $query
        ->where('country', 'LIKE', '%'.$val.'%')
        ->Orwhere('company', 'LIKE', '%'.$val.'%')
        ->Orwhere('address', 'LIKE', '%'.$val.'%')
        ->Orwhere('phone', 'LIKE', '%'.$val.'%')
        ->Orwhere('email', 'LIKE', '%'.$val.'%')
        ->Orwhere('website', 'LIKE', '%'.$val.'%'); 
    }
}
