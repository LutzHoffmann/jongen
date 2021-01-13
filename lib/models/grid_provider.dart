import 'package:flutter/material.dart';
import '../widgets/cut_grid_tile.dart';

class GridProvider with ChangeNotifier {
  CutGridTile _tile;
  List<CutGridTile> _tiles = [];

  List<Widget> get returnTiles {
    print(_tiles.length);

    return _tiles;
  }

  void addTiles(tilesText) {
    //for (var i in tilesText) {
    int i = 0;

    tilesText.forEach((k, v) {
      _tile = (CutGridTile(k, v));
      _tiles.add(_tile);

      i = i + 1;
    });

    notifyListeners();
  }

  void renewList() {
    _tiles.clear();
    notifyListeners();
  }
}
