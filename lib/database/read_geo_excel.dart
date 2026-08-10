import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:excel/excel.dart';

import './db_helper.dart';

class ReadGeoExcel {
  final dbHelper = DatabaseHelper.instance;

  get row => null;
  Future<void> loadExcel() async {
    try {
      ByteData data = await rootBundle.load("assets/41718Geom.xlsx");
      var bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        await dbHelper.onCreate(table, 1);
        //print(table); //sheet Name
        // print(excel.tables[table].maxCols);
        // print(excel.tables[table].maxRows);
        for (var row in excel.tables[table].rows) {
          await insert(table, row);
        }
      }
    } catch (error, stackTrace) {
      print('Geo Excel loading failed: $error');
      print(stackTrace);
      rethrow;
    }
  }

  Future<void> insert(table, grow) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: grow[0],
      DatabaseHelper.columnBez: grow[1].toString(),
      DatabaseHelper.columnDm: grow[2].toString(),
      DatabaseHelper.columnRad: grow[3].toString(),
      DatabaseHelper.columnL: grow[4].toString(),
      DatabaseHelper.columnN0: grow[5].toString(),
      DatabaseHelper.columnN05: grow[6].toString(),
      DatabaseHelper.columnN1: grow[7].toString(),
      DatabaseHelper.columnN15: grow[8].toString(),
      DatabaseHelper.columnN2: grow[9].toString(),
      DatabaseHelper.columnN25: grow[10].toString(),
      DatabaseHelper.columnN3: grow[11].toString(),
      DatabaseHelper.columnLg: grow[12].toString(),
      DatabaseHelper.columnD1: grow[13].toString(),
      DatabaseHelper.columnDh6: grow[14].toString(),
    };
    await dbHelper.insert(table, row);
  }
}
