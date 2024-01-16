// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:frankie_s/API/getOrders.dart';
// import 'package:frankie_s/Model/ProductModel.dart';
// import 'package:frankie_s/Model/model.dart';
// import 'package:frankie_s/Model/orderModel.dart';
// import 'package:frankie_s/Widget/backgroundColor.dart';
// import 'package:frankie_s/Widget/cartoptions.dart';
// import 'package:frankie_s/Widget/menuoptions.dart';
// import 'package:frankie_s/Widget/orderOption.dart';
// import 'package:frankie_s/Widget/showmeals.dart';
// import 'package:frankie_s/Widget/waitressAndTableDialog.dart';
// import 'package:frankie_s/ui/sharedUI/homepage.dart';
// import 'package:frankie_s/ui/sharedUI/splashscreen.dart';
// import 'package:get/get.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:math' as math;
// import 'package:timeago/timeago.dart' as timeago;

// List<OrderDetails>? details;
// // String? selectedItemTableNumber;
// // String? selectedItemWaitress;
// // String? selectedItemProduct;
// // int? selectedItemQuantity;

// class OrderPage extends StatefulWidget {
//   OrderPage({Key? key}) : super(key: key);

//   @override
//   State<OrderPage> createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> {
//   // final rnd = math.Random();
//   ScrollController _controller = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: MyBackgroundColor().backgroundColor(),
//       appBar: AppBar(
//         backgroundColor: MyBackgroundColor().backgroundColor(),
//         leading: userRole == "Cashier"
//             ? IconButton(
//                 icon: Icon(Icons.logout),
//                 tooltip: "LogOut",
//                 onPressed: () async {
//                   SharedPreferences prefs =
//                       await SharedPreferences.getInstance();
//                   // CartListBloc().emptyCart(foodItem, context)
//                   bloc.emptyCart(MenuOptions().foodItems, context);
//                   prefs.clear();
//                   context.read<Model>().disposeValues();
//                   Get.offAllNamed("/Splashscreen");
//                   // Beamer.of(context).beamToReplacementNamed('/SignIn');
//                 },
//                 color: Colors.white)
//             : Container(),
//         // IconButton(
//         //     onPressed: () {
//         //       // List<FoodItem> foodItems;
//         //       bloc.emptyCart(MenuOptions().foodItems, context);
//         //       // (context as Element).markNeedsBuild();
//         //       context.read<Model>().disposeValues();
//         //       Navigator.pop(context);
//         //     },
//         //     icon: Icon(Icons.arrow_back)),
//         title: Text("Orders (${orderList.orderModel!.length})"),
//         centerTitle: true,
//         toolbarHeight: 70,
//         actions: [
//           userRole == "Cashier"
//               ? Container()
//               : Card(
//                   elevation: 5.0,
//                   child: MaterialButton(
//                     minWidth: 100.0,
//                     // height: 100,
//                     color: Colors.green[600],
//                     onPressed: () {
//                       // waitressAndTableDialog(context);
//                       bloc.emptyCart(MenuOptions().foodItems, context);
//                       context.read<Model>().disposeValues();
//                       Get.to(() => HomePage());
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.add, color: Colors.white, size: 35),
//                         Text("New Order",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 25.0))
//                       ],
//                     ),
//                   ),
//                 ),
//         ],
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             width: context.watch<Model>().customGridCount == 6
//                 ? Get.width
//                 : /*context.watch<Model>().updateOrder
//                       ? Get.width * 0.75
//                       : */
//                 Get.width * 0.7,
//             height: Get.height,
//             // margin: EdgeInsets.only(
//             //   right: 10,
//             // ),
//             padding: EdgeInsets.symmetric(vertical: 10),
//             // decoration: BoxDecoration(border: Border.all()),
//             child: /*context.read<Model>().updateOrder
//                   ? categoryAndItems(context)
//                   : */
//                 orders(context),
//           ),
//           context.watch<Model>().customGridCount == 6
//               ? Container()
//               : orderDetails(context)
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(() {});
//       //   },
//       //   child: Icon(Icons.refresh),
//       //   backgroundColor: MyBackgroundColor().backgroundColor(),
//       // ),
//     );
//   }

