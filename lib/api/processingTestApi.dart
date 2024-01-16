// import 'dart:convert';
// import 'package:frankies_kitchen/model/ordersItems.dart';
// import 'package:frankies_kitchen/model/processingOrderList.dart';
// import 'package:frankies_kitchen/model/processingOrdersModel.dart';
// import 'package:frankies_kitchen/model/testModel.dart';

// import 'baseUrl.dart';
// import 'package:http/http.dart' as http;

// processingItemsAPI(context, [int? locationId]) async {
//   // processingorderlist.processingOrders!.clear();
//   var url = Uri.parse('$baseUrl/api/Orders');
//   var data = await http.get(url, headers: {"Content-Type": "application/json"});
//   var jsonData = await json.decode(data.body);
//   // print(jsonData);
//   itemList.itemModel!.clear();
//   for (var data in jsonData["data"]) {
//     for (var orderItems in data["orderItems"]) {
//     if (orderItems["isProcessed"] == true &&
//         orderItems["isDelivered"] == false &&
//         orderItems["item"]['category']['kitchenId'] == locationId){
//         itemList.itemModel!.add(ProcessingItems(
//       id: data["id"], 
//       productId: orderItems['item']['id'], 
//       locationId: data['location']['id'], 
//       orderNumber: data["orderNumber"], 
//       quantity: orderItems['quantity'], 
//       isProcessedAt: DateTime.parse(orderItems['isProcessedAt']),
//       isDeliveredAt: DateTime.parse(orderItems['isDeliveredAt']),
//       isActive: orderItems['isActive'], 
//       kitchenId: orderItems["item"]['category']['kitchenId'], 
//       comment: orderItems['comment'], 
//       name: orderItems['item']['name']));}
//     }
//     // processingorderlist.processingOrders!.add(ProcessingOrders(
//     //     id: data["id"],
//     //     locationId: data['location']['id'],
//     //     tableId: data["tableId"],
//     //     isCompleted: data["isCompleted"],
//     //     allowBillSpliting: data["allowBillSpliting"],
//     //     isDelivered: data[" isDelivered"],
//     //     orderDate: data["orderDate"],
//     //     orderNumber: data["orderNumber"],
//     //     orderItems: [
//     //       if (locationId != null)
//     //         for (var orderItems in data["orderItems"])
//     //           if (orderItems["isProcessed"] == true &&
//     //               orderItems["isDelivered"] == false &&
//     //               orderItems["item"]['category']['kitchenId'] == locationId)
//     //             OrderItems(
//     //                 name: orderItems['item']['name'],
//     //                 id: orderItems['item']['id'],
//     //                 comment: orderItems['comment'],
//     //                 isProcessedAt: DateTime.parse(orderItems['isProcessedAt']),
//     //                 isDeliveredAt: DateTime.parse(orderItems['isDeliveredAt']),
//     //                 kitchenId: orderItems["item"]['category']['kitchenId'],
//     //                 isActive: orderItems['isActive'],
//     //                 quantity: orderItems['quantity']),
//     //     ]));
//   }
// }

// //filter incoming orders

// // fliterProcessingOrders(int locationId) async {
// //   processingorderlist.processingOrders!.clear();
// //   var url = Uri.parse('$baseUrl/api/Orders');
// //   var data = await http.get(url, headers: {"Content-Type": "application/json"});
// //   var jsonData = await json.decode(data.body);
// //   // print(jsonData);
// //   for (var data in jsonData["data"]) {
// //     processingorderlist.processingOrders!.add(ProcessingOrders(
// //         id: data["id"],
// //         tableId: data["tableId"],
// //         isCompleted: data["isCompleted"],
// //         allowBillSpliting: data["allowBillSpliting"],
// //         isDelivered: data[" isDelivered"],
// //         orderDate: data["orderDate"],
// //         orderNumber: data["orderNumber"],
// //         orderItems: [
// //           for (var orderItems in data["orderItems"])
// //             if ((orderItems["isProcessed"] == true &&
// //                 orderItems["isDelivered"] == false) &&
// //                 locationId == 2)
// //               OrderItems(
// //                   name: orderItems['item']['name'],
// //                   id: orderItems['item']['id'],
// //                   isActive: orderItems['isActive'],
// //                   quantity: orderItems['quantity']),
// //         ]));
// //   }
// // }
