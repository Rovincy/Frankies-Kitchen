// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';
// import 'dart:html' as webFile;
// import 'dart:html';
// import 'dart:io';

// // import 'package:file_picker/file_picker.dart' as webPicker;
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:frankies_kitchen/api/completedOrdersApi.dart';
// import 'package:frankies_kitchen/api/incomingOrdersApi.dart';
// import 'package:frankies_kitchen/api/printerAPI.dart';
// import 'package:frankies_kitchen/api/processedOrdersApi.dart';
// import 'package:frankies_kitchen/api/processingOrdersApi.dart';
// import 'package:frankies_kitchen/model/locationModel.dart';
// // import 'package:frankies_kitchen/model/incomingOrderListModel.dart';
// import 'package:frankies_kitchen/model/newIncomingOrderModel.dart';
// import 'package:frankies_kitchen/model/newProcessingOrderModel.dart';
// import 'package:frankies_kitchen/providers/countProvider.dart';
// import 'package:frankies_kitchen/providers/fiterLocationProvider.dart';
// import 'package:frankies_kitchen/view/anotherPrint.dart';
// import 'package:frankies_kitchen/view/kitchenScreen.dart';
// import 'package:frankies_kitchen/view/printinh.dart';
// import 'package:frankies_kitchen/view/splashscreen.dart';
// import 'package:frankies_kitchen/view/testPrint.dart';
// import 'package:frankies_kitchen/widget/backgroundColor.dart';
// import 'package:frankies_kitchen/widget/comment.dart';
// import 'package:frankies_kitchen/widget/myloadingindicator.dart';
// import 'package:frankies_kitchen/widget/networkInfoPlus.dart';
// import 'package:frankies_kitchen/widget/newPrintTest.dart';
// import 'package:frankies_kitchen/widget/testPrint.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timeago/timeago.dart' as timeago;
// // import '../api/incomingOrderModelApi.dart';
// // import '../model/incomingOrderModelModel.dart';

// class ProcessingOrderPage extends StatefulWidget {
//   final int? kitchenLocationId;
//    const ProcessingOrderPage({this.kitchenLocationId ,super.key});

//   @override
//   State<ProcessingOrderPage> createState() => _ProcessingOrderPageState();
// }

// class _ProcessingOrderPageState extends State<ProcessingOrderPage> {
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


// // void writeFile(String content, String filename) {
// //   final bytes = utf8.encode(content);
// //   final blob = Blob([bytes]);
// //   final url = Url.createObjectUrlFromBlob(blob);
// //   final anchor = new AnchorElement(href: url)
// //     ..setAttribute('download', filename)
// //     ..click(); // This will download the file
// //   Url.revokeObjectUrl(url);
// // }

// bool _status=false;


//   @override
//   Widget build(BuildContext context) {
//   // _count.text='0';
//   // for (var element in incomingOrderList.incomingOrderModel!) {
    
//   // }
//   // _count.text = incomingOrderList.incomingOrderModel!.length.toString();
//   int val = 0;
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(),
//         elevation: 0.0,
//         backgroundColor: backgroundColor(),
//         title: const Text('Incoming orders'),
//         // title: Text('Incoming orders (${context.watch<Count>().count})'),
//         // actions: [
//         //   Container(
//         //     margin: const EdgeInsets.all(5),
//         //     padding: const EdgeInsets.symmetric(horizontal: 10),
//         //     alignment: Alignment.center,
//         //     width: 250.0,
//         //     height: 10.0,
//         //     decoration: BoxDecoration(
//         //       color: Colors.white.withOpacity(0.7),
//         //       borderRadius: BorderRadius.circular(40.0)
//         //     ),
//         //     child: Row(
//         //       children: [
//         //         const Icon(Icons.search,color: Colors.white),
//         //         Container(
//         //           width: 200.0,
//         //           padding: const EdgeInsets.symmetric(horizontal: 10),
//         //           child: TextFormField(
//         //             controller: _search,
//         //             onChanged: (value){
//         //               setState(() {
                        
//         //               });
//         //               // (context as Element).markNeedsBuild();
//         //               // (context as Element).markNeedsBuild();
//         //             },
//         //             decoration: const InputDecoration(
//         //               border: InputBorder.none,
//         //               hintText: 'Search here'
//         //             ),
//         //           ),
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         //   const SizedBox(width: 20.0,)
//         // ],
    