//   orderDetails(BuildContext context) {
//     return Container(
//       width: /*context.read<Model>().updateOrder
//           ? Get.width * 0.23
//           : */
//           Get.width * 0.3,
//       height: Get.height,
//       // padding: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(border: Border.all()),
//       child: Column(
//         children: [
//           Container(
//             width: /*context.read<Model>().updateOrder
//                 ? Get.width * 0.2
//                 : */
//                 Get.width * 0.3,
//             height: Get.height * 0.08,
//             color: MyBackgroundColor().backgroundColor(),
//             alignment: Alignment.center,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 Text('${context.watch<Model>().tableNumber}',
//                     style: TextStyle(color: Colors.white)),
//                 Spacer(),
//                 IconButton(
//                     onPressed: () {
//                       context.read<Model>().getNewGridCount(6);
//                       // context.read<Model>().updateClientOrder(false);
//                     },
//                     icon: Icon(
//                       Icons.close,
//                       color: Colors.white,
//                     ))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: Get.height * 0.76,
//             child: /*context.read<Model>().updateOrder
//                 ? MenuOptions().cart(context)
//                 : */
//                 RawScrollbar(
//               thumbColor: Colors.grey,
//               controller: _controller,
//               radius: const Radius.circular(20.0),
//               thickness: 10,
//               child: ListView(
//                 controller: _controller,
//                 children: [
//                   for (var element in details!)
//                     Builder(builder: (context) {
//                       return Container(
//                         // alignment: Alignment.center,
//                         height: Get.height * 0.1,
//                         width: Get.width * 0.3,
//                         child: Card(
//                           elevation: 8.0,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: Container(
//                                   width: 90,
//                                   height: 90,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(5),
//                                       bottomLeft: Radius.circular(5),
//                                     ),
//                                     child: CachedNetworkImage(
//                                       width: 70.0,
//                                       height: 90,
//                                       imageUrl: element.imgPath!,
//                                       progressIndicatorBuilder: (context, url,
//                                               downloadProgress) =>
//                                           CircularProgressIndicator(
//                                               value: downloadProgress.progress),
//                                       errorWidget: (context, url, error) =>
//                                           Image.asset(
//                                         "assets/flashphoto.png",
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 // Image.asset(
//                                 //   "assets/emptyImage.jpg",
//                                 //   // width: 90,
//                                 //   // height: 90,
//                                 //   fit: BoxFit.cover,)
//                               ),
//                               Expanded(
//                                   flex: 3,
//                                   child: Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 5.0),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Container(
//                                           alignment: Alignment.topLeft,
//                                           child: RichText(
//                                             text: TextSpan(
//                                               // Here is the explicit parent TextStyle
//                                               style: new TextStyle(
//                                                 // fontSize: 16.0,
//                                                 color: Colors.black,
//                                                 fontFamily: 'Montserrat',
//                                               ),
//                                               children: <TextSpan>[
//                                                 new TextSpan(text: 'Item: '),
//                                                 new TextSpan(
//                                                     text: element.name!,
//                                                     style: new TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold)),
//                                               ],
//                                             ),
//                                           ),
//                                           // Text(
//                                           //     selectedItemProduct!)
//                                         ),
//                                         Container(
//                                             alignment: Alignment.topLeft,
//                                             child: RichText(
//                                               text: TextSpan(
//                                                 // Here is the explicit parent TextStyle
//                                                 style: new TextStyle(
//                                                   // fontSize: 16.0,
//                                                   color: Colors.black,
//                                                   fontFamily: 'Montserrat',
//                                                 ),
//                                                 children: <TextSpan>[
//                                                   new TextSpan(
//                                                       text: 'Quantity: '),
//                                                   new TextSpan(
//                                                       text:
//                                                           '${element.quantity}',
//                                                       style: new TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                 ],
//                                               ),
//                                             )
//                                             // Text(
//                                             //     '$selectedItemQuantity'),
//                                             ),
//                                         Container(
//                                             alignment: Alignment.topLeft,
//                                             child: RichText(
//                                               text: TextSpan(
//                                                 // Here is the explicit parent TextStyle
//                                                 style: new TextStyle(
//                                                   // fontSize: 16.0,
//                                                   color: Colors.black,
//                                                   fontFamily: 'Montserrat',
//                                                 ),
//                                                 children: <TextSpan>[
//                                                   new TextSpan(text: 'Price: '),
//                                                   new TextSpan(
//                                                       text: '${element.price}',
//                                                       style: new TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                 ],
//                                               ),
//                                             )
//                                             // Text(
//                                             //     '$selectedItemQuantity'),
//                                             ),
//                                         element.comment == ""
//                                             ? Container()
//                                             : Container(
//                                                 alignment: Alignment.topLeft,
//                                                 child: RichText(
//                                                   text: TextSpan(
//                                                     // Here is the explicit parent TextStyle
//                                                     style: new TextStyle(
//                                                       // fontSize: 16.0,
//                                                       color: Colors.black,
//                                                       fontFamily: 'Montserrat',
//                                                     ),
//                                                     children: <TextSpan>[
//                                                       new TextSpan(
//                                                           text: 'Comment: '),
//                                                       new TextSpan(
//                                                           text:
//                                                               element.comment!,
//                                                           style: new TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold)),
//                                                     ],
//                                                   ),
//                                                 )
//                                                 // Text(
//                                                 //     selectedItemComment!)
//                                                 ),
//                                       ],
//                                     ),
//                                   ))
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           /*context.read<Model>().updateOrder
//               ? Container()
//               :*/
//           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             orderOption(context, "Cancel"),
//             orderOption(context, "Modify"),
//             orderOption(context, "Proceed"),
//           ]),
//         ],
//       ),
//     );
//   }

