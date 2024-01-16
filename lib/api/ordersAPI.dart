// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:frankies_kitchen/model/incomingOrdersModel.dart';
// import 'package:frankies_kitchen/model/newIncomingOrderModel.dart';
// import 'package:frankies_kitchen/model/newProcessingOrderModel.dart';
// import 'package:frankies_kitchen/model/orderListModel.dart';
// import 'package:frankies_kitchen/model/ordersItems.dart';

// import 'baseUrl.dart';
// import 'package:http/http.dart' as http;

// getOrders(BuildContext context) async {
//   // print(' this object here');
//   var url = Uri.parse('$baseUrl/api/Transactions/Kitchen');
//   var data = await http.get(url, headers: {"Content-Type": "application/json"});
//   var jsonData = await json.decode(data.body);
//   print(jsonData);
//   // print(locationId);
//   incomingOrderList.incomingOrderModel!.clear();
//   for (var data in jsonData) {
//     print('data["isCompleted"]: ${data["isCompleted"]}');
//     // if(data["isCompleted"]==false){
//           incomingOrderList.incomingOrderModel?.add(IncomingOrders(
//       id: data["id"],
//       // tableId: data["tableId"],
//       locationId: data['locationId'],
//       orderNumber: data['orderNumber'],
//       isCompleted: data["isCompleted"]?1:0,
//       isPressed: false,
//       // allowBillSpliting: data["allowBillSpliting"],
//       isDelivered: data["isDelivered"]?1:0,
//       orderDate: data["tranDate"],
//       // processingTime: data['processingTime'],
//       incomingOrderItems: [
//           // if (locationId != null)
//             for (var orderItems in data["transactionDetails"])
//               if ((orderItems["isProcessed"] == false||orderItems["isProcessed"] == null) &&
//                   (orderItems["isDelivered"] == false||orderItems["isDelivered"] == null))
//                 IncomingOrderItems(
//                     name: orderItems['productName'],
//                     id: orderItems['id'],
//                     comment: orderItems['comment'],
//                     isActive: orderItems['isActive'],
//                     quantity: orderItems['quantity']
//                     ),
//         ],
//     ));
//     // }else{
//       processingOrderList.processingOrderModel!.add(ProcessingOrders(
//         id: data["id"],
//         // isPrinted: data['isPrinted']?1:0,
//         locationId: data['locationId'],
//         // tableId: data["tableId"],
//         isCompleted: data["isCompleted"]?1:0,
//         // // allowBillSpliting: data["allowBillSpliting"],
//         // isDelivered: data[" isDelivered"]?1:0,
//         orderDate: data["tranDate"],
//         processingTime: data['processingTime'],
//         orderNumber: data["orderNumber"],
//         processingOrderItems: [
//           // if (locationId != null)
//             for (var orderItems in data["transactionDetails"])
//               if (orderItems["isProcessed"] == true &&
//                   (orderItems["isDelivered"] == false||orderItems["isDelivered"] == null))
//                   // orderItems["item"]['category']['kitchenId'])
//                   // orderItems["item"]['category']['kitchenId'] == locationId)
//                 ProcessingOrderItems(
//                     name: orderItems['productName'],
//                     id: orderItems['id'],
//                     comment: orderItems['comment'],
//                     // isProcessedAt: DateTime.parse(orderItems['isProcessedAt']),
//                     // isDeliveredAt: DateTime.parse(orderItems['isDeliveredAt']),
//                     // kitchenId: orderItems["item"]['category']['kitchenId'],
//                     isActive: orderItems['isActive'],
//                     quantity: orderItems['quantity']),
//         ]));
//     // }
//   }
//   (context as Element).markNeedsBuild();

//   // return orderlist;
// }
