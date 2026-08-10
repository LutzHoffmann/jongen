import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../database/query_n_values.dart';
import 'package:flutter/scheduler.dart';
import '../logic/index_set_provider .dart';
import '../database/query_postext_values.dart';
import '../logic/pos_text_model.dart';
import '../database/query_names.dart';

class IndexWheel extends StatefulWidget {
  @override
  _IndexWheelState createState() => _IndexWheelState();
}

class _IndexWheelState extends State<IndexWheel> {
  final String geo = Get.arguments[0]; //Save 417/418
  final String hx = Get.arguments[1]; //Save HX63/HX70
  void setItemValues(valueText) =>
      Provider.of<PosTextModel>(context, listen: false)
          .setItemValues(valueText);
  void setIndex(indexOfWeehl) =>
      Provider.of<IndexSetProvider>(context, listen: false)
          .setIndex(indexOfWeehl);
  void setIndexDeg(indexOfWeehlN) =>
      Provider.of<IndexSetProvider>(context, listen: false)
          .setIndexDeg(indexOfWeehlN);

  void changeN(value) =>
      Provider.of<PosTextModel>(context, listen: false).changeN(value);

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => {});
    final table = Get.arguments[0];
    final grad = 'n0';

    positionChanged(0, grad, table);
  }

  int makeIndexGreat(indexIn) {
    if (hx == 'HX63')
      return indexIn;
    else
      return indexIn + 21;
  }

  Icon getIcon() {
    if (geo == 'GEO417')
      return Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
      );
    else
      return Icon(
        Icons.arrow_drop_up,
        color: Colors.grey,
      );
  }

  void positionChanged(valueIn, grad, table) async {
    var valueFirst = valueIn + 1;
    final value = makeIndexGreat(valueFirst);
    print(value);
    var qPTV = QueryPosTextValues(value, table);
    var res = await qPTV.getPosTextValues();
    var qNV = QueryNValues(value, grad, table);
    var resN = await qNV.getNValues();

    changeN(resN);
    setItemValues(res);
    setIndex(value);
  }

  @override
  Widget build(BuildContext context) {
    var grad = Provider.of<IndexSetProvider>(context).indexDeg;
    print(grad);
    Future<List> _fetchData = Future<List>.delayed(
        Duration(seconds: 0), () => QueryNames.getAllTools(geo, hx));
    return FutureBuilder<List>(
      future: _fetchData,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListWheelScrollView(
                onSelectedItemChanged: (value) =>
                    positionChanged(value, grad, geo),
                itemExtent: 35,
                magnification: 1.5,
                overAndUnderCenterOpacity: 0.5,
                useMagnifier: true,
                physics: FixedExtentScrollPhysics(),
                children: snapshot.data.map((e) {
                  return ListTile(
                    onLongPress: () => print('press'),
                    leading: (getIcon()),
                    title: Text(
                      e.bez,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
