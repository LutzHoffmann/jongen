import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/start_screen.dart';
import '../widgets/about_text.dart';

import '../widgets/my_custom_clipper.dart';
import '../widgets/main_drawer.dart';

class AboutScreen extends StatelessWidget {
  static final routeName = '/abautscreen';
  @override
  Widget build(BuildContext context) {
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
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAll(StartScreen());
            },
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
                AboutText(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
