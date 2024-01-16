// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:frankies_kitchen/api/completedOrdersApi.dart';
// import 'package:frankies_kitchen/api/getKitchenApi.dart';
// import 'package:frankies_kitchen/api/incomingOrdersApi.dart';
// import 'package:frankies_kitchen/api/printerAPI.dart';
// import 'package:frankies_kitchen/api/processingOrdersApi.dart';
// import 'package:frankies_kitchen/model/kitchenModel.dart';
// import 'package:frankies_kitchen/model/locationModel.dart';
// import 'package:frankies_kitchen/model/orderListModel.dart';
// import 'package:frankies_kitchen/model/processingOrderList.dart';
// import 'package:frankies_kitchen/providers/fiterLocationProvider.dart';
// import 'package:frankies_kitchen/view/incomingOrderPage.dart';
// import 'package:frankies_kitchen/view/printerSelectionPage.dart';
// import 'package:frankies_kitchen/view/processingNew.dart';
// import 'package:frankies_kitchen/view/processingOrderPage.dart';
// import 'package:frankies_kitchen/view/splashscreen.dart';
// import 'package:frankies_kitchen/widget/backgroundColor.dart';
// import 'package:frankies_kitchen/model/companyModel.dart';
// import 'package:frankies_kitchen/widget/comment.dart';
// import 'package:frankies_kitchen/widget/printerSelectorDialog.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import 'newIncomingOrderPage.dart';

// class KitchScreen extends StatefulWidget {
//   const KitchScreen({super.key});

//   @override
//   State<KitchScreen> createState() => _KitchScreenState();
// }

// class _KitchScreenState extends State<KitchScreen> {
//   // late Future<List<KitchenModel>> kitchens;
//   // List<String> locations = [];
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   kitchens = getKitchens();
//   // }
//   TextEditingController _search = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: ()async{
//             final SharedPreferences sharedPreferences =
//             await SharedPreferences.getInstance();
//             sharedPreferences.clear();
//             Get.offAllNamed('/Login');
//         },icon:const Icon(Icons.logout)),
//         elevation: 0.0,
//         backgroundColor: backgroundColor(),
//         // title: const Text(
//         //   'Kitchen',
//         //   style: TextStyle(fontWeight: FontWeight.bold),
//         // ),
//         // title: 
//         //   Container(
//         //       width: Get.width * 0.15,
//         //       height: Get.height * 0.05,
//         //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         //       decoration: const BoxDecoration(
//         //         color: Color.fromARGB(255, 242, 242, 242),
//         //         borderRadius: BorderRadius.all(
//         //           Radius.circular(8),
//         //         ),
//         //       ),
//         //       child: FutureBuilder(
//         //         future: getKitchens(),
//         //         builder: (context, AsyncSnapshot snapshot) {
//         //           // if (snapshot.hasData) {
//         //             // for (var element in snapshot.data) {
//         //             //   locations.add(element.name);
//         //             // }
//         //             return ListView(
//         //               children: [
//         //                 DropdownSearch<String>(
//         //                   mode: Mode.MENU,
//         //                   showSelectedItems: true,
//         //                   items: kitchenList.kitchenModel!
//         //                 .map((e) => e.name!)
//         //                 .toList(),
//         //                   dropdownSearchDecoration: InputDecoration(
//         //                     labelText: '${context.read<FilterLocation>().locationId==null?"Location": kitchenList.kitchenModel![kitchenList.kitchenModel!.indexWhere((element) => element.id==context.read<FilterLocation>().locationId!)].name}',
//         //                     hintText: "Please select your kitchen below",
//         //                   ),
//         //                   // popupItemDisabled: isItemDisabled,
//         //                   onChanged: (value){
//         //                     // print(value);
//         //                     for (var element in kitchenList.kitchenModel!
//         //                         .where((element) => element.name.toString().toLowerCase() == value.toString().toLowerCase())) {
//         //                           // print(element.id);
//         //                        context.read<FilterLocation>().setId(element.id!);
//         //                     }
//         //                     // setState(() async {
//         //                     // });
//         //                     // setState(() {
//         //                       (context as Element).markNeedsBuild();
//         //                     // });
//         //                   },
//         //                   //selectedItem: "",
//         //                   showSearchBox: true,
//         //                   searchFieldProps: TextFieldProps(
//         //                     cursorColor: Colors.blue,
//         //                   ),
//         //                 ),
//         //               ],
//         //             );
//         //           // } else if (snapshot.hasError) {
//         //           //   return Text(snapshot.error.toString());
//         //           // } else {
//         //           //   return Center(child: CircularProgressIndicator());
//         //           // }
//         //         },
//         //       )),
//         // actions: [
//         //   IconButton(onPressed: (){
//         //     printerSelectorDialog(context);
//         //     // Get.to(()=>const PrinterSelectionPage());
//         //   }, icon: const Icon(Icons.print)),
//         // ],
//         //         actions: [
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
//       body: /*context.watch<FilterLocation>().locationId==null?Center(
//               child: Text("Please select a kitchen",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[500],
//                       fontSize: 20))):*/  
//                       Container(
//           width: Get.width,
//           height: Get.height,
//           child: FutureBuilder(
//             future: getProcessingOrders(
//                 context),
//                 // context, context.watch<FilterLocation>().locationId),
//             builder: (context, AsyncSnapshot snapshot) {
//               // _count.text = orderlist.incomingOrders!.where((element) => element.)
//               // _count.text = orderlist.incomingOrders!.length.toString();
//               // print(_count.text);
//               // int test1 = 0;
//               // for (var element in processingorderlist.processingOrders!) {
//               //   for (var element1 in element.orderItems.where((element1)=>element1.name!.toString().toLowerCase().contains(_search.text.toLowerCase())||element.orderNumber!.toLowerCase().contains(_search.text.toLowerCase())||element.orderItems.isNotEmpty).toList()) {
//               //     // print('name: ${element1.name}');
//               //     // print(element.orderItems.length);
//               //     test1++;
//               //   }
//               // }
//               // print('test1: $test1');
//               // val = test1;
//               // // _count.text = test1.toString();
//               // context.read<Count>().setCount(test1);
//               // (context as Element).markNeedsBuild();
//               return processingorderlist.processingOrders!.isEmpty
//                   ? Center(
//                       child: Text("No new order",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey[500],
//                               fontSize: 20)))
//                   : ListView(
//                       children: [
//                         for (var element in processingorderlist.processingOrders!
//                         //.where((element) => element.orderNumber!.toLowerCase().contains(_search.text)||element.orderItems[element.orderItems.indexWhere((element) => element.name!.toLowerCase().contains(_search.text.toLowerCase()))].name!.contains(_search.text.toLowerCase()))
//                         /*.where(
//                           (element) => element.locationId==locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.name!.toLowerCase().contains(_search.text.toLowerCase()))].id||
//                           element.orderNumber!.contains(_search.text.toUpperCase()))*/)
//                           Builder(builder: (context) {
//                             // print(element.orderNumber);
//                             // processingorderlist.processingOrders!.sort((a, b) =>DateTime.parse(b.processingTime!).compareTo(DateTime.parse(a.processingTime!)));

