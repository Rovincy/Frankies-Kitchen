import 'package:flutter/material.dart';
import 'Item.dart';

class ProcessingItems {
  int? id;
  int? productId;
  int? locationId;
  String? orderNumber;
  int? quantity;
  DateTime? isProcessedAt;
  DateTime? isDeliveredAt;
  bool? isActive;
  String? name;
  String? comment;
  int? kitchenId;
  // List<Item> items;
  ProcessingItems({
    required this.id, 
    required this.productId,
    required this.locationId,
    required this.orderNumber,
    required this.quantity, 
    required this.isProcessedAt,
    required this.isDeliveredAt,
    required this.isActive, 
    required this.kitchenId,
    required this.comment,
    required this.name});
  factory ProcessingItems.fromJson(Map<String, dynamic> json) => ProcessingItems(
        // items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        id: json["id"],
        productId: json['productId'],
        locationId: json['locationId'],
        orderNumber: json['orderNumber'],
        quantity: json["quantity"],
        isProcessedAt: json['isProcessedAt'],
        isDeliveredAt: json['isDeliveredAt'],
        isActive: json["isActive"],
        comment: json['comment'],
        kitchenId: json['kitchenId'],
        name:  json['name']
      );
}

class ItemList{
  List<ProcessingItems>? itemModel;
  ItemList({this.itemModel});
}

ItemList itemList = ItemList(itemModel: []);