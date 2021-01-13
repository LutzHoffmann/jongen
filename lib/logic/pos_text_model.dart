import 'package:flutter/material.dart';

import '../widgets/pos_text.dart';

class PosTextModel extends ChangeNotifier {
  List<PosText> items = [
    PosText(115, 118, '7.2', 0),
    PosText(20, 64, '2', -90),
    PosText(42, 55, '0.5', 45),
    PosText(85, 45, '5', 0),
    PosText(125, 35, '1.6', -90),
    PosText(275, 62, '6', -90),
    PosText(170, 133, '58', 0),
  ];

  List<PosText> get returnItems {
    print('returnCall');
    return [...items];
  }

  void setItemValues(valueText) {
    print(valueText);
    items[1] = PosText(20, 64, valueText[1], -90);
    items[2] = PosText(42, 55, valueText[2], 45);

    items[3] = PosText(85, 45, valueText[3], 0);

    items[4] = PosText(275, 62, valueText[4], -90);
    items[5] = PosText(125, 35, valueText[5], -90);
    items[6] = PosText(170, 133, valueText[6], 0);
    notifyListeners();
  }

  void changeN(value) {
    items[0] = PosText(115, 118, value[0], 0);
    notifyListeners();
  }
}
