// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// Future<Uint8List> generatePdf() async {
//   final pdf = pw.Document();
//   pdf.addPage(pw.Page(
//       pageFormat: PdfPageFormat.roll80,
//       build: (pw.Context context) {
//         return pw.Center(
//           child: pw.Text('Hello World!',
//               style: pw.Theme.of(context)
//                   .defaultTextStyle
//                   .copyWith(fontWeight: pw.FontWeight.bold)),
//         ); // Center
//       })); // Page

//   return pdf.save();
// }

// Future<void> printPdf() async {
//   final doc = await generatePdf();
//   await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => doc);
// }
