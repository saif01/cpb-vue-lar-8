<?php

namespace App\Models\Admin\Recruit;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;

class RecuitUser extends Authenticatable
{
    use HasFactory;

    protected $guarded = [];


    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        return $query
        ->where('jobTitle', 'LIKE', '%'.$val.'%')
        ->Orwhere('publishDate', 'LIKE', '%'.$val.'%')
        ->Orwhere('location', 'LIKE', '%'.$val.'%')
        ->Orwhere('department', 'LIKE', '%'.$val.'%')
        ->Orwhere('education', 'LIKE', '%'.$val.'%')
        ->Orwhere('requirement', 'LIKE', '%'.$val.'%')
        ->Orwhere('experience', 'LIKE', '%'.$val.'%')
        ->Orwhere('salary', 'LIKE', '%'.$val.'%')
        ->Orwhere('details', 'LIKE', '%'.$val.'%')
        ->Orwhere('deadline', 'LIKE', '%'.$val.'%'); 
    }
}
