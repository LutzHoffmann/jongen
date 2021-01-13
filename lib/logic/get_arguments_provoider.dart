import 'package:flutter/foundation.dart';

//This File hold the Arguments passing trough the Screens/Routes
class GetArgumentsProvider with ChangeNotifier {
  String _geo; //417? or 418?
  String _coat; //HX63 or HX 70?

  void setCoat(coat) {
    print('setCoat: $coat');
    _coat = coat;
  }

  String get coat {
    print('return $_coat');
    return _coat;
  }

  void setGeo(geo) {
    print('setGeo: $geo');
    _geo = geo;
  }

  String get geo {
    print('return $_geo');
    return _geo;
  }
}
