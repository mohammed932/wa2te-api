<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ads extends Model
{
    protected $table = "ads";
    
    public function governates(){
        return $this->belongsToMany('App\governates', 'ad_governate', 'ad_id','governate_id');
    }

    public function subcats(){
        return $this->belongsToMany('App\sub_categories', 'ad_subcat', 'ad_id','subcat_id');
    }

}
