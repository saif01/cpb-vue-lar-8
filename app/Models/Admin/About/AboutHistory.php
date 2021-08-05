<?php

namespace App\Models\Admin\About;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutHistory extends Model
{
    use HasFactory;

     // add two column append
     public $appends = [
        'year'
    ];

    
    public function getYearAttribute()
    {
        return date("Y", strtotime($this->attributes['date'])) ;
    }


    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        return $query
        ->where('title', 'LIKE', '%'.$val.'%')
        ->Orwhere('date', 'LIKE', '%'.$val.'%')
        ->Orwhere('details', 'LIKE', '%'.$val.'%'); 
    }
}
