import 'package:flutter/Material.dart';

class ProcessingOrders {
  int? id;
  int? locationId;
  int? isPrinted;
  String? orderDate;
  String? processingTime;
  String? orderNumber;
  int? tableId;
  int? isCompleted;
  int? allowBillSpliting;
  int? isDelivered;
  List<ProcessingOrderItems> processingOrderItems;
  ProcessingOrders(
      {this.id,
      this.isPrinted,
      this.locationId,
      this.orderDate,
      this.processingTime,
      this.tableId,
      this.isCompleted,
      this.orderNumber,
      this.allowBillSpliting,
      this.isDelivered,
      required this.processingOrderItems});
  factory ProcessingOrders.fromJson(Map<String, dynamic> json) =>
      ProcessingOrders(
        id: json["id"],
        // isPrinted: json['isPrinted'],
        locationId: json['locationId'],
        orderDate: json["orderDate"],
        processingTime: json['processingTime'],
        tableId: json["tableId"],
        orderNumber: json["orderNumber"],
        isCompleted: json["isCompleted"],
        isDelivered: json["isDelivered"],
        processingOrderItems: List<ProcessingOrderItems>.from(
            json["ProcessingOrderItems"].map((x) => ProcessingOrderItems.fromJson(x))),
      );
}

class ProcessingOrderItems {
  int? id;
  int? quantity;
  DateTime? isProcessedAt;
  DateTime? isDeliveredAt;
  bool? isActive;
  String? name;
  String? comment;
  int? kitchenId;
  // List<Item> items;
  ProcessingOrderItems({
    required this.id, 
    required this.quantity, 
     this.isProcessedAt,
     this.isDeliveredAt,
    required this.isActive, 
     this.kitchenId,
    required this.comment,
    required this.name});
  factory ProcessingOrderItems.fromJson(Map<String, dynamic> json) => ProcessingOrderItems(
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

class ProcessingOrderList {
  List<ProcessingOrders>? processingOrderModel;

  ProcessingOrderList({@required this.processingOrderModel});
}

ProcessingOrderList processingOrderList = ProcessingOrderList(processingOrderModel: []);