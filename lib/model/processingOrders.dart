// import 'package:flutter/material.dart';
// import 'Item.dart';

// class ProcessingOrders{
//   int? id;
//   int? quantity;
//   DateTime? isProcessedAt;
//   String? isActive;
//   List<Item> items;
//   ProcessingOrders({this.id, this.quantity,this.isProcessedAt, this.isActive, required this.items});
//   factory ProcessingOrders.fromJson(Map<String, dynamic> json) => ProcessingOrders(
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//         id: json["id"],
//         isProcessedAt: json['isProcessedAt'],
//         quantity: json["quantity"],
//         isActive: json["isActive"],
//       );
// }
