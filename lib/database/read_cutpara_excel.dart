import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:excel/excel.dart';

import 'db_helper.dart';

class ReadCutparaExcel {
  var dbHelper = DatabaseHelper.instance;
  loadExcel() async {
    try {
      ByteData data417HX63 =
          await rootBundle.load("assets/417HX63SCHNITT.xlsx");
      ByteData data417HX70 =
          await rootBundle.load("assets/417HX70SCHNITT.xlsx");
      ByteData data418HX63 =
          await rootBundle.load("assets/418HX63SCHNITT.xlsx");
      ByteData data418HX70 =
          await rootBundle.load("assets/418HX70SCHNITT.xlsx");

      var bytes417HX63 = data417HX63.buffer
          .asUint8List(data417HX63.offsetInBytes, data417HX63.lengthInBytes);
      var excel417HX63 = Excel.decodeBytes(bytes417HX63);

      var bytes417HX70 = data417HX70.buffer
          .asUint8List(data417HX70.offsetInBytes, data417HX70.lengthInBytes);
      var excel417HX70 = Excel.decodeBytes(bytes417HX70);

      var bytes418HX63 = data418HX63.buffer
          .asUint8List(data418HX63.offsetInBytes, data418HX63.lengthInBytes);
      var excel418HX63 = Excel.decodeBytes(bytes418HX63);

      var bytes418HX70 = data418HX70.buffer
          .asUint8List(data418HX70.offsetInBytes, data418HX70.lengthInBytes);
      var excel418HX70 = Excel.decodeBytes(bytes418HX70);

      for (var table in excel417HX63.tables.keys) {
        dbHelper.onCreate(table, 1);
        //print(table); //sheet Name
        //  print(excel.tables[table].maxCols);
        // print(excel.tables[table].maxRows);
        for (var row in excel417HX63.tables[table].rows) {
          insert(table, row);
          // query();
        }
      }
      for (var table in excel417HX70.tables.keys) {
        dbHelper.onCreate(table, 1);
        //print(table); //sheet Name
        //  print(excel.tables[table].maxCols);
        // print(excel.tables[table].maxRows);
        for (var row in excel417HX70.tables[table].rows) {
          insert(table, row);
          // query();
        }
      }
      for (var table in excel418HX63.tables.keys) {
        dbHelper.onCreate(table, 1);
        //print(table); //sheet Name
        //  print(excel.tables[table].maxCols);
        // print(excel.tables[table].maxRows);
        for (var row in excel418HX63.tables[table].rows) {
          insert(table, row);
          // query();
        }
      }
      for (var table in excel418HX70.tables.keys) {
        dbHelper.onCreate(table, 1);
        // print(table); //sheet Name
        //  print(excel.tables[table].maxCols);
        // print(excel.tables[table].maxRows);
        for (var row in excel418HX70.tables[table].rows) {
          insert(table, row);
          // query();
        }
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  void insert(table, grow) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: grow[0],
      DatabaseHelper.columnMat: grow[1].toString(),
      DatabaseHelper.columnDm: grow[2].toString(),
      DatabaseHelper.columnRad: grow[3].toString(),
      DatabaseHelper.columnVc: grow[4].toString(),
      DatabaseHelper.columnVcRange: grow[5].toString(),
      DatabaseHelper.columnFz: grow[6].toString(),
      DatabaseHelper.columnFzRange: grow[7].toString(),
      DatabaseHelper.columnAp: grow[8].toString(),
      DatabaseHelper.columnAe: grow[9].toString(),
      DatabaseHelper.columnW: grow[10].toString(),
      DatabaseHelper.columnDmEf: grow[11].toString(),
      DatabaseHelper.columnS: grow[12].toStringAsFixed(3),
      DatabaseHelper.columnF: grow[13].toStringAsFixed(3),
    };

    final id = await dbHelper.insert(table, row);

    //print('updated $rowsAffected row(s)');
  }

  //Future query() async {
  //final allRows = await dbHelper.queryAllRows();
  //print('query all rows:');
  //allRows.forEach((row) => print(row));
  // }
}