//                             List<int> productList = [];
//                             return element.orderItems.isEmpty?Container():Card(
//                               child: Container(
//                                 color:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="TAKE-AWAY"
//                                 ?Colors.blue:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="DELIVERY"
//                                 ?Colors.red:locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name!.toUpperCase()=="RESTAURANT"?Colors.orange.withOpacity(0.5):Colors.teal,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                       Text('${element.orderNumber}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                       Column(
//                                         children: [
//                                           for (var order in element.orderItems)//.where((element1)=>element1.name!.toString().toLowerCase().contains(_search.text.toLowerCase())||element.orderNumber!.toLowerCase().contains(_search.text.toLowerCase())).toList())
//                                         Builder(builder: (context) {
//                                           // context.read<Count>().setCount(test1);
//                                           productList.add(order.id!);
//                                           return Container(
//                                             // width: Get.width/4,
//                                             child: Card(
//                                               child: Padding(
//                                                 padding: const EdgeInsets.all(8.0),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                   // Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}'),
//                                                     // Text('${element.orderNumber}'),
//                                                     // Text('${element.orderNumber}'),
//                                                     // Spacer(),
//                                                     const SizedBox(width: 40,),
//                                                     Text('${order.name}'),
//                                                     const SizedBox(width: 40,),
//                                                     // Spacer(),
//                                                     Text('x${order.quantity}'),
//                                                     const SizedBox(width: 40,),
//                                                     // Spacer(),
//                                                     // Text(timeago.format(
//                                                     //     DateTime.parse(
//                                                     //         element.orderDate!))),
//                                                   order.comment==null||order.comment==''?Container():IconButton(onPressed: (){
//                                                       comment(context, order.comment);
//                                                     }, icon: const Icon(Icons.comment)),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         }),
                                    
