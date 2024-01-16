import 'package:flutter/material.dart';
import 'Item.dart';

class OrderItems {
  int? id;
  int? quantity;
  DateTime? isProcessedAt;
  DateTime? isDeliveredAt;
  bool? isActive;
  String? name;
  String? comment;
  int? kitchenId;
  // List<Item> items;
  OrderItems({
    required this.id, 
    required this.quantity, 
    required this.isProcessedAt,
    required this.isDeliveredAt,
    required this.isActive, 
    required this.kitchenId,
    required this.comment,
    required this.name});
  factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
        // items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        id: json["id"],
        quantity: json["quantity"],
        isProcessedAt: json['isProcessedAt'],
        isDeliveredAt: json['isDeliveredAt'],
        isActive: json["isActive"],
        comment: json['comment'],
        kitchenId: json['kitchenId'],
        name:  json['name']
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "isProcessedAt": isProcessedAt,
        "isDeliveredAt": isDeliveredAt,
        'isActive':isActive,
        'comment':comment,
        'kitchenId':kitchenId,
        'name':name
      };
      
  
}

 