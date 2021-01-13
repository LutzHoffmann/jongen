import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import 'package:printing/printing.dart';

class ResharpPdf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Center(
            child: pw.Text('Nachschleifauftrag'),
          );
        },
      ),
    );

    return pdf.save();
  }
}
