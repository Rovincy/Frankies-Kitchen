import 'dart:convert';
import 'package:flutter/Material.dart';
import 'package:frankies_kitchen/model/newProcessingOrderModel.dart';
import 'package:frankies_kitchen/model/ordersItems.dart';
import 'package:frankies_kitchen/model/processingOrderList.dart';
import 'package:frankies_kitchen/model/processingOrdersModel.dart';

import 'baseUrl.dart';
import 'package:http/http.dart' as http;

getProcessingOrders(context) async {
// getProcessingOrders(context,locationId) async {
  // print(locationId);
  var url = Uri.parse('$baseUrl/api/Transactions/Kitchen');
  var data = await http.get(url, headers: {"Content-Type": "application/json"});
  var jsonData = await json.decode(data.body);
  processingOrderList.processingOrderModel!.clear();
  for (var data in jsonData) {
  // print(data);
    // print(data['processingTime']);
    if(data['processingTime']!=null&&(data['locationId']!=10||data['locationId']!=9)){
      // print('processing here');
  // print(data['id']);
  // print(data['locationId']);
  // print(data['isCompleted']);
  // print(data['tranDate']);
  // print(data['processingTime']);
  // print(data['orderNumber']);
      processingOrderList.processingOrderModel!.add(ProcessingOrders(
        id: data["id"],
        // isPrinted: data['isPrinted']?1:0,
        locationId: data['locationId'],
        // tableId: data["tableId"],
        isCompleted: data["isCompleted"]?1:0,
        // // allowBillSpliting: data["allowBillSpliting"],
        // isDelivered: data[" isDelivered"]?1:0,
        orderDate: data["tranDate"],
        processingTime: data['processingTime'],
        orderNumber: data["orderNumber"],
        processingOrderItems: [
          // if (locationId != null)
            for (var orderItems in data["transactionDetails"])
              if (orderItems["isProcessed"] == true &&
                  (orderItems["isDelivered"] == false||orderItems["isDelivered"] == null))
                  // orderItems["item"]['category']['kitchenId'])
                  // orderItems["item"]['category']['kitchenId'] == locationId)
                ProcessingOrderItems(
                    name: orderItems['productName'],
                    id: orderItems['id'],
                    comment: orderItems['comment'],
                    // isProcessedAt: DateTime.parse(orderItems['isProcessedAt']),
                    // isDeliveredAt: DateTime.parse(orderItems['isDeliveredAt']),
                    // kitchenId: orderItems["item"]['category']['kitchenId'],
                    isActive: orderItems['isActive'],
                    quantity: orderItems['quantity']),
        ]));
        // print('added');
  // (context as Element).markNeedsBuild();
    }
  }
  (context as Element).markNeedsBuild();
}

//filter incoming orders

// fliterProcessingOrders(int locationId) async {
//   processingorderlist.processingOrders!.clear();
//   var url = Uri.parse('$baseUrl/api/Orders');
//   var data = await http.get(url, headers: {"Content-Type": "application/json"});
//   var jsonData = await json.decode(data.body);
//   // print(jsonData);
//   for (var data in jsonData["data"]) {
//     processingorderlist.processingOrders!.add(ProcessingOrders(
//         id: data["id"],
//         tableId: data["tableId"],
//         isCompleted: data["isCompleted"],
//         allowBillSpliting: data["allowBillSpliting"],
//         isDelivered: data[" isDelivered"],
//         orderDate: data["orderDate"],
//         orderNumber: data["orderNumber"],
//         orderItems: [
//           for (var orderItems in data["orderItems"])
//             if ((orderItems["isProcessed"] == true &&
//                 orderItems["isDelivered"] == false) &&
//                 locationId == 2)
//               OrderItems(
//                   name: orderItems['item']['name'],
//                   id: orderItems['item']['id'],
//                   isActive: orderItems['isActive'],
//                   quantity: orderItems['quantity']),
//         ]));
//   }
// }
