// import 'dart:convert';
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:frankies_kitchen/api/processingOrersApi.dart';
// import 'package:frankies_kitchen/api/processingTestApi.dart';
// import 'package:frankies_kitchen/model/locationModel.dart';
// import 'package:frankies_kitchen/model/processingOrderList.dart';
// import 'package:frankies_kitchen/model/testModel.dart';
// import 'package:frankies_kitchen/widget/backgroundColor.dart';
// import 'package:frankies_kitchen/widget/comment.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import '../api/completedOrdersApi.dart';
// import '../api/processedOrdersApi.dart';
// import '../providers/fiterLocationProvider.dart';
// import 'kitchenScreen.dart';

// class ProcessingNewPage extends StatefulWidget {
//   final int? kitchenLocationId;
//   ProcessingNewPage({this.kitchenLocationId, super.key});

//   @override
//   State<ProcessingNewPage> createState() => _ProcessingNewPageState();
// }

// class _ProcessingNewPageState extends State<ProcessingNewPage> {
//   // bool rebuildSCreen = false;
//   TextEditingController _search = TextEditingController();

//   void writeFile(String content, String filename) {
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
//     int count = 0;
//     // for (var data in processingorderlist.processingOrders!) {
//     //   print(data.orderNumber);
//     // }
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(),
//         elevation: 0.0,
//         backgroundColor: backgroundColor(),
//         title: const Text('Processing orders'),
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
//             future: processingItemsAPI(
//                 context, widget.kitchenLocationId),
//             builder: (context, AsyncSnapshot snapshot) {
//                             itemList.itemModel!.sort((a, b) => a.isProcessedAt!.compareTo(b.isProcessedAt!));
//               return itemList.itemModel!.isEmpty
//                   ? Center(
//                       child: Text("No new order",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey[500],
//                               fontSize: 20)))
//                   : ListView(
//                       children: [
//                         for (var element
//                             in itemList.itemModel!.where((element1)=>element1.name!.toString().toLowerCase().contains(_search.text.toLowerCase())||element1.orderNumber!.toLowerCase().contains(_search.text.toLowerCase())).toList())
//                           Builder(builder: (context) {
//                             // var newList = element.orderItems.sort((a, b) => a.isProcessedAt!.compareTo(b.isProcessedAt!));
//                             // itemList.itemModel!.sort((a, b) => a.isProcessedAt!.compareTo(b.isProcessedAt!));
//                             return Card(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}'),
//                                             Text('${element.orderNumber}'),
//                                             Text('${element.name}'),
//                                             Text('x${element.quantity}'),
//                                             Text(timeago.format(
//                                                 element.isProcessedAt!).toString()),
//                                             // Text(timeago.format(DateTime.parse(
//                                             //     element.orderDate!))),
//                                             element.comment==null||element.comment==''?Container():IconButton(onPressed: (){
//                                                 comment(context, element.comment);
//                                               }, icon: const Icon(Icons.comment)),
//                                             MaterialButton(
//                                                 onPressed: () async {
//                                                   await completedOrder(
//                                                       '${element.orderNumber}',
//                                                       '${element.id}',
//                                                       2);
//                                                     //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//                                                     // String? printerName = sharedPreferences.getString('printerName');
//                                                     // final content = '${element.orderNumber}\nx${element.name}\n${element.quantity}';
//                                                     // const filename = 'kitchen.txt';
//                                                     // writeFile(content, filename);
//                                                   // setState(() {
//                                                   //   rebuildSCreen = true;
//                                                   // });
//                                                   Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             const KitchScreen()),
//                                                   );
//                                                 },
//                                                 color: Colors.green,
//                                                 child: const Text(
//                                                   'Complete Order',
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 )),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                           })
//                       ],
//                     );
//             },
//           )),
//     );
//   }
// }
