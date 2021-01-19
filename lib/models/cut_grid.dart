import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../models/grid_provider.dart';

class CutGrid extends StatefulWidget {
  @override
  _CutGridState createState() => _CutGridState();
}

class _CutGridState extends State<CutGrid> {
  @override
  Widget build(BuildContext context) {
    final tiles = Provider.of<GridProvider>(context).returnTiles;
    print(tiles.length);
    return Container(
      padding: EdgeInsets.all(15),
      height: Get.height,
      width: Get.width,
      child: GridView.builder(
          itemCount: tiles.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Container(
                child: tiles[index],
              ),
            );
          }),
    );
  }
}
