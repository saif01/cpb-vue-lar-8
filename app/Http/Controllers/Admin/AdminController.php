<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use GeoIP;

use App\Models\Log\VisitorLog;
use Carbon\Carbon;
use DB;

use App\Models\User;
use App\Models\Admin\Recruit\RecuitCircular;

use App\Models\Admin\News\NewsPress;
use App\Models\Admin\News\NewsEvent;

use App\Models\Admin\About\AboutBusinessOperation;
use App\Models\Admin\About\AboutChairmanMessage;
use App\Models\Admin\About\AboutHeadquarter;
use App\Models\Admin\About\AboutHistory;
use App\Models\Admin\About\AboutMission;
use App\Models\Admin\About\AboutPresidentMessage;
use App\Models\Admin\About\AboutVision;

use App\Models\Admin\Business\BusinessFarm;
use App\Models\Admin\Business\BusinessFeed;
use App\Models\Admin\Business\BusinessFood;


class AdminController extends Controller
{
    // index
    public function index(){

        // $log =  geoip()->getLocation('202.51.181.142');

        // dd($log);


        return view('admin.app');
    }


    public function chart_data(){

        $allData = VisitorLog::where('created_at', '>=', Carbon::now()->subMonths(12))
            ->select("*")
            ->selectRaw("count(id) as `total_id` , YEAR(created_at) as `year`, MONTH(created_at) as `month`")
            ->selectRaw("SUM(count) as `total_hit`")
            ->groupBy('year')
            ->groupBy('month')
            ->get();

        $level_date = [];
        $total_hit = [];

        foreach($allData as $item){
            $level_date[] .= date('F-Y', strtotime($item->created_at));
            $total_hit[] .= $item->total_hit;
        }

        return response()->json(['total_hit'=>$total_hit, 'level_date'=>$level_date, 'allData'=>$allData ], 200);
    }

    public function dashoboard(){

        $users = User::where('is_admin', null)->count(); 
        $admins = User::where('is_admin', 1)->count(); 

        $now = date('Y-m-d');
        $circulars= RecuitCircular::where('status', '1')
            ->where('publishDate', '<=', $now)
            ->where('deadline', '>=', $now)
            ->orderBy('publishDate')
            ->count();

        return response()->json(['users'=>$users, 'admins'=>$admins, 'circulars'=>$circulars],200);

    }


    // inactive_list
    public function inactive_list(){

        $NewsEvent          = NewsEvent::where('status', null)->count();
        $NewsPress          = NewsPress::where('status', null)->count();
        $RecuitCircular     = RecuitCircular::where('status', null)->count();

        $TotalNewsSection = $NewsEvent + $NewsPress + $RecuitCircular;

        $AboutBusinessOperation     = AboutBusinessOperation::where('status', null)->count();
        $AboutChairmanMessage       = AboutChairmanMessage::where('status', null)->count();
        $AboutHeadquarter           = AboutHeadquarter::where('status', null)->count();
        $AboutHistory               = AboutHistory::where('status', null)->count();
        $AboutMission               = AboutMission::where('status', null)->count();
        $AboutPresidentMessage      = AboutPresidentMessage::where('status', null)->count();
        $AboutVision                = AboutVision::where('status', null)->count();
        $TotalAboutSection = $AboutBusinessOperation + $AboutChairmanMessage + $AboutHeadquarter + $AboutHistory + $AboutMission + $AboutPresidentMessage + $AboutVision;


        $BusinessFarm                = BusinessFarm::where('status', null)->count();
        $BusinessFeed                = BusinessFeed::where('status', null)->count();
        $BusinessFood                = BusinessFood::where('status', null)->count();
        $TotalBusinessSection = $BusinessFarm + $BusinessFeed + $BusinessFood;
       


        return response()->json([
            'NewsEvent'         => $NewsEvent, 
            'NewsPress'         => $NewsPress, 
            'TotalNewsSection'  => $TotalNewsSection,

            'RecuitCircular'    => $RecuitCircular,

            'AboutBusinessOperation'    => $AboutBusinessOperation,
            'AboutChairmanMessage'      => $AboutChairmanMessage,
            'AboutHeadquarter'          => $AboutHeadquarter,
            'AboutHistory'              => $AboutHistory,
            'AboutMission'              => $AboutMission,
            'AboutPresidentMessage'     => $AboutPresidentMessage,
            'AboutVision'               => $AboutVision,
            'TotalAboutSection'         => $TotalAboutSection,

            'BusinessFarm'          => $BusinessFarm, 
            'BusinessFeed'          => $BusinessFeed, 
            'BusinessFood'          => $BusinessFood, 
            'TotalBusinessSection'  => $TotalBusinessSection, 

        ],200);

    }




}
