import 'package:flutter/material.dart';

class Item {
  int? id;
  int? code;
  String? name;
  int? quantity;
  String? image;
  int? categoryId;
  String? category;
  Item(
      {this.id,
      this.code,
      this.name,
      this.quantity,
      this.image,
      this.categoryId,
      this.category});
  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json["id"],
      code: json["code"],
      name: json["name"],
      quantity: json["quantity"],
      image: json["image"],
      categoryId: json["categoryId"],
      category: json["category"]);
}
