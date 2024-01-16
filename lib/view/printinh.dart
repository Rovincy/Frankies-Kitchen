// import 'dart:typed_data';

// // import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// final myFormat = new NumberFormat("#,##0.00", "en_US");
// printReceipt(
//     BuildContext context) async {
//   final doc = pw.Document();
  
//   doc.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.roll80,
//       build: (pw.Context context) {
//         return pw.Center(
//           child: test(
//               "SALES RECEIPT"),
//         );
//       },
//     ),
//   );
//   // myLoadingIndicator(context);
//   // await Printing.layoutPdf(onLayout: (_) => doc.save());

//   // await Printing.layoutPdf(
//   //   onLayout: (format) => doc.save(),
//   //   name: 'test.pdf',
//   //   format: PdfPageFormat.roll80
//   //   );

//   await Printing.directPrintPdf(printer: const Printer(url: 'Star TSP143IIIBI Cutter',isDefault: true,isAvailable: true),usePrinterSettings: true, onLayout:(format)=> doc.save());
//   // await Printing.directPrintPdf(printer: Printer(url: 'Star TSP143IIIBI Cutter',isDefault: true), onLayout:(format)=> doc.save());

//   // await postOrders(context, foodItems, data, doc);

//   // postTransactions(context, foodItems, receiptNo, doc, salesAmount);

//   // await Printing.layoutPdf(onLayout: (format) => generatePdf(format,doc));
//   // foodItems.clear();
//   // context.read<Model>().disposeValue();
//   // taxesList.taxModel!.clear();
//   // Get.toNamed("/Splashscreen");
// //   Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => PreviewScreen(
// //           doc: doc,
// //           foodItems: foodItems,
// //           // receiptNumber: receiptNo,
// //           // // isUserInput: isUserInput,
// //           // totalCharges: double.parse(grandTotal),
// //         ),
// //       ));
// }

// test(title) {
//   return pw.Column(children: [
//     pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.center,
//       children: [
//         pw.Column(
//           // crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             // pw.Image(image, width: 80),
//             // pw.Text(
//             //   userLocation == "Shop"
//             //       ? "Frankies $userLocation".toUpperCase()
//             //       : companyInfoList.companyInfoModel![0].name!.toUpperCase(),
//             //   style: pw.TextStyle(
//             //     fontSize: 8,
//             //     fontWeight: pw.FontWeight.bold,
//             //   ),
//             // ),
//             pw.Text('TIN#: C0006548660', style: pw.TextStyle(fontSize: 8)),
//             // pw.Text(companyInfoList.companyInfoModel![0].address!.toUpperCase(),
//             //     style: pw.TextStyle(fontSize: 8))
//           ],
//         ),
//       ],
//     ),
//     pw.SizedBox(height: 10),
//     pw.Row(
//       children: [
//         pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               title.toUpperCase(),
//               style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
//             ),
//             // pw.Text(
//             //   "Waiter: $username".toUpperCase(),
//             //   style:
//             //       pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 8),
//             // ),
//             // pw.Text('Receipt #: $receiptNo'.toUpperCase(),
//             //     style: pw.TextStyle(fontSize: 8)),
//             // isRestaurant!
//             //     ? pw.Text('Order #: $orderId'.toUpperCase(),
//             //         style: pw.TextStyle(fontSize: 8))
//             //     : pw.Container(),
//             // // pw.Text('VAT number: C0006548660',
//             // //     style: pw.TextStyle(fontSize: 8)),
//             // pw.Text('Date:${formattedDates.toString()}'.toUpperCase(),
//             //     style: pw.TextStyle(fontSize: 8)),
//           ],
//         ),
//       ],
//     ),
//     pw.SizedBox(height: 10),
//     pw.Container(
//       height: 35,
//       padding: pw.EdgeInsets.only(left: 10, right: 10),
//       decoration: pw.BoxDecoration(color: PdfColors.grey300),
//       child: pw.Row(
//         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//         children: [
//           pw.Text(
//             "",
//           ),
//           pw.Text(
//             "Item(s)".toUpperCase(),
//             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
//           ),
//           // pw.SizedBox(width: 150),
//           pw.Text(
//             "Price".toUpperCase(),
//             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
//           ),
//           // pw.SizedBox(width: 45),

