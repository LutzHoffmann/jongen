import 'package:jongen/widgets/table_rowsmaker.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfTableExtra extends pw.Table {
  pw.Table table = pw.Table(
    border: pw.TableBorder.all(),
    columnWidths: {
      0: pw.FlexColumnWidth(1),
      1: pw.FlexColumnWidth(4),
      2: pw.FlexColumnWidth(4),
      3: pw.FlexColumnWidth(1)
    },
    children: [
      pw.TableRow(
        children: [
          pw.Text('Menge', style: pw.TextStyle(fontSize: 10)),
          pw.Text('Typ/Bestellnr.', style: pw.TextStyle(fontSize: 10)),
          pw.Text('Bemerkung/Wunsch', style: pw.TextStyle(fontSize: 10)),
          pw.Text('MP j/n', style: pw.TextStyle(fontSize: 10)),
        ],
      ),
      ...TableRowsmaker().makeRows(),
    ],
  );
}
