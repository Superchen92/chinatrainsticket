<?php
namespace app\controller;

use app\BaseController;
use think\Request;
use app\model\Orders;
use app\model\CustomerInfo;
use app\model\OrderDetails;

class OrdersController extends BaseController{
    public function addOrders(Request $request){
        $requestData = $request->param();
        $db_orders = new Orders();
        $currentNum = $db_orders->getTodayOrdersNum() + 1;
        $order = [
            'order_id' => 'JAS'. date('ymd').sprintf("%03d" ,$currentNum),
            'contact_name' => $requestData['contactName'],
            'contact_email' => $requestData['contactEmail'],
            'contact_tel' => $requestData['contactPhone']
        ];
        //创建订单
        $orderId = $db_orders->addOrders($order);
        
        if($orderId){
            //创建订单详情
            $db_orderDetails = new OrderDetails();
            $orderDetails = [
                'from_city' => $requestData['details']['from'],
                'from_station' => $requestData['details']['fromStation'],
                'to_city' => $requestData['details']['to'],
                'to_station' => $requestData['details']['toStation'],
                'start_date' => $requestData['details']['startDate'],
                'departure_time' => $requestData['details']['depatureTime'],
                'arrival_time' => $requestData['details']['arrivalTime'],
                'cost_time' => str_replace(['h', 'min'], [':',':'], $requestData['details']['costTime']),
                'train_no' => $requestData['details']['trainNo'],
                'total_price' => calculateOrderPrice($requestData['customers'], $requestData['details']['seatPrice']),
                'total_cost' => calculateOrderCost($requestData['customers'], $requestData['details']['seatPrice']),
                'seat' => $requestData['details']['seat'],
                'seat_price' => $requestData['details']['seatPrice'],
                'link_order_id' => $orderId
            ];
            $db_orderDetails->addOrderDetails($orderDetails);

            //创建乘客信息
            $db_customerInfo = new CustomerInfo();
            $customers = [];
            foreach($requestData['customers'] as $customer){
                $item = [
                    'name' => $customer['name'], 
                    'type' => $customer['type'] == 'Adult' ? 1 : 0, 
                    'sex' => $customer['sex'] == 'Male' ? 1 : 0,
                    'country' => $customer['country'], 
                    'birthday' => $customer['birth'],
                    'id_type' => $customer['idType'],
                    'id_number' => $customer['idNumber'],
                    'id_expire_date' => $customer['idExDate'],
                    'link_order_id' => $orderId
                ];
                array_push($customers, $item);
            }
            $db_customerInfo->addCustomers($customers);

            $response = ['status' => 200, 'msg' => 'order send successful!'];
            return json_encode($response);
        }else{
            $response = ['status' => 401, 'msg' => 'order error!'];
            return json($response, 401);
        }
        
    }
}