//           pw.Text(
//             "Qty".toUpperCase(),
//             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
//           ),
//           // pw.SizedBox(width: 45),

//           pw.Text(
//             "Amt".toUpperCase(),
//             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
//           )
//         ],
//       ),
//     ),
//     // pw.SizedBox(height: 10),
//     // pw.ListView.builder(
//     //   itemCount: foodItems.length,
//     //   itemBuilder: (context, index) {
//     //     final item = foodItems[index];
//     //     return pw.Row(
//     //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//     //       children: [
//     //         pw.Expanded(
//     //           // flex: 1,
//     //           child: pw.Text('${index + 1}'.toUpperCase(),
//     //               style: pw.TextStyle(fontSize: 8)),
//     //         ),
//     //         pw.Expanded(
//     //           flex: 3,
//     //           child: pw.Text('${item.name}'.toUpperCase(),
//     //               style: pw.TextStyle(fontSize: 8)),
//     //         ),
//     //         // pw.SizedBox(width: 150),

//     //         pw.Expanded(
//     //           flex: 2,
//     //           child: pw.Row(
//     //               mainAxisAlignment: pw.MainAxisAlignment.center,
//     //               children: [
//     //                 pw.Text('${myFormat.format(item.price!)}'.toUpperCase(),
//     //                     style: pw.TextStyle(fontSize: 8))
//     //               ]),
//     //         ),
//     //         // pw.SizedBox(width: 70),

//     //         pw.Expanded(
//     //           flex: 1,
//     //           child: pw.Row(
//     //               mainAxisAlignment: pw.MainAxisAlignment.center,
//     //               children: [
//     //                 pw.Text('${item.quantity}'.toUpperCase(),
//     //                     style: pw.TextStyle(fontSize: 8))
//     //               ]),
//     //         ),
//     //         // pw.SizedBox(width: 70),

//     //         pw.Expanded(
//     //           flex: 2,
//     //           child: pw.Row(
//     //               mainAxisAlignment: pw.MainAxisAlignment.end,
//     //               children: [
//     //                 pw.Text(
//     //                     '${(myFormat.format(item.price! * item.quantity!))}',
//     //                     style: pw.TextStyle(fontSize: 8))
//     //               ]),
//     //         ),
//     //       ],
//     //     );
//     //   },
//     // ),
    
//     pw.Text(
//       "============================",
//     ),
//     // pw.SizedBox(height: 10),
//     pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//       children: [
//         pw.Text("SALES AMOUNT: ", style: pw.TextStyle(fontSize: 8)),
//         pw.Text(""),
//         // pw.Text("${myFormat.format(salesAmount)}",
//         //     style: pw.TextStyle(fontSize: 8)),
//       ],
//     ),
//     pw.Text(
//       "============================",
//     ),
//     // pw.SizedBox(height: 10),
//     // pw.ListView(children: [
//     //   for (var tax in taxesList.taxModel!)
//     //     pw.Builder(
//     //       builder: (context) {
//     //         return tax.isLevi == 1
//     //             ? pw.Row(
//     //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//     //                 children: [
//     //                     pw.Text(tax.name!.toUpperCase(),
//     //                         style: pw.TextStyle(fontSize: 8)),
//     //                     pw.Text("", style: pw.TextStyle(fontSize: 8)),
//     //                     pw.Text(
//     //                         "${myFormat.format((tax.amount! / 100) * grandTotal)}",
//     //                         style: pw.TextStyle(fontSize: 8))
//     //                   ])
//     //             : pw.Text("");
//     //       },
//     //     )
//     // ]),
    
