<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class incorrectdata extends Model
{
    //public $timestamps = false;
    protected $table = "incorrectdata";
    protected $fillable =['view'];

    public function contact(){
        return $this->belongsTo('App\contacts','contact_id');
    }
}
