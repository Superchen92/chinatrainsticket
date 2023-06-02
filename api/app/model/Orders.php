<?php
namespace app\model;

use think\Model;

class Orders extends Model{
    protected $createTime = 'create_at';
    public function addOrders($data){
        $orders = Orders::create($data);
        return $orders->order_id;
    }

    public function getTodayOrdersNum(){
        $todayStart = date('Y-m-d 00:00:00');
        $todayEnd = date('Y-m-d 23:59:59');
        $num = Orders::where('create_at','between',[$todayStart,$todayEnd])->select();
        return count($num);
    }
}
