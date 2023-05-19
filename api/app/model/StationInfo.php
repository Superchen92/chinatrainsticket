<?php
namespace app\model;

use think\Model;

class StationInfo extends Model{
    public function selectAll(){
        $all = StationInfo::select();
        return $all->toArray();
    }

    public function changeNametoNameEng($name){
        $find = StationInfo::where('name', $name)->find();
        return $find->toArray();
    }

    public function addStation($name, $nameEng, $code){
        $create = StationInfo::create([
            'name' => $name,
            'name_eng' => $nameEng,
            'code' => $code
        ]);
        return $create;
    }
}