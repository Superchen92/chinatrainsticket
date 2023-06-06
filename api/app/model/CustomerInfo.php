<?php
namespace app\model;
use think\Model;

class CustomerInfo extends Model
{
    protected $createTime = 'create_at';
    public function addCustomers($data){
        $customers = CustomerInfo::saveAll($data);
    }
}
