import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

comment(BuildContext context,comment) {
  Size size = MediaQuery.of(context).size;
  var deposit = 0.00;
  var totalSale = 0.00;
  TextEditingController amoutPaid = TextEditingController();
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: Text("Comment", style: TextStyle(fontWeight: FontWeight.bold)),
    content: SizedBox(
      width: Get.width * 0.2,
      height: Get.height * 0.2,
      //size.height*0.08,
      child: Container(
        // width: 100,
        // height: 100,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$comment')
            // FutureBuilder(
            //     future: fetchCakeTransactions(data.orderNumber, context),
            //     builder: (context, AsyncSnapshot snapshot) {
            //       if (snapshot.hasData) {
            //         for (var data in trans.transHistory!
            //             .where((element) => element.transactionCode == "CID")) {
            //           totalSale = totalSale + data.totalSale!;
            //         }
            //         for (var data in trans.transHistory!
            //             .where((element) => element.transactionCode == "CPC")) {
            //           deposit = deposit + data.totalSale!;
            //         }
            //         print(totalSale);
            //         context.read<Model>().totalAmount(totalSale);
            //         // var test = 0.00;
            //         return Column(
            //           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           // crossAxisAlignment: CrossAxisAlignment.stretch,
            //           children: [
            //             for (var data in trans.transHistory!.where(
            //                 (element) => element.transactionCode == "CID"))
            //               Builder(builder: (BuildContext context) {
            //                 // test = test + data.totalSale!;
            //                 return Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     Text("Total Amount",
            //                         style: TextStyle(
            //                             color: Colors.black,
            //                             fontWeight: FontWeight.w600)),
            //                     Spacer(),
            //                     Text("GHC ${data.totalSale!}",
            //                         style: TextStyle(
            //                             color: Colors.black,
            //                             fontWeight: FontWeight.w600)),
            //                   ],
            //                 );
            //               }),
            //             SizedBox(
            //               height: 20.0,
            //             ),
            //             for (var data in trans.transHistory!.where(
            //                 (element) => element.transactionCode == "CPC"))
            //               Builder(builder: (BuildContext context) {
            //                 // deposit = deposit + data.totalSale!;
            //                 return Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     Text("Deposit"),
            //                     Spacer(),
            //                     Text("GHC ${data.totalSale!}"),
            //                   ],
            //                 );
            //               }),
            //             // balance = totalSale - deposit;
            //             SizedBox(
            //               height: 20.0,
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Text(
            //                   "Balance",
            //                   style: TextStyle(
            //                       color: Colors.red,
            //                       fontWeight: FontWeight.w600),
            //                 ),
            //                 Spacer(),
            //                 Text(
            //                   "GHC ${totalSale - deposit}",
            //                   style: TextStyle(
            //                       color: Colors.red,
            //                       fontWeight: FontWeight.w600),
            //                 ),
            //               ],
            //             )
            //           ],
            //         );
            //       } else {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //     }),
            // SizedBox(
            //   height: 20.0,
            // ),
            // Container(
            //   // width: size.width * 0.4,
            //   height: size.height * 0.1,
            //   //color: Colors.yellow,
            //   // padding: const EdgeInsets.symmetric(horizontal: 50.0),
            //   // alignment: Alignment.center,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       for (var paymentMethod in paymentMethodList.paymentmethods!)
            //         Builder(builder: (context) {
            //           return SizedBox(
            //             width: size.width * 0.1,
            //             height: size.height * 0.12,
            //             child: Card(
            //               elevation: 5.0,
            //               child: Row(children: [
            //                 Checkbox(
            //                     value: paymentMethod.name == "Cash"
            //                         ? context.watch<Model>().isCash
            //                         : paymentMethod.name == "Mobile Money"
            //                             ? context.watch<Model>().isMomo
            //                             : paymentMethod.name == "Card"
            //                                 ? context.watch<Model>().isCard
            //                                 : false,
            //                     onChanged: (value) {
            //                       if (paymentMethod.name == "Cash") {
            //                         context.read<Model>().cashChecked(value);
            //                       } else if (paymentMethod.name ==
            //                           "Mobile Money") {
            //                         context.read<Model>().momoChecked(value);
            //                       } else if (paymentMethod.name == "Card") {
            //                         context.read<Model>().cardChecked(value);
            //                       }
            //                     }),
            //                 Text(
            //                     paymentMethod.name == "Mobile Money"
            //                         ? "Momo"
            //                         : paymentMethod.name!,
            //                     style: TextStyle(
            //                       fontSize: 22.0,
            //                     ))
            //               ]),
            //             ),
            //           );
            //         }),
            //     ],
            //   ),
            //   /*Column(
            //         children: [
            //           MyCheckBox().box(context, "Cash"),
            //           MyCheckBox().box(context, "Mobile Money"),
            //           MyCheckBox().box(context, "Card"),
            //         ],
            //       ),*/
            // ),
            // TextFormField(
            //   controller: context.read<Model>().amountPaid,
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //       hintText: "Please enter remaning amount if any"),
            //   inputFormatters: <TextInputFormatter>[
            //     FilteringTextInputFormatter.allow(RegExp(r'[0.0-9.9]'))
            //   ],
            // ),
            // Text(
            //     "You are about to mark this order as delivered, please confirm."),
          ],
        ),
      ),
    ),
    actions: [
      InkWell(
          onTap: () {
            // print(totalCharges);
            // context.read<Model>().amountPaid.clear();
            // (context as Element).markNeedsBuild();
            Navigator.pop(context);
          },
          child: Container(
              width: 90.0,
              height: 40.0,
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.7),
              child: Text("Ok"))),
      // SizedBox(
      //   width: 5.0,
      // ),
      // InkWell(
      //     onTap: () async {
      //       addToCart(context,foodItem,stocks,true);
      //       Navigator.pop(context);
      //     },
      //     child: Container(
      //         width: 90.0,
      //         height: 40.0,
      //         alignment: Alignment.center,
      //         color: Colors.red,
      //         child: Text("Confirm", style: TextStyle(color: Colors.white))))
    ],
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