//     pw.Text(
//       "============================",
//     ),
//     // pw.SizedBox(height: 10),
//     pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//       children: [
//         pw.Text("SUB-TOTAL: ", style: pw.TextStyle(fontSize: 8)),
//         pw.Text(""),
//         // pw.Text("${myFormat.format(double.parse(subTotal.toString()))}",
//         //     style: pw.TextStyle(fontSize: 8)),
//       ],
//     ),
//     pw.Text(
//       "============================",
//     ),
//     // pw.SizedBox(height: 10),
//     // pw.ListView(children: [
//     //   for (var tax in taxesList.taxModel!)
//     //     pw.Builder(
//     //       builder: (context) {
//     //         return tax.isLevi == 0
//     //             ? pw.Row(
//     //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//     //                 children: [
//     //                     pw.Text(tax.name!.toUpperCase(),
//     //                         style: pw.TextStyle(fontSize: 8)),
//     //                     pw.Text("", style: pw.TextStyle(fontSize: 8)),
//     //                     // pw.Text(
//     //                     //     "${((tax.amount! / 100) * double.parse(subTotal)).toStringAsFixed(2)}")
//     //                     pw.Text(
//     //                         '${myFormat.format((tax.amount! / 100) * subTotal)}',
//     //                         style: pw.TextStyle(fontSize: 8))
//     //                   ])
//     //             : pw.Text("");
//     //       },
//     //     )
//     // ]),
//     pw.Text(
//       "============================",
//     ),
//     // pw.SizedBox(height: 10),
//     pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//       children: [
//         pw.Text(""),
//         // pw.Text(
//         //   "Grand Total: ${myFormat.format(double.parse(grandTotal.toString()))}"
//         //       .toUpperCase(),
//         //   style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
//         // ),
//       ],
//     ),
//     // isRestaurant!
//     //     ? deliveryCost == "0.00"
//     //         ? pw.Container()
//     //         : pw.Row(
//     //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//     //             children: [
//     //               pw.Text(""),
//     //               pw.Text(
//     //                 "Delivery cost: ${myFormat.format(double.parse(deliveryCost.toString()))}"
//     //                     .toUpperCase(),
//     //                 style: pw.TextStyle(
//     //                     fontWeight: pw.FontWeight.normal, fontSize: 8),
//     //               ),
//     //             ],
//     //           )
//     //     : pw.Container(),
//     // pw.Row(
//     //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//     //   children: [
//     //     pw.Text(""),
//     //     pw.Text(
//     //         "Paid: ${myFormat.format(double.parse(cashAmount.toString()))}"
//     //             .toUpperCase(),
//     //         style: pw.TextStyle(fontSize: 8)
//     //         // style: pw.TextStyle(
//     //         //     fontWeight: pw.FontWeight.bold, fontSize: 18),
//     //         ),
//     //   ],
//     // ),
//     // pw.Row(
//     //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//     //   children: [
//     //     pw.Text(""),
//     //     pw.Text(
//     //         "Change: ${myFormat.format(double.parse(change.toString()))}"
//     //             .toUpperCase(),
//     //         style: pw.TextStyle(fontSize: 8)
//     //         // style: pw.TextStyle(
//     //         //     fontWeight: pw.FontWeight.bold, fontSize: 18),
//     //         ),
//     //   ],
//     // ),
//     // pw.SizedBox(height: 10),
//     // pw.Column(
//     //   // crossAxisAlignment: pw.CrossAxisAlignment.start,
//     //   children: [
//     //     pw.Text(
//     //         'Tel: ${companyInfoList.companyInfoModel![0].phoneNumber}'
//     //             .toUpperCase(),
//     //         style: pw.TextStyle(fontSize: 8)),
//     //     pw.Text(
//     //         'Email: ${companyInfoList.companyInfoModel![0].email}'
//     //             .toUpperCase(),
//     //         style: pw.TextStyle(fontSize: 8)),
//     //     pw.Text(companyInfoList.companyInfoModel![0].message!.toUpperCase(),
//     //         style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.0)),
//     //     // pw.Text(
//     //     //   'VAT number: C0006548660',
//     //     // ),
//     //   ],
//     // ),

//     pw.SizedBox(
//       height: 90.0,
//     ),
//   ]);
// }

// // Future<Uint8List> generatePdf(PdfPageFormat format, pdf) async {
// //   // final pdf = pw.Document();

// //   // pdf.addPage(
// //   //   pw.Page(
// //   //     pageFormat: format,
// //   //     build: (context) => pw.Placeholder(),
// //   //   ),
// //   // );

// //   return pdf.save();
// // }

// // processTaxes(BuildContext context) {
// //   // List<Tax> taxes;
// //   double subtotal = /*isRestaurant!
// //       ? totalAmtDue
// //       : */
// //       double.parse(context.read<Model>().totalAmountDue!);
// //   for (var item in taxesList.taxModel!) {
// //     if (item.isLevi == 1) {
// //       levyAmount = levyAmount +
// //           (item.amount! / 100) *
// //               (/*isRestaurant!
// //                   ? totalAmtDue
// //                   : */
// //                   double.parse(context.read<Model>().totalAmountDue!));
// //     }
// //   }

