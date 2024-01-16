import 'dart:convert';
// import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:frankies_kitchen/model/newIncomingOrderModel.dart';
import 'package:frankies_kitchen/view/splashscreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'baseUrl.dart';

printerAPI(BuildContext context, orderNumber,orderId,orderDetails) async {
  try {
    // print("object");
    // print(orderNumber);
    // print(userId);
    // print(orderId);
    // // // print(data.isDelivered);
    List<IncomingOrderItems> val = []; // Create an empty list to store TransactionDetail objects
    for (var item in orderDetails) {
      // Convert each orderDetail item to IncomingOrderItems and add to the list
      val.add(IncomingOrderItems(
        productId: item.id,
        quantity: item.quantity,
        comment: item.comment, 
        id: item.id, 
        name: '',
      ));
    }

    var url = Uri.parse('$baseUrl/api/Kitchen/PrintReceipt?orderNumber=$orderNumber&orderId=$orderId&userId=$userId');

    var data = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
      body: jsonEncode(val), // Convert the list to JSON format
    );
    // (context as Element).markNeedsBuild();
    // print(data.statusCode);
    // // print(response);
    var resp = jsonDecode(data.body);
    print(resp);
    // // Navigator.pop(context);
    // if (resp['succeeded']) {
    //   // print("Kitchen receipt printed successfully");
    //   // Navigator.pop(context);
    //   // cakeReceiptFinalTaxInclusive(
    //   //     context,
    //   //     orderDetails,
    //   //     orderData.orderId,
    //   //     orderData.customerName,
    //   //     orderData.customerDescription,
    //   //     orderData.phoneNumber,
    //   //     orderData.deliveryDate,
    //   //     data.receiptNumber,
    //   //     formattedDates,
    //   //     totalSale);
    //   // print('print delivery receipt here');
    //   // var snackBar = SnackBar(content: Text("Operation successful"));
    //   // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   // // foodItems.clear();
    //   // context.read<Model>().disposeValues();
    //   // taxesList.taxModel!.clear();
    //   // // bloc.emptyCart(foodItems, context);
    //   // // context.read<Model>().isRefreshing(true);
    //   // levyAmount = 0.00;
    //   // taxAmount = 0.00;
    //   // totalAmtDue = 0.0;
    //   // // bool pageNotRefreshed = false;
    //   // isRestaurant = false;
    //   // // int? userLocationId, userId;
    //   // Get.toNamed("/Splashscreen");
    //   // // html.window.location.reload();
    // } else {
    //   Navigator.pop(context);
    //   var snackBar = SnackBar(content: Text("Sorry, printing operation failed"));
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
  } catch (e) {
    // Navigator.pop(context);
    print(e);
    // var snackBar = SnackBar(content: Text("Sorry, printing operation failed"));
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
