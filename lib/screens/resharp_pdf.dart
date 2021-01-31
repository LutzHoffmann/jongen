import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:get/get.dart';

import 'package:pdf/pdf.dart';

import 'package:printing/printing.dart';
import '../widgets/popup_pdf_menu.dart';
import '../widgets/pdf_table_org.dart';
import '../widgets/pdf_table_extra.dart';

class ResharpPdf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: PopupPdfMenue(),
            ),
          ],
        ),
        body: PdfPreview(
          canChangePageFormat: false,
          build: (format) => _generatePdf(format),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Stack(
            children: [
              pw.Center(
                child: pw.Container(
                  width: double.infinity,
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Container(
                        color: PdfColors.grey,
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Nachschleifauftrag',
                              style: pw.TextStyle(
                                color: PdfColors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text(
                            'BITTE DER WARE BEILEGEN',
                            style: pw.TextStyle(
                                fontSize: 10, color: PdfColors.grey),
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 10, width: double.infinity),
                      pw.Container(
                        width: double.infinity,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Container(
                                height: 20,
                                decoration: pw.BoxDecoration(
                                  border: pw.Border.all(),
                                  // width: Get.width / 4,
                                ),
                                child: pw.Column(
                                  children: [
                                    pw.Text('Bestellzeichen',
                                        style: pw.TextStyle(fontSize: 8)),
                                    pw.Text('',
                                        style: pw.TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                            pw.Container(
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              width: Get.width / 4,
                              child: pw.Column(
                                children: [
                                  pw.Text('Kunden Nr.',
                                      style: pw.TextStyle(fontSize: 8)),
                                  pw.Text('',
                                      style: pw.TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            pw.Container(
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              width: Get.width / 4,
                              child: pw.Column(
                                children: [
                                  pw.Text('Unterschrift',
                                      style: pw.TextStyle(fontSize: 8)),
                                  pw.Text('',
                                      style: pw.TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            pw.Container(
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              width: Get.width / 4,
                              child: pw.Column(
                                children: [
                                  pw.Text('Darum',
                                      style: pw.TextStyle(fontSize: 8)),
                                  pw.Text('',
                                      style: pw.TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.Positioned(
                top: (4.5 * PdfPageFormat.cm),
                left: (0.2 * PdfPageFormat.cm),
                child: pw.Container(
                  width: Get.width,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.SizedBox(
                        width: (8.5 * PdfPageFormat.cm),
                        height: (4.5 * PdfPageFormat.cm),
                        child: pw.Container(
                            color: PdfColors.grey,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text('Absendeadresse',
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        decoration:
                                            pw.TextDecoration.underline)),
                                pw.Text('\n',
                                    style: pw.TextStyle(fontSize: 10)),
                                pw.Text('\n',
                                    style: pw.TextStyle(fontSize: 10)),
                                pw.Text('Jongen Werkzeugtechnik GmbH Co.Kg',
                                    style: pw.TextStyle(fontSize: 12)),
                                pw.Text('Hans-Böckler-Straße 7',
                                    style: pw.TextStyle(fontSize: 12)),
                                pw.Text('47877 Willich',
                                    style: pw.TextStyle(fontSize: 12)),
                              ],
                            )),
                      ),
                      pw.SizedBox(
                          width: (8.5 * PdfPageFormat.cm),
                          height: (4.5 * PdfPageFormat.cm),
                          child: pw.Container(
                              color: PdfColors.grey,
                              child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text('Auftraggeber',
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          decoration:
                                              pw.TextDecoration.underline)),
                                  pw.Text('',
                                      style: pw.TextStyle(fontSize: 10)),
                                  pw.Text('',
                                      style: pw.TextStyle(fontSize: 10)),
                                  pw.Text('',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Text('',
                                      style: pw.TextStyle(fontSize: 12)),
                                  pw.Text('',
                                      style: pw.TextStyle(fontSize: 12)),
                                ],
                              ))),
                    ],
                  ),
                ),
              ),
              pw.Positioned(
                top: 10.0 * PdfPageFormat.cm,
                left: 0.5 * PdfPageFormat.cm,
                child: pw.Center(
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.SizedBox(
                          height: 15,
                          child: pw.Text('Aufbereiten wie Orginal')),
                      pw.Container(
                        width: 16 * PdfPageFormat.cm,
                        child: pw.Column(
                          children: [
                            PdfTableOrg().table,
                            pw.SizedBox(
                              height: 15,
                            ),
                            pw.SizedBox(
                                height: 15,
                                child:
                                    pw.Text('Auflistung bei Sonderwuenschen')),
                            PdfTableExtra().table,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }
}
