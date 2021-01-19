import 'package:flutter/material.dart';
import 'package:jongen/logic/get_arguments_provoider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../widgets/button_bar.dart';
import '../widgets/my_custom_clipper.dart';
import '../widgets/index_weehl_n.dart';
import '../widgets/index_wheel.dart';
import '../widgets/flex_image.dart';

class ScreenKurz extends StatefulWidget {
  static const routeName = '/screenkurz';

  @override
  _ScreenKurzState createState() => _ScreenKurzState();
}

class _ScreenKurzState extends State<ScreenKurz> implements ChangeNotifier {
  void setGeo(geo) =>
      Provider.of<GetArgumentsProvider>(context, listen: false).setGeo(geo);
  void setCoat(coat) =>
      Provider.of<GetArgumentsProvider>(context, listen: false).setCoat(coat);
  @override
  Widget build(BuildContext context) {
    String geo = Get.arguments[0].substring(3);
    setGeo(geo);
    String coat = Get.arguments[1];
    setCoat(coat);
    notifyListeners();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Jongen',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 80,
                    width: 300,
                    child: IndexWeehlN(),
                  ),
                  SizedBox(
                    key: Key('SizeBoxImage'),
                    height: 250,
                    width: double.infinity,
                    child: FlexImage(),
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ButtBar(),
                  ),
                  SizedBox(
                    height: 250,
                    width: 300,
                    child: IndexWheel(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void addListener(void Function() listener) {
    // ignore: todo
    // TODO: implement addListener
  }

  @override
  // ignore: todo
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // ignore: todo
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(void Function() listener) {
    // ignore: todo
    // TODO: implement removeListener
  }
}
