import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:jongen/widgets/mainscreen_buttons.dart';

import 'package:jongen/widgets/my_custom_clipper.dart';
import '../widgets/main_drawer.dart';

class StartScreen extends StatelessWidget {
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    // Platform messages are asynchronous, so we initialize in an async method.
    Future<void> scanBarcodeNormal() async {
      String barcodeScanRes;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", "Cancel", true, ScanMode.BARCODE);
        print(barcodeScanRes);
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).accentColor,
        toolbarOpacity: 1,
        title: Text(
          'Jongen',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              scanBarcodeNormal();
            },
            child: Icon(Icons.qr_code_scanner_outlined),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Jongen',
                            style: TextStyle(
                                fontSize: 80,
                                color: Theme.of(context).accentColor,
                                fontFamily: 'MeriendaOne'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Customer App',
                            style: TextStyle(
                                fontSize: 40,
                                color: Theme.of(context).accentColor,
                                fontFamily: 'MeriendaOne'),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).accentColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MainScreenButtons('417HX63'),
                          MainScreenButtons('418HX63'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MainScreenButtons('417HX70'),
                          MainScreenButtons('418HX70')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
