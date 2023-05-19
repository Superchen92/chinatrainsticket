<?php
namespace app\model;

use think\Model;

class Config extends Model{
    public function getExchangeRate($country){
        $find = Config::where('name', $country)->value('value');
        return $find;
    }
}