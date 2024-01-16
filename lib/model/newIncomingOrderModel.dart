import 'package:flutter/Material.dart';

class IncomingOrders {
  int? id;
  String? orderDate;
  String? orderNumber;
  // int? tableId;
  int? locationId;
  int? isCompleted;
  // int? allowBillSpliting;
  bool? isPressed;
  int? isDelivered;
  List<IncomingOrderItems> incomingOrderItems;
  IncomingOrders(
      {this.id,
      this.locationId,
      this.orderDate,
      this.orderNumber,
      // this.tableId,
      this.isCompleted,
      this.isPressed,
      // this.allowBillSpliting,
      this.isDelivered,
      required this.incomingOrderItems});
  factory IncomingOrders.fromJson(Map<String, dynamic> json) => IncomingOrders(
        id: json["id"],
        locationId: json['locationId'],
        isPressed: json['isPressed'],
        orderNumber:json['orderNumber'],
        orderDate: json["orderDate"],
        // tableId: json["tableId"],
        isCompleted: json["isCompleted"],
        isDelivered: json["isDelivered"],
        incomingOrderItems: List<IncomingOrderItems>.from(
            json["IncomingOrderItems"].map((x) => IncomingOrderItems.fromJson(x))),
      );
}

class IncomingOrderItems {
  int? id;
  int? productId;
  int? quantity;
  DateTime? isProcessedAt;
  DateTime? isDeliveredAt;
  bool? isActive;
  String? name;
  String? comment;
  int? kitchenId;
  // List<Item> items;
  IncomingOrderItems({
    required this.id, 
    this.productId,
    required this.quantity, 
     this.isProcessedAt,
     this.isDeliveredAt,
     this.isActive, 
     this.kitchenId,
     this.comment,
    required this.name});
  factory IncomingOrderItems.fromJson(Map<String, dynamic> json) => IncomingOrderItems(
        // items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        id: json["id"],
        productId: json["productId"],
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
        "productId":productId,
        "quantity": quantity,
        "isProcessedAt": isProcessedAt,
        "isDeliveredAt": isDeliveredAt,
        'isActive':isActive,
        'comment':comment,
        'kitchenId':kitchenId,
        'name':name
      };
}

class IncomingOrderList {
  List<IncomingOrders>? incomingOrderModel;

  IncomingOrderList({@required this.incomingOrderModel});
}

IncomingOrderList incomingOrderList = IncomingOrderList(incomingOrderModel: []);