//   orders(BuildContext context) {
//     return FutureBuilder(
//         future: getOrders(context),
//         builder: (context, AsyncSnapshot snapshot) {
//           return orderList.orderModel!.isEmpty
//               ? Center(
//                   child: Text("No new order",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey[500],
//                           fontSize: 20)))
//               : GridView(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: context.watch<Model>().customGridCount,
//                     crossAxisSpacing: 0.0,
//                     mainAxisSpacing: 5.0,
//                     childAspectRatio: 2,
//                   ),
//                   children: [
//                     for (var item in orderList.orderModel!)
//                       Builder(
//                         builder: (context) {
//                           return InkWell(
//                             onTap: () {
//                               // mygridCount = 4;
//                               // (context as Element).markNeedsBuild();
//                               // selectedItemTableNumber = item.tableId;
//                               context
//                                   .read<Model>()
//                                   .selectCustomerTable(item.tableId);
//                               context
//                                   .read<Model>()
//                                   .selectOrderNumber(item.orderId);
//                               // selectedItemWaitress = item.waitressName;
//                               // print("orderId ${item.id}");
//                               context.read<Model>().orderId.text = "${item.id}";
//                               context
//                                   .read<Model>()
//                                   .selectWaitressName(item.waitressName);
//                               context.read<Model>().getOrderBillSplitingStatus(
//                                   item.allowBillSpliting);
//                               // context.read<Model>().orderId.text = item.orderId!;
//                               // selectedItemProduct = item.product;
//                               // selectedItemQuantity = item.quantity;
//                               details = item.orderDetails;
//                               context.read<Model>().getNewGridCount(4);
//                             },
//                             child: Container(
//                               // width: 100.0,
//                               // height: 100,
//                               margin: EdgeInsets.only(right: 8.0, left: 8.0),
//                               // color: Colors.blue,
//                               child: Card(
//                                 elevation: 8.0,
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       height: 35.0,
//                                       color:
//                                           MyBackgroundColor().backgroundColor(),
//                                       // Colors.red[700],
//                                       // getRandomColor(),
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           RichText(
//                                             text: TextSpan(
//                                               // Here is the explicit parent TextStyle
//                                               style: new TextStyle(
//                                                 // fontSize: 16.0,
//                                                 color: Colors.white,
//                                                 fontFamily: 'Montserrat',
//                                               ),
//                                               children: <TextSpan>[
//                                                 // new TextSpan(text: ''),
//                                                 new TextSpan(
//                                                     text: '${item.tableId}',
//                                                     style: new TextStyle(
//                                                         color: Colors.white,
//                                                         fontWeight:
//                                                             FontWeight.bold)),
//                                               ],
//                                             ),
//                                           ),
//                                           Text(
//                                             'Awaiting',
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10.0),
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             // width: 150,
//                                             alignment: Alignment.topLeft,
//                                             // child: Text("TableName:TableName")
//                                             child: RichText(
//                                               text: TextSpan(
//                                                 // Here is the explicit parent TextStyle
//                                                 style: new TextStyle(
//                                                   // fontSize: 16.0,
//                                                   color: Colors.black,
//                                                   fontFamily: 'Montserrat',
//                                                 ),
//                                                 children: <TextSpan>[
//                                                   new TextSpan(
//                                                       text: 'Waitress: '),
//                                                   new TextSpan(
//                                                       text: item.waitressName,
//                                                       style: new TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             // width: 150,
//                                             alignment: Alignment.topLeft,
//                                             // child: Text("TableName:TableName")
//                                             child: RichText(
//                                               text: TextSpan(
//                                                 // Here is the explicit parent TextStyle
//                                                 style: new TextStyle(
//                                                   // fontSize: 16.0,
//                                                   color: Colors.black,
//                                                   fontFamily: 'Montserrat',
//                                                 ),
//                                                 children: <TextSpan>[
//                                                   new TextSpan(
//                                                       text: 'Order#: '),
//                                                   new TextSpan(
//                                                       text: item.orderId,
//                                                       style: new TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 10.0,
//                                           ),
//                                           Container(
//                                             alignment: Alignment.topRight,
//                                             child: Text(
//                                                 '${timeago.format(item.orderDate)}'),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                   ],
//                 );
//         });
//   }
// // }


