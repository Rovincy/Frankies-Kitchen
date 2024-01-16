// import 'dart:convert';
// import 'dart:html' as webFile;
// import 'dart:html';
// import 'dart:io';

// // import 'package:file_picker/file_picker.dart' as webPicker;
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:frankies_kitchen/api/processedOrdersApi.dart';
// import 'package:frankies_kitchen/model/locationModel.dart';
// import 'package:frankies_kitchen/model/orderListModel.dart';
// import 'package:frankies_kitchen/providers/countProvider.dart';
// import 'package:frankies_kitchen/providers/fiterLocationProvider.dart';
// import 'package:frankies_kitchen/view/anotherPrint.dart';
// import 'package:frankies_kitchen/view/kitchenScreen.dart';
// import 'package:frankies_kitchen/view/printinh.dart';
// import 'package:frankies_kitchen/view/splashscreen.dart';
// import 'package:frankies_kitchen/view/testPrint.dart';
// import 'package:frankies_kitchen/widget/backgroundColor.dart';
// import 'package:frankies_kitchen/widget/comment.dart';
// import 'package:frankies_kitchen/widget/networkInfoPlus.dart';
// import 'package:frankies_kitchen/widget/newPrintTest.dart';
// import 'package:frankies_kitchen/widget/testPrint.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import '../api/incomingOrdersApi.dart';
// import '../model/incomingOrdersModel.dart';

// class IncomingOrderPage extends StatefulWidget {
//   final int? kitchenLocationId;
//    const IncomingOrderPage({this.kitchenLocationId ,super.key});

//   @override
//   State<IncomingOrderPage> createState() => _IncomingOrderPageState();
// }

// class _IncomingOrderPageState extends State<IncomingOrderPage> {
//   bool rebuildSCreen = false;
//   TextEditingController _count = TextEditingController();
//   TextEditingController _search = TextEditingController();
//   List test = [];
//                                     var count = 0;
  
// //   void readFileSync(path) {
// //   String contents = new File(path).readAsStringSync();
// //   print(contents);
// // }
// // void writeToFile() async {
// //   final filename = 'C:/Users/SipConsult/3D Objects/kitchen.txt';
// //   var file = await File(filename).writeAsString('Star TSP143IIIBI Cutter\nFrom Flutter\nPrinter Test');
// //   // Do something with the file.
// //   readFileSync(filename);
// // }


// //   Future<void> saveFile(String content) async {
// //   final result = await FilePicker.platform.saveFile(
// //     fileName: 'example.txt',
// //     initialDirectory: '/',
// //     allowedExtensions: ['txt'],
// //   );
// //   if (result != null) {
// //     final file = File(result);
// //     await file.writeAsString('content\nTest\nTest');
// //   }
// // }
// void writeFile(String content, String filename) {
//   final bytes = utf8.encode(content);
//   final blob = Blob([bytes]);
//   final url = Url.createObjectUrlFromBlob(blob);
//   final anchor = new AnchorElement(href: url)
//     ..setAttribute('download', filename)
//     ..click(); // This will download the file
//   Url.revokeObjectUrl(url);
// }


//   @override
//   Widget build(BuildContext context) {
//   // _count.text='0';
//   // for (var element in orderlist.incomingOrders!) {
    
//   // }
//   // _count.text = orderlist.incomingOrders!.length.toString();
//   int val = 0;
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(),
//         elevation: 0.0,
//         backgroundColor: backgroundColor(),
//         title: Text('Incoming orders'),
//         // title: Text('Incoming orders (${context.watch<Count>().count})'),
//         actions: [
//           Container(
//             margin: const EdgeInsets.all(5),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             alignment: Alignment.center,
//             width: 250.0,
//             height: 10.0,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.7),
//               borderRadius: BorderRadius.circular(40.0)
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.search,color: Colors.white),
//                 Container(
//                   width: 200.0,
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: TextFormField(
//                     controller: _search,
//                     onChanged: (value){
//                       setState(() {
                        
//                       });
//                       // (context as Element).markNeedsBuild();
//                       // (context as Element).markNeedsBuild();
//                     },
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Search here'
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 20.0,)
//         ],
//       ),
//       body: Container(
//           width: Get.width,
//           height: Get.height,
//           child: FutureBuilder(
//             future: getOrders(context,widget.kitchenLocationId),
//             builder: (context, AsyncSnapshot snapshot) {
//               // _count.text = orderlist.incomingOrders!.where((element) => element.)
//               _count.text = orderlist.incomingOrders!.length.toString();
//               // print(_count.text);
//               int test1 = 0;
//               for (var element in orderlist.incomingOrders!) {
//                 for (var element1 in element.orderItems.where((element1)=>element1.name!.toString().toLowerCase().contains(_search.text.toLowerCase())||element.orderNumber!.toLowerCase().contains(_search.text.toLowerCase())).toList()) {
//                   // print('name: ${element1.name}');
//                   // print(element.orderItems.length);
//                   test1++;
//                 }
//               }
//               // print('test1: $test1');
//               val = test1;
//               // // _count.text = test1.toString();
//               // context.read<Count>().setCount(test1);
//               // (context as Element).markNeedsBuild();
//               return orderlist.incomingOrders!.isEmpty
//                   ? Center(
//                       child: Text("No new order",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey[500],
//                               fontSize: 20)))
//                   : ListView(
//                       children: [
//                         for (var element in orderlist.incomingOrders!)
//                           Builder(builder: (context) {
//                             // print(element.orderNumber);
//                             return Column(
//                               children: [
//                                 for (var order in element.orderItems.where((element1)=>element1.name!.toString().toLowerCase().contains(_search.text.toLowerCase())||element.orderNumber!.toLowerCase().contains(_search.text.toLowerCase())).toList())
//                                   Builder(builder: (context) {
//                                     // context.read<Count>().setCount(test1);
//                                     return SizedBox(
//                                       height: 50,
//                                       child: Card(
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                             Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}'),
//                                               Text('${element.orderNumber}'),
//                                               // Text('${element.orderNumber}'),
//                                               Text('x${order.quantity}'),
//                                               Text('${order.name}'),
//                                               Text(timeago.format(
//                                                   DateTime.parse(
//                                                       element.orderDate!))),
//                                             order.comment==null||order.comment==''?Container():IconButton(onPressed: (){
//                                                 comment(context, order.comment);
//                                               }, icon: const Icon(Icons.comment)),
//                                               MaterialButton(
//                                                   onPressed: () async{
//                                                     // print(printerName);
//                                                     if(printerName==null||printerName==""){
//                                                       Navigator.pop(context);
//                                                       var snackBar = const SnackBar(content: Text("Please select a default printer before proceeding."));
//                                                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                                                     }else{
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               const KitchScreen()),
                                                              
//                                                     );
//                                                     processedOrder(
//                                                         '${element.orderNumber}',
//                                                         '${order.id}',
//                                                         userId!);
//                                                     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//                                                     String? printerName = sharedPreferences.getString('printerName');
//                                                     final content = '$printerName\n${element.orderNumber}\n${order.name}\nx${order.quantity}';
//                                                     const filename = 'kitchen.txt';
//                                                     writeFile(content, filename);
//                                                     }
//                                                   },
//                                                   color: Colors.orange,
//                                                   child: const Text(
//                                                     'Process Order',
//                                                     style: TextStyle(
//                                                         color: Colors.white),
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   })
//                               ],
//                             );
//                           })
//                       ],
//                     );
//             },
//           )),
//     );
//   }
// }
