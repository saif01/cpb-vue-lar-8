<?php

namespace App\Models\Admin\Recruit;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecruitApply extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function circular(){
        return $this->belongsTo('App\Models\Admin\Recruit\RecuitCircular', 'recuit_circular_id', 'id');
    }

    public function user(){
        return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }


    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        return $query
        //->whereDate('created_at', 'LIKE', '%'.$val.'%')
        ->WhereHas('user', function ($query) use($val){
            $query->where('name', 'LIKE', '%' . $val . '%' );
        })
        ->orWhereHas('circular', function ($query) use($val){
            $query->where('jobTitle', 'LIKE', '%' . $val . '%' );
        });
    
       
    }

    

    
}
