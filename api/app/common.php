<?php
// 应用公共文件

//计算订单成本
function calculateOrderCost($customers, $seatPrice){
    if(is_array($customers) && count($customers) > 0){
        $cost = 0;
        foreach($customers as $customer){
            if($customer['type'] == 'Adult'){
                $cost += $seatPrice;
            }else{
                $cost += $seatPrice / 2;
            }
        }
        return $cost;
    }
}

//计算总价
function calculateOrderPrice($customers, $seatPrice){
    if(is_array($customers) && count($customers) > 0){
        $price = 0;
        foreach($customers as $customer){
            if($customer['type'] == 'Adult'){
                $price += $seatPrice + 6;
            }else{
                $price += ($seatPrice / 2) + 6;
            }
        }
        return $price;
    }
}