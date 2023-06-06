<?php
namespace app\model;
use think\Model;
class OrderDetails extends Model
{
    protected $createTime = 'create_at';
    public function addOrderDetails($data){
        $details = OrderDetails::create($data);
    }
}
