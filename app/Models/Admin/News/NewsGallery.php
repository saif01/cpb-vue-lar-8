<?php

namespace App\Models\Admin\News;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NewsGallery extends Model
{
    use HasFactory;

    protected $fillable = [
        'image'
    ];

    // add two column append
    public $appends = [
        'src', 'thumb'
    ];

    
    public function getSrcAttribute()
    {
        return 'images/gallery/'. $this->attributes['image'];
    }

    public function getThumbAttribute()
    {
        return 'images/gallery/small/'. $this->attributes['image'];
    }
}