//       ),
//       body: Container(
//           width: Get.width*0.49,
//           height: Get.height,
//           child: FutureBuilder(
//             future: getProcessingOrders(
//                 context)(context),
//             builder: (context, AsyncSnapshot snapshot) {
              
//               return processingOrderList.processingOrderModel!.isEmpty
//                   ? Center(
//                       child: Text("No new order",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey[500],
//                               fontSize: 20)))
//                   : ListView(
//                       children: [
//                         for (var element in processingOrderList.processingOrderModel!..sort((a, b) =>
//             DateTime.parse(a.processingTime!)
//                 .compareTo(DateTime.parse(b.processingTime!))))
//                           Builder(builder: (context) {
//                             // print(element.orderNumber);
//                             List<int> productList = [];
//                             return Card(
//                               color:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="TAKE-AWAY"
//                                 ?Colors.blue:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="DELIVERY"
//                                 ?Colors.red:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="RESTAURANT"?Colors.orange.withOpacity(0.5):Colors.teal,
//                                child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                     Text('${element.orderNumber}',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 250,
//                                       child: Column(
//                                         children: [
//                                           for (var order in element.processingOrderItems)
//                                         Builder(builder: (context) {
//                                           // context.read<Count>().setCount(test1);
//                                           productList.add(order.id!);
//                                           return Card(
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                 // Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}'),
//                                                   // Text('${element.orderNumber}'),
//                                                   // Text('${element.orderNumber}'),
//                                                   // Spacer(),
//                                                   // const SizedBox(width: 40,),
//                                                   SizedBox(width: 100,child: Text('${order.name}',maxLines: 3,)),
//                                                   const SizedBox(width: 10,),
//                                                   // Spacer(),
//                                                   Text('x${order.quantity}'),
//                                                   const SizedBox(width: 20,),
//                                                   // Spacer(),
//                                                   // Text(timeago.format(
//                                                   //     DateTime.parse(
//                                                   //         element.orderDate!))),
//                                                 order.comment==null||order.comment==''?Container():IconButton(onPressed: (){
//                                                     comment(context, order.comment);
//                                                   }, icon: const Icon(Icons.comment)),
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         }),
                                                                      
//                                         ],
//                                       ),
//                                     ),
//                                     Text(timeago.format(
//                                                       DateTime.parse(
//                                                           element.orderDate!)),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                   //  _status==true?Container():
//                                   MaterialButton(
//                                                         onPressed:() async{
//                                                           myLoadingIndicator(context);
//                                                           // Navigator.push(
//                                                           //   context,
//                                                           //   MaterialPageRoute(
//                                                           //       builder: (context) =>
//                                                           //           const KitchScreen()),
                                                                    
//                                                           // );
//                                                           // List<String> itemsName = [];
//                                                           // List itemsQuantity = [];
//                                                           // List itemsComment = [];
//                                                           // for (var element in element.orderItems) {
//                                                           //   itemsName.add("${element.name!}"+"\n"+"Quantity: ${element.quantity}"+"\n"+"Comment: ${element.comment==null?'':element.comment!}\n");
//                                                           //  }
//                                                           // print("Completed: ${element.id!}");
//                                                           for (int i=0;i<productList.length;i++) {
//                                                           completedOrder(
//                                                               '${element.orderNumber}',
//                                                               element.id!,
//                                                               '${productList[i]}',
//                                                               userId!);
//                                                           }
//                                                           // itemsName.clear();
//                                                           // itemsQuantity.clear();
//                                                           // itemsComment.clear();
//                                                           (context as Element).markNeedsBuild();
//                                                           Navigator.pop(context);
//                                                         },
//                                                         color: Colors.orange,
//                                                         child: const Text(
//                                                           'Complete Order',
//                                                           style: TextStyle(
//                                                               color: Colors.white),
//                                                         )),
//                                     // for (var order in element.orderItems.where((element1)=>element1.name!.toString().toLowerCase().contains(_search.text.toLowerCase())||element.orderNumber!.toLowerCase().contains(_search.text.toLowerCase())).toList())
//                                     //   Builder(builder: (context) {
//                                     //     // context.read<Count>().setCount(test1);
//                                     //     return SizedBox(
//                                     //       height: 50,
//                                     //       child: Card(
//                                     //         child: Padding(
//                                     //           padding: const EdgeInsets.all(8.0),
//                                     //           child: Row(
//                                     //             mainAxisAlignment:
//                                     //                 MainAxisAlignment.spaceBetween,
//                                     //             children: [
//                                     //             Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}'),
//                                     //               Text('${element.orderNumber}'),
//                                     //               // Text('${element.orderNumber}'),
//                                     //               Text('x${order.quantity}'),
//                                     //               Text('${order.name}'),
//                                     //               Text(timeago.format(
//                                     //                   DateTime.parse(
//                                     //                       element.orderDate!))),
//                                     //             order.comment==null||order.comment==''?Container():IconButton(onPressed: (){
//                                     //                 comment(context, order.comment);
//                                     //               }, icon: const Icon(Icons.comment)),
//                                     //               MaterialButton(
//                                     //                   onPressed: () async{
//                                     //                     Navigator.push(
//                                     //                       context,
//                                     //                       MaterialPageRoute(
//                                     //                           builder: (context) =>
//                                     //                               const KitchScreen()),
                                                                  
