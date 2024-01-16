import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frankies_kitchen/model/incomingOrdersModel.dart';
import 'package:frankies_kitchen/model/newIncomingOrderModel.dart';
import 'package:frankies_kitchen/model/orderListModel.dart';
import 'package:frankies_kitchen/model/ordersItems.dart';

import 'baseUrl.dart';
import 'package:http/http.dart' as http;

getOrders(BuildContext context) async {
  // print(' this object here');
  var url = Uri.parse('$baseUrl/api/Transactions/Kitchen');
  var data = await http.get(url, headers: {"Content-Type": "application/json"});
  var jsonData = await json.decode(data.body);
  print(jsonData);
  // print(locationId);
  incomingOrderList.incomingOrderModel!.clear();
  for (var data in jsonData) {
    // for (var order in data["orderItems"]) {
                // print(data['orderItems']['item']['id']);
      // print('Here');
    // if (data['processingTime']==null) {
    // print(data['locationId']);
      // print(data['orderNumber']);
      // print('There');
      // if(int.parse(data['locationId'])!=9){
      //   if (int.parse(data['locationId'])!=10) {
          incomingOrderList.incomingOrderModel?.add(IncomingOrders(
      id: data["id"],
      // tableId: data["tableId"],
      locationId: data['locationId'],
      orderNumber: data['orderNumber'],
      isCompleted: data["isCompleted"]?1:0,
      isPressed: false,
      // allowBillSpliting: data["allowBillSpliting"],
      isDelivered: data["isDelivered"]?1:0,
      orderDate: data["tranDate"],
      // processingTime: data['processingTime'],
      incomingOrderItems: [
          // if (locationId != null)
            for (var orderItems in data["transactionDetails"])
              if ((orderItems["isProcessed"] == false||orderItems["isProcessed"] == null) &&
                  (orderItems["isDelivered"] == false||orderItems["isDelivered"] == null))
                  // orderItems["item"]['category']['kitchenId'])
                  // orderItems["item"]['category']['kitchenId'] == locationId)
                IncomingOrderItems(
                    name: orderItems['productName'],
                    id: orderItems['id'],
                    comment: orderItems['comment'],
                    // isProcessedAt: DateTime.parse(orderItems['isProcessedAt']),
                    // isDeliveredAt: DateTime.parse(orderItems['isDeliveredAt']),
                    // kitchenId: orderItems["item"]['category']['kitchenId'],
                    isActive: orderItems['isActive'],
                    quantity: orderItems['quantity']
                    ),
        ],
    ));
        // } else {
          
        // }
    //   }
    // // print('Added');
    // }
    // }
    // }
    // print(orderlist.incomingOrders);
  }
  (context as Element).markNeedsBuild();

  // return orderlist;
}

//filter incoming orders

// fliterIncomingOrders(int locationId) async {
//   var url = Uri.parse('$baseUrl/api/Orders');
//   var data = await http.get(url, headers: {"Content-Type": "application/json"});
//   var jsonData = await json.decode(data.body);
//   orderlist.incomingOrders?.clear();
//   for (var data in jsonData["data"]) {
//     // for (var order in data["orderItems"]) {
//     orderlist.incomingOrders?.add(IncomingOrders(
//       id: data["id"],
//       tableId: data["tableId"],
//       orderNumber: data['orderNumber'],
//       isCompleted: data["isCompleted"],
//       allowBillSpliting: data["allowBillSpliting"],
//       isDelivered: data[" isDelivered"],
//       orderDate: data["orderDate"],
//       orderItems: [
//         for (var orderItems in data["orderItems"])
//           if (orderItems["isProcessed"] == false &&
//               orderItems["isDelivered"] == false &&
//               orderItems["item"]['category']['kitchenId']==locationId)
//             OrderItems(
//                 name: orderItems['item']['name'],
//                 id: orderItems['item']['id'],
//                 isActive: orderItems['isActive'],
//                 quantity: orderItems['quantity']),
//       ],
//     ));
//   }
// }
