import '../database/db_helper.dart';

class QueryPosTextValues {
  final id;
  final table;
  QueryPosTextValues(this.id, this.table);
  DatabaseHelper con = DatabaseHelper.instance;

  Future<List> getPosTextValues() async {
    var res = await con.queryOneRowsValues(id, table);
    //print(res);
    List list = [];
    for (var v in res) {
      v.forEach((key, value) {
        list.add(value);
      });
    }

    return list;
  }
}
