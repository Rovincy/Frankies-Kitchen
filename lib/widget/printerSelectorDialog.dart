// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/Material.dart';
// import 'package:flutter/services.dart';
// import 'package:frankies_kitchen/widget/backgroundColor.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<Uint8List?> pickFile() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['txt'],
//   );
//   if (result != null) {
//     return result.files.single.bytes;
//   }
//   return null;
// }

// List<String> printers = [];
//  readFile(BuildContext context) async{
//   final fileBytes = await pickFile();
// if (fileBytes != null) {
//   final fileContent = String.fromCharCodes(fileBytes);
//   // print(fileContent);
//   // print(fileContent.length);
//    printers = fileContent.split(',');
// // print(printers);
// // print(printers.length);
// // print(printers[0]);
// }
// // print(printers);
// return printers;
// // (context as Element).markNeedsBuild();
// }

// printerSelectorDialog(BuildContext context) {
//   Size size = MediaQuery.of(context).size;
//   // List<String> tables = [
//   //   "Table 1",
//   //   "Table 2",
//   //   "Table 3",
//   //   "Table 4",
//   //   "Table 5",
//   //   "Table 6"
//   // ];
//   TextEditingController amoutPaid = TextEditingController();
//   AlertDialog alert = AlertDialog(
//     backgroundColor: Colors.white,
//     title: Text("Printer selection", style: TextStyle(fontWeight: FontWeight.bold)),
//     content: SizedBox(
//       width: 700,
//       // height: 550.0,
//       height: 550.0,
//       //size.height*0.08,
//       child: FutureBuilder(
//         future: readFile(context),
//         builder: (context,AsyncSnapshot snapshot){
//           // if (condition) {
            
//           // } else {
            
//           // }
//           if (snapshot.hasData) {
//             print(snapshot.data);
//             return SizedBox(child: ListView.builder(
//               itemCount: snapshot.data.length-1,
//               itemBuilder: (context,index){
//                 return InkWell(
//                   onTap: ()async{
//                     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//                     sharedPreferences.setString('printerName', snapshot.data[index].toString().trim());
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     child: Row(
//                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                       Icon(Icons.print),
//                       SizedBox(width: 50.0,),
//                       Text(snapshot.data[index])
//                     ],),
//                   ),
//                 );
//               })
//             );
//           } else {
//             return Container(child: Text('No data'),);
//           }
//         },
//       )
//     ),
//     actions: [
//       InkWell(
//           onTap: () {
//             // context.read<Model>().orderId.clear();
//             // print(totalCharges);
//             Navigator.pop(context);
//           },
//           child: Container(
//               width: 90.0,
//               height: 40.0,
//               alignment: Alignment.center,
//               color: Colors.grey.withOpacity(0.7),
//               child: Text("Cancel"))),
//       SizedBox(
//         width: 5.0,
//       ),
//       InkWell(
//           onTap: () async {
//           },
//           child: Container(
//               width: 90.0,
//               height: 40.0,
//               alignment: Alignment.center,
//               color: backgroundColor(),
//               child: Text("Confirm", style: TextStyle(color: Colors.white))))
//     ],
//   );
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
