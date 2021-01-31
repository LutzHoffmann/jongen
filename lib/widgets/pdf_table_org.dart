import 'package:jongen/widgets/table_rowsmaker.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfTableOrg extends pw.Table {
  static const rh = 15.0; //RowHight
  pw.Table table = pw.Table(
    border: pw.TableBorder.all(),
    columnWidths: {
      0: pw.FlexColumnWidth(2),
      1: pw.FlexColumnWidth(4),
      2: pw.FlexColumnWidth(2),
      3: pw.FlexColumnWidth(2)
    },
    children: [
      pw.TableRow(
        children: [
          pw.Text('Menge', style: pw.TextStyle(fontSize: 10)),
          pw.Text('Typ/Bestellnr.', style: pw.TextStyle(fontSize: 10)),
          pw.Text('wie Orginal?', style: pw.TextStyle(fontSize: 10)),
          pw.Text('Messprotokoll j/n', style: pw.TextStyle(fontSize: 10)),
        ],
      ),
      ...TableRowsmaker().makeRows(),
    ],
  );
}
