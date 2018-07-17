<?php
namespace App\Http\Controllers;

use App\branches;
use App\contact_subcategory;
use App\contacts;
use App\Http\Requests\SingleRequest;
use App\sub_categories;
use App\sliders;
use App\worktimes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use File;

class SingleController extends Controller
{

    public function index()
    {
        // $url = Storage::url('contact-slider-15268947651.png');
        // return "<img src='".$url."' />";
        $singls = contacts::orderBy('id', 'desc')->withCount('branches')->get();
        return response()->json($singls);
    }



    public function editSingle($id)
    {
        $single = contacts::where('id',$id)->with(['sliders','branches','subCategories','workTimes'])->get();
        return response()->json($single);
    }

    public function addSingle(SingleRequest $request){
        $single = new contacts();
        $single->title_en = $request->input('title_en');
        $single->cat_id = $request->input('cat_id');
        $single->title_ar = $request->input('title_ar');
        $single->desc_en = $request->input('desc_en');
        $single->desc_ar = $request->input('desc_ar');
        $single->address_en = $request->input('address_en');
        $single->address_ar = $request->input('address_ar');
        $single->phone = $request->input('phone');
        $single->website = $request->input('website');
        $single->governate_id = $request->input('governate_id');
        $single->fb = $request->input('fb');
        $single->twitter = $request->input('twitter');
        $single->linkedin = $request->input('linkedin');
        $single->instagram = $request->input('instagram');
        $single->keywords = $request->input('keywords');
        $single->lat = $request->input('lat');
        $single->lon = $request->input('lon');
        if($request->square_img != ''){
            $png_url = "contact-square-".time().".png";
            $single->square_img = $png_url;
            $path = public_path().'imgs/contacts/' . $png_url;
            Storage::disk('public')->put($png_url, base64_decode($request->square_img));
        }
        if($request->menu_img != ''){
            $png_url = "contact-menu-".time().".png";
            $single->menu_img = $png_url;
            $path = public_path().'imgs/contacts/' . $png_url;
            Storage::disk('public')->put($png_url, base64_decode($request->menu_img));
        }
        if($request->rect_img != ''){
            $png_url = "contact-rect-".time().".png";
            $single->rect_img = $png_url;
            $path = public_path().'imgs/contacts/' . $png_url;
            Storage::disk('public')->put($png_url, base64_decode($request->rect_img));
        }
        $single->save();
        if( count($request->sliders) != 0){
            for ($i=0; $i < count($request->sliders) ; $i++) { 
                $png_url = "contact-slider-".time().$i.".png";
                $slider = new sliders();
                $slider->slider_type = 0; //contact slider
                $slider->img = $png_url;
                $slider->isNew = $request->sliders[$i]['isNew'];
                $slider->contact_id = $single->id;
                $slider->desc_en  = $request->sliders[$i]['desc_en'];
                $slider->desc_ar  = $request->sliders[$i]['desc_ar'];
                $slider->title_en = $request->sliders[$i]['title_en'];
                $slider->title_ar = $request->sliders[$i]['title_ar'];
                $slider->save();
                // $path = public_path().'imgs/contacts/' . $png_url;
                Storage::disk('public')->put($png_url, base64_decode($request->sliders[$i]['img'])); 
            }
        }

        if( count($request->branches) != 0 ){
            for ($i=0; $i < count($request->branches) ; $i++) { 
                $png_url = "contact-branch-".time().$i.".png";
                $branch = new branches();
                $branch->img = $png_url;
                $branch->contact_id = $single->id;
                $branch->desc_en  = $request->branches[$i]['desc_en'];
                $branch->governate_id  = $request->branches[$i]['governate_id'];;
                $branch->address  = 1;
                $branch->phone  = 1;
                $branch->lat  = 1;
                $branch->lng  = 1;
                $branch->desc_ar  = $request->branches[$i]['desc_ar'];
                $branch->title_en = $request->branches[$i]['title_en'];
                $branch->title_ar = $request->branches[$i]['title_ar'];
                $branch->save();
                // $path = public_path().'imgs/contacts/' . $png_url;
                Storage::disk('public')->put($png_url, base64_decode($request->branches[$i]['img'])); 
            }
        }

        $times = new worktimes();
        $times->contact_id = $single->id;
        $times->sat_from = $request->sat['from'];
        $times->sat_to = $request->sat['to'];
        $times->sun_from = $request->sun['from'];
        $times->sun_to = $request->sun['to'];
        $times->mon_from = $request->mon['from'];
        $times->mon_to = $request->mon['to'];
        $times->tue_from = $request->tue['from'];
        $times->tue_to = $request->tue['to'];
        $times->wed_from = $request->wed['from'];
        $times->wed_to = $request->wed['to'];
        $times->thu_from = $request->thu['from'];
        $times->thu_to = $request->thu['to'];
        $times->fri_from = $request->fri['from'];
        $times->fri_to = $request->fri['to'];
        $times->save();
        
        contacts::find($single->id)->subCategories()->attach($request->input('subcat_ids'));
        $response = array('response'=>'single Added Successfully', 'success'=> true);
        return $response;
    }