//                                     //                     );
//                                     //                     processedOrder(
//                                     //                         '${element.orderNumber}',
//                                     //                         '${order.id}',
//                                     //                         2);
//                                     //                     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//                                     //                     String? printerName = sharedPreferences.getString('printerName');
//                                     //                     final content = '$printerName\n${element.orderNumber}\n${order.name}\nx${order.quantity}';
//                                     //                     const filename = 'kitchen.txt';
//                                     //                     writeFile(content, filename);
                                                          
                                                          
//                                     //                     // setState(() {
//                                     //                     //   rebuildSCreen = true;
//                                     //                     // });
//                                     //                     // mainPrint();
//                                     //                     // Get.to(()=>const Printing('Test'));
//                                     //                     // printReceipt(context);
//                                     //                     // printPdf();
//                                     //                     // testNetworkInfo();
//                                     //                     // testTicket();
//                                     //                   },
//                                     //                   color: Colors.orange,
//                                     //                   child: const Text(
//                                     //                     'Process Order',
//                                     //                     style: TextStyle(
//                                     //                         color: Colors.white),
//                                     //                   )),
//                                     //             ],
//                                     //           ),
//                                     //         ),
//                                     //       ),
//                                     //     );
//                                     //   })
                                  
//                                   ],
//                                 ),
//                               ),
//                             );
//                           })
//                       ],
//                     );
            
//             },
//           )),
//     );
//   }
// }















// import 'dart:convert';
// import 'dart:html' as webFile;
// import 'dart:html';
// import 'dart:io';

// import 'package:file_picker/file_picker.dart' as webPicker;
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:frankies_kitchen/api/completedOrdersApi.dart';
import 'package:frankies_kitchen/api/processingOrdersApi.dart';
import 'package:frankies_kitchen/model/locationModel.dart';
import 'package:frankies_kitchen/model/newProcessingOrderModel.dart';
import 'package:frankies_kitchen/view/splashscreen.dart';
import 'package:frankies_kitchen/widget/backgroundColor.dart';
import 'package:frankies_kitchen/widget/comment.dart';
import 'package:frankies_kitchen/widget/myloadingindicator.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProcessingOrderPage extends StatefulWidget {
  final int? kitchenLocationId;
   const ProcessingOrderPage({this.kitchenLocationId ,super.key});

  @override
  State<ProcessingOrderPage> createState() => _ProcessingOrderPageState();
}

class _ProcessingOrderPageState extends State<ProcessingOrderPage> {
  bool rebuildSCreen = false;
  // TextEditingController _count = TextEditingController();
  // TextEditingController _search = TextEditingController();
  List test = [];
                                    var count = 0;
  
//   void readFileSync(path) {
//   String contents = new File(path).readAsStringSync();
//   print(contents);
// }
// void writeToFile() async {
//   final filename = 'C:/Users/SipConsult/3D Objects/kitchen.txt';
//   var file = await File(filename).writeAsString('Star TSP143IIIBI Cutter\nFrom Flutter\nPrinter Test');
//   // Do something with the file.
//   readFileSync(filename);
// }


//   Future<void> saveFile(String content) async {
//   final result = await FilePicker.platform.saveFile(
//     fileName: 'example.txt',
//     initialDirectory: '/',
//     allowedExtensions: ['txt'],
//   );
//   if (result != null) {
//     final file = File(result);
//     await file.writeAsString('content\nTest\nTest');
//   }
// }

// void writeFile(String content, String filename) {
//   final bytes = utf8.encode(content);
//   final blob = Blob([bytes]);
//   final url = Url.createObjectUrlFromBlob(blob);
//   final anchor = new AnchorElement(href: url)
//     ..setAttribute('download', filename)
//     ..click(); // This will download the file
//   Url.revokeObjectUrl(url);
// }


