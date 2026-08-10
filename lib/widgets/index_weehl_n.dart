import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../logic/index_set_provider .dart';
import '../logic/pos_text_model.dart';
import '../database/query_n_values.dart';

class IndexWeehlN extends StatefulWidget {
  @override
  _IndexWeehlNState createState() => _IndexWeehlNState();
}

class _IndexWeehlNState extends State<IndexWeehlN> {
  final geo = Get.arguments[0];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void changeN(value) =>
      Provider.of<PosTextModel>(context, listen: false).changeN(value);
  void setIndexDeg(grad) =>
      Provider.of<IndexSetProvider>(context, listen: false).setIndexDeg(grad);
  // Make changes to Fleximage with Provider
  void positionChanged(value) async {
    var grad = 'n0';
    if (value == 0)
      grad = 'n0';
    else if (value == 1)
      grad = 'n05';
    else if (value == 2)
      grad = 'n1';
    else if (value == 3)
      grad = 'n15';
    else if (value == 4)
      grad = 'n2';
    else if (value == 5)
      grad = 'n25';
    else if (value == 6) grad = 'n3';
    final _index = Provider.of<IndexSetProvider>(context).index;
    print(_index);

    var qNV = QueryNValues(_index, grad, geo);
    var res = await qNV.getNValues();

    changeN(res);
    setIndexDeg(grad);
  }

  final List<Widget> degrees = [
    ListTile(
      leading: Icon(Icons.rotate_90_degrees_ccw_outlined),
      title: Text(
        '0 Grad',
        textAlign: TextAlign.center,
      ),
    ),
    ListTile(
      leading: Icon(Icons.rotate_90_degrees_ccw_outlined),
      title: Text(
        '0,5 Grad',
        textAlign: TextAlign.center,
      ),
    ),
    ListTile(
      leading: Icon(Icons.rotate_90_degrees_ccw_outlined),
      title: Text(
        '1 Grad',
        textAlign: TextAlign.center,
      ),
    ),
    ListTile(
      leading: Icon(Icons.rotate_90_degrees_ccw_outlined),
      title: Text(
        '1,5 Grad',
        textAlign: TextAlign.center,
      ),
    ),
    ListTile(
      leading: Icon(Icons.rotate_90_degrees_ccw_outlined),
      title: Text(
        '2 Grad',
        textAlign: TextAlign.center,
      ),
    ),
    ListTile(
      leading: Icon(Icons.rotate_90_degrees_ccw_outlined),
      title: Text(
        '2,5 Grad',
        textAlign: TextAlign.center,
      ),
    ),
    ListTile(
      leading: Icon(Icons.rotate_90_degrees_ccw_outlined),
      title: Text(
        '3 Grad',
        textAlign: TextAlign.center,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Center(
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(0 / 360),
          child: ListWheelScrollView(
            controller: FixedExtentScrollController(),
            onSelectedItemChanged: (value) => positionChanged(value),
            itemExtent: 40,
            magnification: 1.0,
            perspective: 0.00001,
            squeeze: 1.5,
            overAndUnderCenterOpacity: 0.1,
            useMagnifier: true,
            physics: FixedExtentScrollPhysics(),
            children: degrees,
          ),
        ),
      ),
    );
  }
}
