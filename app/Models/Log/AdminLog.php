<?php

namespace App\Models\Log;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminLog extends Model
{
    use HasFactory;

    protected $guarded=[];

    public function user(){
        return $this->belongsTo('App\Models\User', 'login_id', 'id');
    }


    //For Dynamic Search 
    public function scopeSearch($query, $val='')
    {
        return $query
        ->where('ip', 'LIKE', '%'.$val.'%')
        ->Orwhere('device', 'LIKE', '%'.$val.'%')
        ->Orwhere('browser', 'LIKE', '%'.$val.'%')
        ->Orwhere('platform', 'LIKE', '%'.$val.'%')
        ->Orwhere('count', 'LIKE', '%'.$val.'%')
        ->Orwhere('created_at', 'LIKE', '%'.$val.'%')
        ->WhereHas('user', function ($query) use($val){
            $query->where('name', 'LIKE', '%' . $val . '%' );
        });
       
    }
}
