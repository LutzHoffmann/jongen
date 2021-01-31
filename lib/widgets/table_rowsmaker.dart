import 'package:pdf/widgets.dart' as pw;

class TableRowsmaker {
  static const rh = 13.0; //RowHight
  makeRows() {
    var tableRowList = [];
    for (int i = 0; i < 14; i++) {
      tableRowList.add(
        pw.TableRow(
          children: [
            pw.SizedBox(
              height: rh,
              child: pw.Text('\n', style: pw.TextStyle(fontSize: 10)),
            ),
            pw.Text('\n'),
            pw.Text('\n'),
            pw.Text('\n'),
          ],
        ),
      );
    }
    return tableRowList;
  }
}
