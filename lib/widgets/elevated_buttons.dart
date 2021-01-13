import 'package:flutter/material.dart';
import 'package:jongen/logic/material_choise_provider.dart';
import 'package:jongen/models/grid_provider.dart';
import 'package:provider/provider.dart';
import '../logic/index_set_provider .dart';

import '../logic/get_arguments_provoider.dart';

import '../screens/choise_dialog.dart';
import '../database/query_cut_data.dart';

class ChoiseButtons extends StatefulWidget {
  final text;
  ChoiseButtons(this.text);

  @override
  _ChoiseButtonsState createState() => _ChoiseButtonsState();
}

class _ChoiseButtonsState extends State<ChoiseButtons> {
  void addTiles(tilesText) =>
      Provider.of<GridProvider>(context, listen: false).addTiles(tilesText);
  buttonPressed(buttonText) async {
    String table;
    String coat = Provider.of<GetArgumentsProvider>(context).coat;
    print(coat);
    String tec = 'buttonText';
    String extend = Provider.of<GetArgumentsProvider>(context).geo;
    String material = Provider.of<MaterialChoiseProvider>(context).material;
    int index = Provider.of<IndexSetProvider>(context).index;
    print(extend);

    if (buttonText == 'rough') {
      tec = 'SCHRUPP';
    } else {
      buttonText = 'finish';
      tec = 'SCHLICHT';
    }

    table = 'D$extend$coat$tec$material';
    print(table);
    var qCD = QueryCutData(index, table);
    var res = await qCD.getMainCutValues();
    addTiles(res);
  }

  @override
  Widget build(BuildContext context) {
    var _borderRadiusStyle;
    if (widget.text == 'rough') {
      _borderRadiusStyle =
          BorderRadius.horizontal(left: Radius.elliptical(5, 5));
    } else {
      _borderRadiusStyle = BorderRadius.horizontal(right: Radius.circular(5));
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: BeveledRectangleBorder(borderRadius: _borderRadiusStyle)),
      child: Text(widget.text),
      onPressed: () => {
        buttonPressed(widget.text),
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChoiseDialog();
          },
        ),
      },
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  void addListener(void Function() listener) {
    // ignore: todo
    // TODO: implement addListener
  }

  @override
  // ignore: todo
  // TODO: implement hasListeners
  // ignore: override_on_non_overriding_member
  bool get hasListeners => throw UnimplementedError();

  @override
  // ignore: override_on_non_overriding_member
  void notifyListeners() {
    // ignore: todo
    // TODO: implement notifyListeners
  }

  @override
  // ignore: override_on_non_overriding_member
  void removeListener(void Function() listener) {
    // ignore: todo
    // TODO: implement removeListener
  }
}
