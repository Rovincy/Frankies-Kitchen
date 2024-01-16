// import 'package:flutter/material.dart';

// import 'ordersItems.dart';

// //incoming Orders mmodel
// class ProcessingOrders {
//   int? id;
//   int? locationId;
//   int? isPrinted;
//   String? orderDate;
//   String? processingTime;
//   String? orderNumber;
//   int? tableId;
//   int? isCompleted;
//   int? allowBillSpliting;
//   int? isDelivered;
//   List<OrderItems> orderItems;
//   ProcessingOrders(
//       {this.id,
//       this.isPrinted,
//       this.locationId,
//       this.orderDate,
//       this.processingTime,
//       this.tableId,
//       this.isCompleted,
//       this.orderNumber,
//       this.allowBillSpliting,
//       this.isDelivered,
//       required this.orderItems});
//   factory ProcessingOrders.fromJson(Map<String, dynamic> json) =>
//       ProcessingOrders(
//         id: json["id"],
//         // isPrinted: json['isPrinted'],
//         locationId: json['locationId'],
//         orderDate: json["orderDate"],
//         processingTime: json['processingTime'],
//         tableId: json["tableId"],
//         orderNumber: json["orderNumber"],
//         isCompleted: json["isCompleted"],
//         isDelivered: json["isDelivered"],
//         orderItems: List<OrderItems>.from(
//             json["orderItems"].map((x) => OrderItems.fromJson(x))),
//       );
// }
