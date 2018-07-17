<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class governates extends Model
{
    protected $table = "governates";
    protected $fillable =['name_en','name_ar','img'];

    public function contact()
    {
        return $this->belongsTo('App\contacts');
    }

    public function branch()
    {
        return $this->belongsTo('App\branches');
    }



    }
