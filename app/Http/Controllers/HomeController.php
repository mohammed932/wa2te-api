<?php

namespace App\Http\Controllers;

use App\Advertise;
use App\categories;
use App\contacts;
use App\governates;
use App\Http\Requests\Contact;
use App\settings;
use App\sliders;
use App\sub_categories;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\incorrectdata;
use Illuminate\Support\Arr;

class HomeController extends Controller
{

    //get site setting
    public function getSiteSettings(){

        $settings = settings::orderBy('id', 'desc')->get();

        return response()->json($settings);
    }

    //get all governments

    public function getAllGovernments(){

        $governments = governates::orderBy('id', 'desc')->get();

        return response()->json($governments);
    }

    //get all sliders

    public function getSlidersSubCat(){

        $sliders = sliders::where('contact_id',1)->orderBy('id', 'Asc')->get();

        return response()->json($sliders);
    }


    // get all categories
    public function getAllCategories(){
        $categories = categories::has('subCategories')->get();

        foreach ($categories as $cat){
            $cat->subCategories;
        }

        return response()->json($categories);
    }


    // get subCategories and its contacts
    public function getSubCategory($id){
        $subcat   =  sub_categories::find($id);
        $contacts =  $subcat->contacts()->paginate(2);
        $ads      =  $subcat->ads;
        return response()->json(array('contacts' => $contacts ,'ads'=>$ads));
    }


    // get contact data and its branches
    public function getContact($id){
        // $Subcats = contacts::find($id)->subCategories()->get();
        $contact = contacts::find($id);
        $subcats = $contact->subCategories;
        $arr = array();
        $Related = array();
        foreach ($subcats as $subcat) {
            array_push($arr , $subcat->contacts()->limit(4)->get());
        }
        for ($i=0; $i <count($arr) ; $i++) { 
            for ($j=0; $j <count($arr[$i]) ; $j++) 
               array_push($Related , $arr[$i][$j]);
        }

        // return $randomItems = Arr::random($Related,2);
 
        $single = contacts::where('id',$id)->with(['sliders','workinHours','branches'])->get();
        return response()->json(array('Related' => $Related ,'single'=>$single));

    }


    public function addContact(Contact $request){
        $contact = new Advertise();
        $contact->name = $request->input('fullname');
        $contact->email = $request->input('email');
        $contact->type = $request->input('category');
        $contact->phone = $request->input('phone');
        $contact->desc = $request->input('desc');
        $contact->save();
        $response = array('response'=>'Contact ADDED', 'success'=> true);
        return $response;
    }

    public function addInvalidData(Request $request){
        $incorrectdata = new incorrectdata();
        $incorrectdata->phone = $request->input('phone');
        $incorrectdata->working_hours = $request->input('working_hours');
        $incorrectdata->website = $request->input('website');
        $incorrectdata->address = $request->input('address');
        $incorrectdata->contact_id = $request->input('contact_id');
        $incorrectdata->user_email = $request->input('user_email');
        $incorrectdata->user_phone = $request->input('user_phone');
        $incorrectdata->save();
        $response = array('response'=>'Contact ADDED', 'success'=> true);
        return $response;
    }

    public function getReportContacts(){
        return incorrectdata::with('contact')->get(); 
    }

    public function reportDataFixed($id){
        $incorrectdata = incorrectdata::find($id);
        $incorrectdata->view = 1;
        $incorrectdata->save();
        $response = array('response'=>'Report Contact Added', 'success'=> true);
        return $response;
    }
    
    public function search($keyword,$gov,$cat){
        if($gov == 0){
            return contacts::where('keywords','LIKE','%'.$keyword.'%')->paginate(1);
        }else{
            if($cat==0)
            return contacts::where('keywords','LIKE','%'.$keyword.'%')->where('governate_id',$gov)->paginate(1);
            else
            return contacts::where('keywords','LIKE','%'.$keyword.'%')->where('governate_id',$gov)->where('cat_id',$cat)->paginate(1);
        }
    }
    
    public function filterResults($keyword,$gov,$cat){
    //   return $request;
      if($request->governate && $request->cat){
        return contacts::where('governate_id',$request->governate)->where('cat_id',$request->cat)->paginate(2);
      }else if($request->governate){
        return contacts::where('governate_id',$request->governate)->paginate(2);
      }else if($request->cat){
        return contacts::where('cat_id',$request->cat)->paginate(2);
      }
      
    }

    public function contactTerm(){
        $contacts = contacts::select('keywords')->get();

        $arr = array();
        $i=0;
        foreach ($contacts as $cat){

            $arr[$i] = explode(" ,", $cat->keywords);
            $i++;
        }

        $result = array();

        foreach($arr as $item) {
            $result = array_merge($result, $item);
        }


        return response()->json(array($dd));

    }

    public function allKeywords(){
        return $contacts = contacts::select('keywords')->get();
    }



}
