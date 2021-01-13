import 'package:flutter/foundation.dart';

class MaterialChoiseProvider with ChangeNotifier {
  String _material = '';
  String _geo;
  String _coat;
  void setmaterialFrom(choiseText) {
    _material = choiseText;
  }

  String get material {
    return _material;
  }

  set coat(coat) {
    print('setCoat: $coat');
    _coat = coat;
  }

  String get coat {
    print('return $_coat');
    return _coat;
  }

  set geo(geo) {
    print('setGeo: $geo');
    _geo = geo;
  }

  String get geo {
    print('return $_geo');
    return _geo;
  }
}
