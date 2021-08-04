<?php

namespace App\Models\Admin\News;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NewsPress extends Model
{
    use HasFactory;

    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        return $query
        ->where('date', 'LIKE', '%'.$val.'%')
        ->Orwhere('title', 'LIKE', '%'.$val.'%')
        ->Orwhere('details', 'LIKE', '%'.$val.'%'); 
    }
}
