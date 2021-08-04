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
}
