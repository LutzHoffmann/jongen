import '../database/db_helper.dart';

class ToolTile {
  String _bez;
  String _n;

  ToolTile(this._bez, this._n);
  ToolTile.fromMap(dynamic obj) {
    this._bez = obj[DatabaseHelper.columnBez];
    this._n = obj[DatabaseHelper.columnN0];
  }
  String get bez => _bez;
  String get n => _n;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["bez"] = _bez;

    return map;
  }

  Map<String, dynamic> toMapN() {
    var mapN = Map<String, dynamic>();
    mapN['n'] = _n;
    return mapN;
  }
}