// //   for (var item in taxesList.taxModel!) {
// //     if (item.isLevi == 0) {
// //       subtotal = levyAmount +
// //           (/*isRestaurant!
// //               ? totalAmtDue
// //               :*/
// //               double.parse(context.read<Model>().totalAmountDue!));
// //       taxAmount = (item.amount! / 100) * subtotal;
// //     }
// //   }
// // }

// // final myFormat = new NumberFormat("#,##0.00", "en_US");
// // waiterReceiptTaxInclusive(
// //     BuildContext context, List<FoodItem> foodItems, data) async {
// //   // Tax taxs;
// //   // SharedPreferences prefs = await SharedPreferences.getInstance();
// //   // if (!isUserInput) {
// //   var taxTotalPercent1 = 100.0;
// //   var taxTotalPercent2 = 100.0;
// //   // context.read<Model>().totalAmount(totalAmtDue);
// //   if (isRestaurant!) {
// //     if (context.read<Model>().deliveryCost.text.trim() == "") {
// //       context.read<Model>().totalAmount(totalAmtDue);
// //     } else {
// //       context.read<Model>().totalAmount(
// //           totalAmtDue - double.parse(context.read<Model>().deliveryCost.text));
// //     }
// //   }
// //   for (var details in taxesList.taxModel!) {
// //     if (details.isLevi == 1) {
// //       taxTotalPercent1 =
// //           taxTotalPercent1 + double.parse(details.amount.toString());
// //     } else if (details.isLevi == 0) {
// //       taxTotalPercent2 =
// //           taxTotalPercent2 + double.parse(details.amount.toString());
// //     }
// //   }
// //   double primeVat = (/*isRestaurant!
// //           ? totalAmtDue
// //           : */
// //           double.parse(context.read<Model>().totalAmountDue!) * 12.5) /
// //       taxTotalPercent2;
// //   double primeTax = /*isRestaurant!
// //       ? totalAmtDue
// //       : */
// //       double.parse(context.read<Model>().totalAmountDue!) - primeVat;
// //   context.read<Model>().totalAmount((primeTax * 100) / taxTotalPercent1);

// //   processTaxes(context);
// //   // }
// //   final doc = pw.Document();
// //   var newDateFormat = new DateFormat('dd-MM-yy');
// //   var now = new DateTime.now();
// //   String formattedDates = newDateFormat.format(now);
// //   // String formattedDates = newDateFormat.format(now);
// //   String time = DateFormat.Hms().format(now);
// //   final image = await imageFromAssetBundle("assets/Frankie's_Logo.jpeg");
// //   // var deliveryCost = context.read<Model>().deliveryCost.text;
// //   String deliveryCost = context.read<Model>().deliveryCost.text.trim() == ""
// //       ? "0.00"
// //       : "${double.parse(context.read<Model>().deliveryCost.text.toString()).toStringAsFixed(2)}";
// //   String cashAmount =
// //       double.parse(context.read<Model>().amountPaid.text).toStringAsFixed(2);
// //   // String receiptNo = formattedDates.substring(0, 2) +
// //   //     time.substring(0, 2) +
// //   //     username!.substring(0, 2).toUpperCase();

// //   // var newDateFormat = new DateFormat('dd-MM-yy');
// //   // String formattedDates = newDateFormat.format(now);
// //   // String time = DateFormat.Hms().format(now);
// //   String receiptNo =
// //       (formattedDates + time + username!.substring(0, 2).toUpperCase())
// //           .replaceAll(RegExp('[^A-Za-z0-9]'), '');

// //   String orderId = context.read<Model>().orderId.text;

// //   double salesAmount = /*isRestaurant!
// //       ? totalAmtDue
// //       : */
// //       double.parse(context.read<Model>().totalAmountDue!);

// //   var subTotal = (levyAmount + salesAmount).toStringAsFixed(2);

// //   var grandTotal = (taxAmount + double.parse(subTotal)).toStringAsFixed(2);

// //   // print(primeVat);
// //   // print(primeTax);
// //   // print(salesAmount);
// //   // print(subTotal);
// //   // print(grandTotal);

// //   // var grandTotal =
// //   //     double.parse(context.read<Model>().totalAmountDue!).toStringAsFixed(2);

