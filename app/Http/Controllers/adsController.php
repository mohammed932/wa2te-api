<?php

namespace App\Http\Controllers;

use App\ads;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
class AdsController extends Controller
{

    public function index(){
    }

    public function addAd(Request $request){
        $ad = new ads();
        $ad->title_en = $request->input('title_en');
        $ad->title_ar = $request->input('title_ar');
        $ad->desc_en = $request->input('desc_en');
        $ad->desc_ar = $request->input('desc_ar');
        if($request->img != ''){
            $png_url = "ad-img".time().".png";
            $ad->img = $png_url;
            Storage::disk('public')->put($png_url, base64_decode($request->img));
        }
        $ad->expire_at = $request->input('expire_at');
        $ad->save();
        ads::find($ad->id)->governates()->attach($request->input('governate_ids'));
        ads::find($ad->id)->subcats()->attach($request->input('subcat_ids'));
        $response = array('response'=>'ad Added Successfully', 'success'=> true);
        return $response;
    }


    public function updateAd(Request $request){
      $ad = ads::find($request->input('id'));
      $ad->title_en = $request->input('title_en');
      $ad->title_ar = $request->input('title_ar');
      $ad->desc_en = $request->input('desc_en');
      $ad->desc_ar = $request->input('desc_ar');
      if (base64_decode($request->square_img, true)) {
        if($request->img != ''){
          $png_url = "ad-img".time().".png";
          $ad->img = $png_url;
          Storage::disk('public')->put($png_url, base64_decode($request->img));
        }
      }
      
      $ad->expire_at = $request->input('expire_at');
      $ad->save();
      ads::find($ad->id)->governates()->sync($request->input('governate_ids'));
      ads::find($ad->id)->subcats()->sync($request->input('subcat_ids'));
      $response = array('response'=>'ad Updated Successfully', 'success'=> true);
      return $response;
  }

  public function getAd($id){
    return ads::with(['governates','subcats'])->where('id',$id)->get();
  }

  public function showAds(){
    return ads::all();
  }


  public function addAdsense(Request $request){
    $adsense = new ads();
    $adsense->ad_type = 1;
    $adsense->adsense = $request->adsense;
    $adsense->save();
    $response = array('response'=>'adsense addes Successfully', 'success'=> true);
    return $response;
  }

  public function deleteAd($id){
     ads::find($id)->delete();
     $response = array('response'=>'ad deleted Successfully', 'success'=> true);
     return $response;
  }

}
