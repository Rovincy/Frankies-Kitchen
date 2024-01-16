// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PrinterSelectionPage extends StatefulWidget {
//   const PrinterSelectionPage({super.key});

//   @override
//   State<PrinterSelectionPage> createState() => _PrinterSelectionPageState();
// }

// class _PrinterSelectionPageState extends State<PrinterSelectionPage> {
//   Future<Uint8List?> pickFile() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['txt'],
//   );
//   if (result != null) {
//     return result.files.single.bytes;
//   }
//   return null;
// }
//   List<String> printers = [];

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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Printer Selection Page'),
//       ),
//       body: SizedBox(
//         width: Get.width,
//         height: Get.height,
//         child: FutureBuilder(
//         future: readFile(context),
//         builder: (context,AsyncSnapshot snapshot){
//           // if (condition) {
            
//           // } else {
            
//           // }
//           if (snapshot.hasData) {
//             // print(snapshot.data);
//             return SizedBox(child: ListView.builder(
//               itemCount: snapshot.data.length,
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
//       ),
//     );
//   }
// }