import 'package:flutter/material.dart';

class IndexSetProvider with ChangeNotifier {
  int _index = 1;
  String _indexDeg = 'n0';
  String _selectedTable;

  int get index {
    return _index;
  }

  String get indexDeg {
    return _indexDeg;
  }

  String get selectedTable {
    return _selectedTable;
  }

  void setIndex(index) {
    _index = index;

    notifyListeners();
  }

  void setIndexDeg(indexIn) {
    print(indexIn);

    _indexDeg = indexIn;

    notifyListeners();
  }

  void setSelectedTable(tableIn) {
    _selectedTable = tableIn;
  }
}
