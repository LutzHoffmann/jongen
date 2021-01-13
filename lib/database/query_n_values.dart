import '../database/db_helper.dart';

class QueryNValues {
  final id;
  final grad;
  final table;
  QueryNValues(this.id, this.grad, this.table);
  DatabaseHelper con = DatabaseHelper.instance;

  Future<List> getNValues() async {
    var res = await con.queryNValues(id, grad, table);
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
