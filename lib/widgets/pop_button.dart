import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../logic/material_choise_provider.dart';

enum Spez { hard, harder, hardest }
enum SpezStrong { harder, hardest, heavy }

class PopButton extends StatefulWidget {
  @override
  _PopButtonState createState() => _PopButtonState();
}

class _PopButtonState extends State<PopButton> implements ChangeNotifier {
  final String hx = Get.arguments[1];
  void setChoise(choiseText) =>
      Provider.of<MaterialChoiseProvider>(context, listen: false)
          .setmaterialFrom(choiseText);
  @override
  void initState() {
    if (hx == 'HX63')
      setChoise('3848');
    else
      setChoise('4856');
    super.initState();
  }

  void onChanged(selection) {
    if (selection == Spez.hard)
      selection = '3848';
    else if (selection == Spez.harder || selection == SpezStrong.harder)
      selection = '4856';
    else if (selection == Spez.hardest || selection == SpezStrong.hardest)
      selection = '5663';
    else
      selection = '6370';
    print(selection);
    setChoise(selection);

    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 10, color: Colors.blue);

    return hx == 'HX63'
        ? PopupMenuButton<Spez>(
            elevation: 20,
            color: Colors.white,
            tooltip: 'Meterial',
            initialValue: Spez.hard,
            onSelected: (Spez result) {
              onChanged(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Spez>>[
              const PopupMenuItem<Spez>(
                value: Spez.hard,
                height: 25,
                child: Text(
                  '38-48 HRC',
                  style: style,
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<Spez>(
                height: 25,
                value: Spez.harder,
                child: Text(
                  '48-58 HRC',
                  style: style,
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<Spez>(
                height: 25,
                value: Spez.hardest,
                child: Text(
                  '56-63 HRC',
                  style: style,
                ),
              ),
            ],
          )
        : PopupMenuButton<SpezStrong>(
            elevation: 20,
            color: Colors.white,
            tooltip: 'Meterial',
            initialValue: SpezStrong.harder,
            onSelected: (SpezStrong result) {
              onChanged(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SpezStrong>>[
                  const PopupMenuItem<SpezStrong>(
                    value: SpezStrong.harder,
                    height: 25,
                    child: Text(
                      '48-56 HRC',
                      style: style,
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem<SpezStrong>(
                    height: 25,
                    value: SpezStrong.hardest,
                    child: Text(
                      '56 - 63 HRC',
                      style: style,
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem<SpezStrong>(
                    height: 25,
                    value: SpezStrong.heavy,
                    child: Text(
                      '63 -70 HRC',
                      style: style,
                    ),
                  ),
                ]);
  }

  @override
  void addListener(void Function() listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(void Function() listener) {
    // TODO: implement removeListener
  }
}
