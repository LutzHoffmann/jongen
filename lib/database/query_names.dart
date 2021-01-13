import 'dart:async';

import './db_helper.dart';
import '../models/tool_tile.dart';

class QueryNames {
  static Future<List<ToolTile>> getAllTools(table, hx) async {
    String whereArgs;
    if (hx == 'HX63')
      whereArgs = 'id < 22';
    else if (hx == 'HX70') whereArgs = 'id >= 22';
    DatabaseHelper con = DatabaseHelper.instance;
    var dbClient = await con.database;
    var res = await dbClient.query(table, where: '$whereArgs');
    // print(res);

    List<ToolTile> list = res.isNotEmpty
        ? res.map((bez) => ToolTile.fromMap(bez)).toList()
        : null;

    return list;
  }
}
