import 'dart:convert';

import 'package:frankies_kitchen/model/processingOrderList.dart';
import 'package:frankies_kitchen/model/processingOrders.dart';

import 'baseUrl.dart';
import 'package:http/http.dart' as http;

completedOrder(String orderNumber,int orderId, String productId, int userId) async {
  print(orderNumber);
  print(productId);
  print(userId);
  final response = await http.put(
    Uri.parse(
        '$baseUrl/api/Kitchen/Processing?orderNumber=$orderNumber&orderId=$orderId&productId=$productId&userId=$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  // print(response.body);
  if (response.statusCode == 200) {
    return 'Order successfully processed';
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Processing failed.');
  }
}