// ListView.builder(
//             itemCount: orderlist.incomingOrders?.length,
//             itemBuilder: (context, index) {
//               return orderlist.incomingOrders!.isEmpty
//                   ? Center(
//                       child: Text("No new order",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey[500],
//                               fontSize: 20)))
                  // : Card(
                  //     child: SizedBox(
                  //       height: 50,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Text('VI001$index'),
                  //           Text(orderlist.incomingOrders?[index].iD as String),
                  //           const Text('x1'),
                  //           Text('${DateTime.now()}'),
                  //           MaterialButton(
                  //               onPressed: () {},
                  //               color: Colors.green,
                  //               child: const Text(
                  //                 'Process Order',
                  //                 style: TextStyle(color: Colors.white),
                  //               )),
                  //         ],
                  //       ),
                  //     ),
                  //   );
//             }),



// ListView.builder(
//           itemCount: 10,
//           itemBuilder: (context,index){
//             return Card(
//               child: Container(
//                 height: 50,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text('VI001$index'),
//                     const Text('Fried Rice and Chicken'),
//                     const Text('x1'),
//                     Text('${DateTime.now()}'),
                    // MaterialButton(onPressed:(){},color: Colors.green,child: Text('Complete Order',style: TextStyle(color:Colors.white),)),
//                   ],
//                 ),
//               ),
//             );
//           }),