//                                         ],
//                                       ),
//                                       Text(timeago.format(
//                                                         DateTime.parse(element.processingTime!)),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                       MaterialButton(
//                                                         onPressed: element.isPrinted==1?(){}:() async{
//                                                           await printerAPI(context, element.orderNumber);
//                                                           // element.isPrinted=1;
//                                                           // (context as Element).markNeedsBuild();
//                                                           // processingorderlist.processingOrders!.w
//                                                         },
//                                                         color: element.isPrinted==1?Colors.grey:Colors.green,
//                                                         child: const Text(
//                                                           'Print',
//                                                           style: TextStyle(
//                                                               color: Colors.white),
//                                                         )),
//                                       MaterialButton(
//                                                         onPressed:() async{
//                                                           Navigator.push(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                                 builder: (context) =>
//                                                                     const KitchScreen()),
                                                                    
//                                                           );
//                                                           List<String> itemsName = [];
//                                                           List itemsQuantity = [];
//                                                           List itemsComment = [];
//                                                           for (var element in element.orderItems) {
//                                                             itemsName.add("${element.name!}"+"\n"+"Quantity: ${element.quantity}"+"\n"+"Comment: ${element.comment==null?'':element.comment!}\n");
//                                                             // itemsQuantity.add(element.quantity);
//                                                             // itemsComment.add(element.comment);
//                                                           }
//                                                           // print(itemsName.toList());
//                                                           // print(itemsQuantity.toList());
//                                                           // print(itemsComment.toList());
//                                                           // String jsonString = itemsName.join('\n');
//                                                           for (int i=0;i<productList.length;i++) {
//                                                           completedOrder(
//                                                               '${element.orderNumber}',
//                                                               '${productList[i]}',
//                                                               userId!);
//                                                           }
//                                                           itemsName.clear();
//                                                           itemsQuantity.clear();
//                                                           itemsComment.clear();
//                                                         },
//                                                         color: Colors.orange,
//                                                         child: const Text(
//                                                           'Complete Order',
//                                                           style: TextStyle(
//                                                               color: Colors.white),
//                                                         )),
//                                       // for (var order in element.orderItems.where((element1)=>element1.name!.toString().toLowerCase().contains(_search.text.toLowerCase())||element.orderNumber!.toLowerCase().contains(_search.text.toLowerCase())).toList())
//                                       //   Builder(builder: (context) {
//                                       //     // context.read<Count>().setCount(test1);
//                                       //     return SizedBox(
//                                       //       height: 50,
//                                       //       child: Card(
//                                       //         child: Padding(
//                                       //           padding: const EdgeInsets.all(8.0),
//                                       //           child: Row(
//                                       //             mainAxisAlignment:
//                                       //                 MainAxisAlignment.spaceBetween,
//                                       //             children: [
//                                       //             Text('${locationList.locationModel![locationList.locationModel!.indexWhere((value)=>value.id==element.locationId)].name}'),
//                                       //               Text('${element.orderNumber}'),
//                                       //               // Text('${element.orderNumber}'),
//                                       //               Text('x${order.quantity}'),
//                                       //               Text('${order.name}'),
//                                       //               Text(timeago.format(
//                                       //                   DateTime.parse(
//                                       //                       element.orderDate!))),
//                                       //             order.comment==null||order.comment==''?Container():IconButton(onPressed: (){
//                                       //                 comment(context, order.comment);
//                                       //               }, icon: const Icon(Icons.comment)),
//                                       //               MaterialButton(
//                                       //                   onPressed: () async{
//                                       //                     Navigator.push(
//                                       //                       context,
//                                       //                       MaterialPageRoute(
//                                       //                           builder: (context) =>
//                                       //                               const KitchScreen()),
                                                                    
//                                       //                     );
//                                       //                     ProcessingOrderPageedOrder(
//                                       //                         '${element.orderNumber}',
//                                       //                         '${order.id}',
//                                       //                         2);
//                                       //                     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//                                       //                     String? printerName = sharedPreferences.getString('printerName');
//                                       //                     final content = '$printerName\n${element.orderNumber}\n${order.name}\nx${order.quantity}';
//                                       //                     const filename = 'kitchen.txt';
//                                       //                     writeFile(content, filename);
                                                            
                                                            
//                                       //                     // setState(() {
//                                       //                     //   rebuildSCreen = true;
//                                       //                     // });
//                                       //                     // mainPrint();
//                                       //                     // Get.to(()=>const Printing('Test'));
//                                       //                     // printReceipt(context);
//                                       //                     // printPdf();
//                                       //                     // testNetworkInfo();
//                                       //                     // testTicket();
//                                       //                   },
//                                       //                   color: Colors.orange,
//                                       //                   child: const Text(
//                                       //                     'ProcessingOrderPage Order',
//                                       //                     style: TextStyle(
//                                       //                         color: Colors.white),
//                                       //                   )),
//                                       //             ],
//                                       //           ),
//                                       //         ),
//                                       //       ),
//                                       //     );
//                                       //   })
                                    
//                                     ],
//                                   ),
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