  @override
  Widget build(BuildContext context) {
  // _count.text='0';
  // for (var element in orderlist.incomingOrders!) {
    
  // }
  // _count.text = orderlist.incomingOrders!.length.toString();
  // int val = 0;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0.0,
        backgroundColor: backgroundColor(),
        title: const Text('Processing orders'),
        // title: Text('Incoming orders (${context.watch<Count>().count})'),
        // actions: [
        //   Container(
        //     margin: const EdgeInsets.all(5),
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     alignment: Alignment.center,
        //     width: 250.0,
        //     height: 10.0,
        //     decoration: BoxDecoration(
        //       color: Colors.white.withOpacity(0.7),
        //       borderRadius: BorderRadius.circular(40.0)
        //     ),
        //     child: Row(
        //       children: [
        //         const Icon(Icons.search,color: Colors.white),
        //         Container(
        //           width: 200.0,
        //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //           child: TextFormField(
        //             controller: _search,
        //             onChanged: (value){
        //               setState(() {
                        
        //               });
        //               // (context as Element).markNeedsBuild();
        //               // (context as Element).markNeedsBuild();
        //             },
        //             decoration: const InputDecoration(
        //               border: InputBorder.none,
        //               hintText: 'Search here'
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const SizedBox(width: 20.0,)
        // ],
     
      ),
      body: Container(
          width: Get.width*0.49,
          height: Get.height,
          child: FutureBuilder(
            future: getProcessingOrders(
            // future: getOrders(
                context),
            builder: (context, AsyncSnapshot snapshot) {
              return processingOrderList.processingOrderModel!.isEmpty
                  ? Center(
                      child: Text("No new order",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[500],
                              fontSize: 20)))
                  : ListView(
                      children: [
                        for (var element in processingOrderList.processingOrderModel!..sort((a, b) =>
            DateTime.parse(a.processingTime!)
                .compareTo(DateTime.parse(b.processingTime!))))
                          Builder(builder: (context) {
                            // print(element.orderNumber);
                            // print(element.processingTime);
                            // print(timeago.format(
                            //                             DateTime.parse(element.processingTime!)));
                            List<int> productList = [];
                            return element.processingOrderItems.isEmpty?Container():Card(
                              child: Container(
                                color:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="TAKE-AWAY"
                                ?Colors.blue:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="DELIVERY"
                                ?Colors.red:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="RESTAURANT"?Colors.orange[900]:Colors.teal,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      Text('${element.orderNumber}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Column(
                                          children: [
                                            for (var order in element.processingOrderItems)
                                          Builder(builder: (context) {
                                            productList.add(order.id!);
                                            return Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // const SizedBox(width: 40,),
                                                    SizedBox(width: 100,child: Text('${order.name}',maxLines: 3,)),
                                                    const SizedBox(width: 10,),
                                                    Text('x${order.quantity}'),
                                                    const SizedBox(width: 20,),
                                                  order.comment==null||order.comment==''?Container():IconButton(onPressed: (){
                                                      comment(context, order.comment);
                                                    }, icon: const Icon(Icons.comment)),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                                                          
                                          ],
                                        ),
                                      ),
                                      Text(timeago.format(
                                                        DateTime.parse(element.processingTime!)),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      MaterialButton(
                                                        onPressed:() async{
                                                          myLoadingIndicator(context);
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //       builder: (context) =>
                                                          //           const KitchScreen()),
                                                                    
                                                          // );
                                                          // List<String> itemsName = [];
                                                          // List itemsQuantity = [];
                                                          // List itemsComment = [];
                                                          // for (var element in element.orderItems) {
                                                          //   itemsName.add("${element.name!}"+"\n"+"Quantity: ${element.quantity}"+"\n"+"Comment: ${element.comment==null?'':element.comment!}\n");
                                                          //  }
                                                          // print("Completed: ${element.id!}");
                                                          for (int i=0;i<productList.length;i++) {
                                                          completedOrder(
                                                              '${element.orderNumber}',
                                                              element.id!,
                                                              '${productList[i]}',
                                                              userId!);
                                                          }
                                                          // itemsName.clear();
                                                          // itemsQuantity.clear();
                                                          // itemsComment.clear();
                                                          (context as Element).markNeedsBuild();
                                                          Navigator.pop(context);
                                                        },
                                                        color: Colors.orange,
                                                        child: const Text(
                                                          'Complete Order',
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      ],
                    
                    );
            
            },
          )),
    );
  }
}
