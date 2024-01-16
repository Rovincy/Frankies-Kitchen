// import 'package:flutter/material.dart';

// import 'ordersItems.dart';

// //incoming Orders mmodel
// class IncomingOrders {
//   int? id;
//   String? orderDate;
//   String? orderNumber;
//   int? tableId;
//   int? locationId;
//   int? isCompleted;
//   int? allowBillSpliting;
//   int? isDelivered;
//   List<OrderItems> orderItems;
//   IncomingOrders(
//       {this.id,
//       this.locationId,
//       this.orderDate,
//       this.orderNumber,
//       this.tableId,
//       this.isCompleted,
//       this.allowBillSpliting,
//       this.isDelivered,
//       required this.orderItems});
//   factory IncomingOrders.fromJson(Map<String, dynamic> json) => IncomingOrders(
//         id: json["id"],
//         locationId: json['locationId'],
//         orderNumber:json['orderNumber'],
//         orderDate: json["orderDate"],
//         tableId: json["tableId"],
//         isCompleted: json["isCompleted"],
//         isDelivered: json["isDelivered"],
//         orderItems: List<OrderItems>.from(
//             json["orderItems"].map((x) => OrderItems.fromJson(x))),
//       );
// }