// //   var change = 0.00;
// //   // (double.parse(cashAmount) - double.parse(grandTotal)).toStringAsFixed(2);
// //   // print(taxesList.taxModel!.toList());

// //   doc.addPage(
// //     pw.Page(
// //       pageFormat: PdfPageFormat.roll80,
// //       build: (pw.Context context) {
// //         return pw.Center(
// //           child: test(
// //               "SALES RECEIPT",
// //               image,
// //               receiptNo,
// //               orderId,
// //               formattedDates,
// //               foodItems,
// //               subTotal,
// //               salesAmount,
// //               grandTotal,
// //               cashAmount,
// //               change,
// //               deliveryCost),
// //         );
// //       },
// //     ),
// //   );
// //   // myLoadingIndicator(context);
// //   // await Printing.layoutPdf(onLayout: (_) => doc.save());

// //   // await Printing.layoutPdf(onLayout: (_) => doc.save());

// //   // postTransactions(context, foodItems, receiptNo, doc, salesAmount);

// //   // to be uncommented
// //   // await postOrders(context, foodItems, data,doc);

// //   await Printing.layoutPdf(onLayout: (_) => doc.save());

// //   // Navigator.pop(context);

// //   // await Printing.layoutPdf(onLayout: (format) => generatePdf(format,doc));
// //   // foodItems.clear();
// //   // context.read<Model>().disposeValue();
// //   // taxesList.taxModel!.clear();
// //   // Get.toNamed("/Splashscreen");
// // //   Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => PreviewScreen(
// // //           doc: doc,
// // //           foodItems: foodItems,
// // //           // receiptNumber: receiptNo,
// // //           // // isUserInput: isUserInput,
// // //           // totalCharges: double.parse(grandTotal),
// // //         ),
// // //       ));
// // }

// // test(title, image, receiptNo, orderId, formattedDates, foodItems, subTotal,
// //     salesAmount, grandTotal, cashAmount, change, deliveryCost) {
// //   return pw.Column(children: [
// //     pw.Row(
// //       mainAxisAlignment: pw.MainAxisAlignment.center,
// //       children: [
// //         pw.Column(
// //           // crossAxisAlignment: pw.CrossAxisAlignment.start,
// //           children: [
// //             pw.Image(image, width: 80),
// //             pw.Text(
// //               userLocation == "Shop"
// //                   ? "Frankies $userLocation".toUpperCase()
// //                   : companyInfoList.companyInfoModel![0].name!.toUpperCase(),
// //               style: pw.TextStyle(
// //                 fontSize: 8,
// //                 fontWeight: pw.FontWeight.bold,
// //               ),
// //             ),
// //             pw.Text('TIN#: C0006548660', style: pw.TextStyle(fontSize: 8)),
// //             pw.Text(companyInfoList.companyInfoModel![0].address!.toUpperCase(),
// //                 style: pw.TextStyle(fontSize: 8))
// //           ],
// //         ),
// //       ],
// //     ),
// //     pw.SizedBox(height: 10),
// //     pw.Row(
// //       children: [
// //         pw.Column(
// //           crossAxisAlignment: pw.CrossAxisAlignment.start,
// //           children: [
// //             pw.Text(
// //               title.toUpperCase(),
// //               style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
// //             ),
// //             pw.Text(
// //               "Cashier: $username".toUpperCase(),
// //               style:
// //                   pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 8),
// //             ),
// //             pw.Text('Receipt #: $receiptNo'.toUpperCase(),
// //                 style: pw.TextStyle(fontSize: 8)),
// //             isRestaurant!
// //                 ? pw.Text('Order #: $orderId'.toUpperCase(),
// //                     style: pw.TextStyle(fontSize: 8))
// //                 : pw.Container(),
// //             // pw.Text('VAT number: C0006548660',
// //             //     style: pw.TextStyle(fontSize: 8)),
// //             pw.Text('Date:${formattedDates.toString()}'.toUpperCase(),
// //                 style: pw.TextStyle(fontSize: 8)),
// //           ],
// //         ),
// //       ],
// //     ),
// //     pw.SizedBox(height: 10),
// //     pw.Container(
// //       height: 35,
// //       padding: pw.EdgeInsets.only(left: 10, right: 10),
// //       decoration: pw.BoxDecoration(color: PdfColors.grey300),
// //       child: pw.Row(
// //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //         children: [
// //           pw.Text(
// //             "",
// //           ),
// //           pw.Text(
// //             "Item(s)".toUpperCase(),
// //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
// //           ),
// //           // pw.SizedBox(width: 150),
// //           pw.Text(
// //             "Price".toUpperCase(),
// //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
// //           ),
// //           // pw.SizedBox(width: 45),

