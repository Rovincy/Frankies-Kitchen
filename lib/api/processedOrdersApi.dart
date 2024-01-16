import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:frankies_kitchen/model/processingOrderList.dart';
import 'package:frankies_kitchen/model/processingOrders.dart';

import 'baseUrl.dart';
import 'package:http/http.dart' as http;

processedOrder(BuildContext context,String orderNumber,int orderId, String id, int userId) async {
  // print(id);
  // print(orderNumber);
  final response = await http.put(
    Uri.parse(
        '$baseUrl/api/Kitchen/Incoming?orderNumber=$orderNumber&orderId=$orderId&productId=$id&userId=$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  // (context as Element).markNeedsBuild();
  // print(response.body);
}
