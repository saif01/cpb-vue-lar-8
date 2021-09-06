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



}