    public function updateSingle(SingleRequest $request){
   
        $singletId = $request->input('id');
        $single = contacts::find($singletId);
        $single->title_en = $request->input('title_en');
        $single->cat_id = $request->input('cat_id');
        $single->title_ar = $request->input('title_ar');
        $single->desc_en = $request->input('desc_en');
        $single->desc_ar = $request->input('desc_ar');
        $single->address_en = $request->input('address_en');
        $single->address_ar = $request->input('address_ar');
        $single->phone = $request->input('phone');
        $single->website = $request->input('website');
        $single->governate_id = 6;
        $single->fb = $request->input('fb');
        $single->twitter = $request->input('twitter');
        $single->keywords = $request->input('keywords');
        $single->lat = $request->input('lat');
        $single->lon = $request->input('lon');
        $single->gif_status = $request->input('gif_status');
        if (base64_decode($request->square_img, true)) {
            if($request->square_img != ''){
                $png_url = "contact-square-".time().".png";
                $single->square_img = $png_url;
                $path = public_path().'imgs/contacts/' . $png_url;
                Storage::disk('public')->put($png_url, base64_decode($request->square_img));
            }
        }

        if (base64_decode($request->gif_img, true)) {
            if($request->gif_img != ''){
                $png_url = "contact-gif-".time().".png";
                $single->gif_img = $png_url;
                $path = public_path().'imgs/contacts/' . $png_url;
                Storage::disk('public')->put($png_url, base64_decode($request->gif_img));
            }
        }

        if (base64_decode($request->rect_img, true)) {
            $png_url = "contact-rect-".time().".png";
            $single->rect_img = $png_url;
            $path = public_path().'imgs/contacts/' . $png_url;
            Storage::disk('public')->put($png_url, base64_decode($request->rect_img));
        }

        $single->save();


        if( count($request->sliders) != 0 ){
            for ($i=0; $i < count($request->sliders) ; $i++) { 
                //  if new image uploaded.
                if (base64_decode($request->sliders[$i]['img'], true) && $request->sliders[$i]['isNew']){
                    $slider = new sliders();
                    $png_url = "contact-slider-".time().$i.".png";
                    $slider->img = $png_url;
                    Storage::disk('public')->put($png_url, base64_decode($request->sliders[$i]['img'])); 
                }else if(base64_decode($request->sliders[$i]['img'], true) && !$request->sliders[$i]['isNew']){
                    $slider = sliders::find($request->sliders[$i]['id']);
                    $png_url = "contact-slider-".time().$i.".png";
                    $slider->img = $png_url;
                    Storage::disk('public')->put($png_url, base64_decode($request->sliders[$i]['img'])); 
                }else{
                    $slider = sliders::find($request->sliders[$i]['id']);
                }

                $slider->slider_type = 0; //contact slider
                $slider->contact_id =  $singletId;
                $slider->desc_en  = $request->sliders[$i]['desc_en'];
                $slider->desc_ar  = $request->sliders[$i]['desc_ar'];
                $slider->title_en = $request->sliders[$i]['title_en'];
                $slider->title_ar = $request->sliders[$i]['title_ar'];
                $slider->save();
                
            }
        }

        if( count($request->branches) != 0 ){
            for ($i=0; $i < count($request->branches) ; $i++) { 
                // the case where new barnch addes
                if (base64_decode($request->branches[$i]['img'], true) && $request->branches[$i]['isNew']){
                    $branch = new branches();
                    $png_url = "contact-branch-".time().$i.".png";
                    $branch->img = $png_url;
                    Storage::disk('public')->put($png_url, base64_decode($request->branches[$i]['img'])); 
                    // the case where just upload new image for existing branch
                }else if(base64_decode($request->branches[$i]['img'], true) && !$request->branches[$i]['isNew']){
                    $branch = branches::find($request->branches[$i]['id']);
                    $png_url = "contact-branch-".time().$i.".png";
                    $branch->img = $png_url;
                    Storage::disk('public')->put($png_url, base64_decode($request->branches[$i]['img'])); 
                }else{
                    $branch = branches::find($request->branches[$i]['id']);
                }
                   
                $branch->contact_id = $singletId;
                $branch->desc_en  = $request->branches[$i]['desc_en'];
                $branch->governate_id  = $request->branches[$i]['governate_id'];;
                $branch->address  = 1;
                $branch->phone  = 1;
                $branch->lat  = 1;
                $branch->lng  = 1;
                $branch->desc_ar  = $request->branches[$i]['desc_ar'];
                $branch->title_en = $request->branches[$i]['title_en'];
                $branch->title_ar = $request->branches[$i]['title_ar'];
                $branch->save();
            }
        }

        $workingHour = $request->work_times[0];
        $time = worktimes::find($workingHour['id']);
        $time->sat_from = $workingHour['sat_from'];
        $time->sat_to   = $workingHour['sat_to'];
        $time->sun_from = $workingHour['sun_from'] ;
        $time->sun_to   = $workingHour['sun_to'];
        $time->mon_from = $workingHour['sun_to'];
        $time->mon_to   = $workingHour['mon_to'];
        $time->tue_from = $workingHour['tue_from'];
        $time->tue_to   = $workingHour['tue_to'] ;
        $time->wed_from = $workingHour['wed_from'];
        $time->wed_to   = $workingHour['wed_to'];
        $time->thu_from = $workingHour['thu_from'];
        $time->thu_to   = $workingHour['thu_to'];
        $time->fri_from = $workingHour['fri_from'];
        $time->fri_to   = $workingHour['fri_to'];
        $time->save();


        contacts::find($singletId)->subCategories()->sync($request->input('subcat_ids'));
        $response = array('response'=>'contact Updated!', 'success'=>true);
        return $response;
    }


    public function destroy($id){
        $contacts = contacts::find($id);
        $path = 'public/storage/' . $contacts->square_img;
        if(File::exists($path)) {
            return "sdf";
            File::delete($path);
        }
        // return unlink('https://localhost/wateApi/public/storage/' . $contacts->square_img);
        // $contacts->delete();
        // return $response = array('response'=>'contact deleted!', 'success'=>true);
    }
    public function countSingles(){
       $countSingles = contacts::count();
        return response()->json($countSingles);
    }
}
