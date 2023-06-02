<?php
namespace app\model;

use think\Model;

class SeatName extends Model{
    public function getaALLSeat(){
        $all = SeatName::field('code')->select();
        return $all->toArray();
    }

    public function getSeatNameEng($code){
        $find = SeatName::where('code', $code)->value('name_eng');
        return $find;
    }
}