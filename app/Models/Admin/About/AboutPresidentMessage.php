<?php

namespace App\Models\Admin\About;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutPresidentMessage extends Model
{
    use HasFactory;

    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        return $query
        ->where('title', 'LIKE', '%'.$val.'%')
        ->Orwhere('details', 'LIKE', '%'.$val.'%'); 
    }
}