// //           pw.Text(
// //             "Qty".toUpperCase(),
// //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
// //           ),
// //           // pw.SizedBox(width: 45),

// //           pw.Text(
// //             "Amt".toUpperCase(),
// //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
// //           )
// //         ],
// //       ),
// //     ),
// //     // pw.SizedBox(height: 10),
// //     pw.ListView.builder(
// //       itemCount: foodItems.length,
// //       itemBuilder: (context, index) {
// //         final item = foodItems[index];
// //         return pw.Row(
// //           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //           children: [
// //             pw.Expanded(
// //               // flex: 1,
// //               child: pw.Text('${index + 1}'.toUpperCase(),
// //                   style: pw.TextStyle(fontSize: 8)),
// //             ),
// //             pw.Expanded(
// //               flex: 3,
// //               child: pw.Text('${item.name}'.toUpperCase(),
// //                   style: pw.TextStyle(fontSize: 8)),
// //             ),
// //             // pw.SizedBox(width: 150),

// //             pw.Expanded(
// //               flex: 2,
// //               child: pw.Row(
// //                   mainAxisAlignment: pw.MainAxisAlignment.center,
// //                   children: [
// //                     pw.Text('${myFormat.format(item.price!)}'.toUpperCase(),
// //                         style: pw.TextStyle(fontSize: 8))
// //                   ]),
// //             ),
// //             // pw.SizedBox(width: 70),

// //             pw.Expanded(
// //               flex: 1,
// //               child: pw.Row(
// //                   mainAxisAlignment: pw.MainAxisAlignment.center,
// //                   children: [
// //                     pw.Text('${item.quantity}'.toUpperCase(),
// //                         style: pw.TextStyle(fontSize: 8))
// //                   ]),
// //             ),
// //             // pw.SizedBox(width: 70),

