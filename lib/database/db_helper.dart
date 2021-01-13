import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "tools.db";
  static final _databaseVersion = 1;

  static final table = 'tools_table';
  static final tableSchlicht = 'schlicht_table';
  static final tableSchrupp = 'schrupp_table';
  static final columnId = 'id';
  static final columnBez = 'bez';
  static final columnDm = 'dm';
  static final columnRad = 'rad';
  static final columnL = 'l';
  static final columnN0 = 'n0';
  static final columnN05 = 'n05';
  static final columnN1 = 'n1';
  static final columnN15 = 'n15';
  static final columnN2 = 'n2';
  static final columnN25 = 'n25';
  static final columnN3 = 'n3';
  static final columnD1 = 'd1';
  static final columnDh6 = 'dh6';
  static final columnLg = 'lg';
  static final columnVc = 'vc';
  static final columnVcRange = 'vcRange';
  static final columnFz = 'fz';
  static final columnFzRange = 'fzRange';
  static final columnAp = 'ap';
  static final columnAe = 'ae';
  static final columnW = 'w';
  static final columnDmEf = 'dmEf';
  static final columnS = 's';
  static final columnF = 'f';
  static final columnMode = 'mode';
  static final columnMat = 'mat';
  static final columnIndex = 'idx';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    //print(path);
    return await openDatabase(
      path,
      version: _databaseVersion, //onCreate: _onCreate
    );
  }

  // SQL code to create the database table
  Future onCreate(String tableIn, int version) async {
    Database db = await instance.database;
    if (tableIn.contains('GEO')) {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableIn(
            $columnId INTEGER PRIMARY KEY,
            $columnBez TEXT NOT NULL,
            $columnDm TEXT NOT NULL,
            $columnRad TEXT NOT NULL,
            $columnL TEXT NOT NULL,
            $columnN0 TEXT NOT NULL,
            $columnN05 TEXT NOT NULL,
            $columnN1 TEXT NOT NULL,
            $columnN15 TEXT NOT NULL,
            $columnN2 TEXT NOT NULL,
            $columnN25 TEXT NOT NULL,
            $columnN3 TEXT NOT NULL,
            $columnLg TEXT NOT NULL,
            $columnD1 TEXT NOT NULL,
            $columnDh6 TEXT NOT NULL)''');
    } else if (tableIn.contains('SCHLICHT') || tableIn.contains('SCHRUPP')) {
      await db.execute('''
CREATE TABLE IF NOT EXISTS $tableIn(
  $columnId INTEGER PRIMARY KEY,
            $columnMat TEXT NOT NULL,
            $columnDm TEXT NOT NULL,
            $columnRad TEXT NOT NULL,
            $columnVc TEXT NOT NULL,
            $columnVcRange TEXT NOT NULL,
            $columnFz TEXT NOT NULL,
            $columnFzRange TEXT NOT NULL,
            $columnAp TEXT NOT NULL,
            $columnAe TEXT NOT NULL,
            $columnW TEXT NOT NULL,
            $columnDmEf TEXT NOT NULL,
            $columnS TEXT NOT NULL,
            $columnF TEXT NOT NULL)
          ''');
    }
  }

  // SQL code to create the database table

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(String tableIn, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableIn, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(table) async {
    Database db = await instance.database;

    return await db.query(table, columns: [columnBez]);
  }

  Future<List<Map<String, dynamic>>> queryOneRowsValues(id, tableIn) async {
    Database db = await instance.database;

    return await db.query(tableIn, where: '$columnId=?', whereArgs: [
      id
    ], columns: [
      columnN0,
      columnDm,
      columnRad,
      columnL,
      columnD1,
      columnLg,
      columnDh6
    ]);
  }

  Future<List<Map<String, dynamic>>> queryAllDegValues(id) async {
    Database db = await instance.database;

    return await db.query(table, where: '$columnId = ?', whereArgs: [
      id
    ], columns: [
      columnN0,
      columnDm,
      columnRad,
      columnL,
      columnD1,
      columnLg,
      columnDh6
    ]);
  }

  Future<List<Map<String, dynamic>>> queryMainCutValues(id, table) async {
    Database db = await instance.database;

    return await db.query(table, where: '$columnId=$id', whereArgs: [
      id
    ], columns: [
      columnFz,
      columnVc,
      columnAe,
      columnAp,
      columnW,
      columnDmEf,
      columnS,
      columnF
    ]);
  }

  Future<List<Map<String, dynamic>>> queryNValues(id, grad, tableIn) async {
    Database db = await instance.database;

    return await db.query(tableIn,
        where: '$columnId = ?', whereArgs: [id], columns: [grad]);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row, table) async {
    Database db = await instance.database;
    String bez = row[columnBez];
    return await db
        .update(table, row, where: '$columnBez = ?', whereArgs: [bez]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  void makeUnic() async {
    Database db = await instance.database;
    db.execute(
        '''CREATE UNIQUE INDEX idx_position_bez ON $tableSchlicht(_id)''');
  }
}
