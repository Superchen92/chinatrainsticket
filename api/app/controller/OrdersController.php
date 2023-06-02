<?php
namespace app\controller;

use app\BaseController;
use think\Request;
use app\model\Orders;

class OrdersController extends BaseController{
    public function addOrders(Request $request){
        $requestData = $request->param();
        $order = [];
        $order['from_city'] = $requestData['from'];
        $order['from_station'] = $requestData['fromStation'];
        $order['to_city'] = $requestData['to'];
        $order['to_station'] = $requestData['toStation'];
        $order['start_date'] = $requestData['startDate'];
        $order['departure_time'] = $requestData['depatureTime'];
        $order['arrival_time'] = $requestData['arrivalTime'];
        $order['cost_time'] = str_replace(['h', 'min'], [':',':'], $requestData['costTime']);
        $order['train_no'] = $requestData['trainNo'];
        $order['total_price'] = $requestData['totalPrice'];

        $db_orders = new Orders();
        $currentNum = $db_orders->getTodayOrdersNum() + 1;
        $order['order_id'] = 'JAS'. date('ymd').sprintf("%03d" ,$currentNum);
        //创建订单
        $orderId = $db_orders->addOrders($order);

        if($orderId){
            //创建
        }
        
        print_r($addedId);
    }
}