// //             pw.Expanded(
// //               flex: 2,
// //               child: pw.Row(
// //                   mainAxisAlignment: pw.MainAxisAlignment.end,
// //                   children: [
// //                     pw.Text(
// //                         '${(myFormat.format(item.price! * item.quantity!))}',
// //                         style: pw.TextStyle(fontSize: 8))
// //                   ]),
// //             ),
// //           ],
// //         );
// //       },
// //     ),
// //     pw.Text(
// //       "============================",
// //     ),
// //     // pw.SizedBox(height: 10),
// //     pw.Row(
// //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //       children: [
// //         pw.Text("SALES AMOUNT: ", style: pw.TextStyle(fontSize: 8)),
// //         pw.Text(""),
// //         pw.Text("${myFormat.format(salesAmount)}",
// //             style: pw.TextStyle(fontSize: 8)),
// //       ],
// //     ),
// //     pw.Text(
// //       "============================",
// //     ),
// //     // pw.SizedBox(height: 10),
// //     pw.ListView(children: [
// //       for (var tax in taxesList.taxModel!)
// //         pw.Builder(
// //           builder: (context) {
// //             return tax.isLevi == 1
// //                 ? pw.Row(
// //                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //                     children: [
// //                         pw.Text(tax.name!.toUpperCase(),
// //                             style: pw.TextStyle(fontSize: 8)),
// //                         pw.Text("", style: pw.TextStyle(fontSize: 8)),
// //                         pw.Text(
// //                             "${myFormat.format((tax.amount! / 100) * salesAmount)}",
// //                             style: pw.TextStyle(fontSize: 8))
// //                       ])
// //                 : pw.Text("");
// //           },
// //         )
// //     ]),
// //     pw.Text(
// //       "============================",
// //     ),
// //     // pw.SizedBox(height: 10),
// //     pw.Row(
// //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //       children: [
// //         pw.Text("SUB-TOTAL: ", style: pw.TextStyle(fontSize: 8)),
// //         pw.Text(""),
// //         pw.Text("${myFormat.format(double.parse(subTotal.toString()))}",
// //             style: pw.TextStyle(fontSize: 8)),
// //       ],
// //     ),
// //     pw.Text(
// //       "============================",
// //     ),
// //     // pw.SizedBox(height: 10),
// //     pw.ListView(children: [
// //       for (var tax in taxesList.taxModel!)
// //         pw.Builder(
// //           builder: (context) {
// //             return tax.isLevi == 0
// //                 ? pw.Row(
// //                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //                     children: [
// //                         pw.Text(tax.name!.toUpperCase(),
// //                             style: pw.TextStyle(fontSize: 8)),
// //                         pw.Text("", style: pw.TextStyle(fontSize: 8)),
// //                         // pw.Text(
// //                         //     "${((tax.amount! / 100) * double.parse(subTotal)).toStringAsFixed(2)}")
// //                         pw.Text('${myFormat.format(taxAmount)}',
// //                             style: pw.TextStyle(fontSize: 8))
// //                       ])
// //                 : pw.Text("");
// //           },
// //         )
// //     ]),
// //     pw.Text(
// //       "============================",
// //     ),
// //     // pw.SizedBox(height: 10),
// //     pw.Row(
// //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //       children: [
// //         pw.Text(""),
// //         pw.Text(
// //           "Grand Total: ${myFormat.format(double.parse(grandTotal.toString()))}"
// //               .toUpperCase(),
// //           style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
// //         ),
// //       ],
// //     ),
// //     // isRestaurant!
// //     //     ? deliveryCost == "0.00"
// //     //         ? pw.Container()
// //     //         : pw.Row(
// //     //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //     //             children: [
// //     //               pw.Text(""),
// //     //               pw.Text(
// //     //                 "Delivery cost: ${myFormat.format(double.parse(deliveryCost.toString()))}"
// //     //                     .toUpperCase(),
// //     //                 style: pw.TextStyle(
// //     //                     fontWeight: pw.FontWeight.normal, fontSize: 8),
// //     //               ),
// //     //             ],
// //     //           )
// //     //     : pw.Container(),
// //     // pw.Row(
// //     //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //     //   children: [
// //     //     pw.Text(""),
// //     //     pw.Text(
// //     //         "Paid: ${myFormat.format(double.parse(cashAmount.toString()))}"
// //     //             .toUpperCase(),
// //     //         style: pw.TextStyle(fontSize: 8)
// //     //         // style: pw.TextStyle(
// //     //         //     fontWeight: pw.FontWeight.bold, fontSize: 18),
// //     //         ),
// //     //   ],
// //     // ),
// //     // pw.Row(
// //     //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
// //     //   children: [
// //     //     pw.Text(""),
// //     //     pw.Text(
// //     //         "Change: ${myFormat.format(double.parse(change.toString()))}"
// //     //             .toUpperCase(),
// //     //         style: pw.TextStyle(fontSize: 8)
// //     //         // style: pw.TextStyle(
// //     //         //     fontWeight: pw.FontWeight.bold, fontSize: 18),
// //     //         ),
// //     //   ],
// //     // ),
// //     pw.SizedBox(height: 10),
// //     pw.Column(
// //       // crossAxisAlignment: pw.CrossAxisAlignment.start,
// //       children: [
// //         pw.Text(
// //             'Tel: ${companyInfoList.companyInfoModel![0].phoneNumber}'
// //                 .toUpperCase(),
// //             style: pw.TextStyle(fontSize: 8)),
// //         pw.Text(
// //             'Email: ${companyInfoList.companyInfoModel![0].email}'
// //                 .toUpperCase(),
// //             style: pw.TextStyle(fontSize: 8)),
// //         pw.Text(companyInfoList.companyInfoModel![0].message!.toUpperCase(),
// //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.0)),
// //         // pw.Text(
// //         //   'VAT number: C0006548660',
// //         // ),
// //       ],
// //     ),

// //     pw.SizedBox(
// //       height: 90.0,
// //     ),
// //   ]);
// // }

// // // Future<Uint8List> generatePdf(PdfPageFormat format, pdf) async {
// // //   // final pdf = pw.Document();

// // //   // pdf.addPage(
// // //   //   pw.Page(
// // //   //     pageFormat: format,
// // //   //     build: (context) => pw.Placeholder(),
// // //   //   ),
// // //   // );

// // //   return pdf.save();
// // // }
