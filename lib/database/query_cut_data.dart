import 'dart:async';

import './db_helper.dart';

class QueryCutData {
  final int id;
  final table;

  QueryCutData(this.id, this.table);

  DatabaseHelper con = DatabaseHelper.instance;

  Future<Map> getMainCutValues() async {
    var res = await con.queryMainCutValues(id, table);

    Map list = {};
    for (var v in res) {
      v.forEach((key, value) {
        list.addAll(v);
      });
    }

    return list;
  }
}
