import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../widgets/main_drawer.dart';

class StartScreen extends StatelessWidget {
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        backgroundColor: Theme.of(context).primaryColor,
        toolbarOpacity: 1,
        title: Text(
          'Jongen',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Stack(
          children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 180,
                                width: 200,
                                child: Card(
                                  color: Colors.transparent,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () => Get.toNamed('/screenkurz',
                                        arguments: ['GEO417', 'HX63']),
                                    child: Text(
                                      '417HX63',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 180,
                            width: 200,
                            child: Card(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () => Get.toNamed('/screenkurz',
                                    arguments: ['GEO417', 'HX70']),
                                child: Text(
                                  '417HX70',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 180,
                            width: 200,
                            child: Card(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  onPressed: () => Get.toNamed('/screenkurz',
                                      arguments: ['GEO418', 'HX63']),
                                  child: Text(
                                    '418HX63',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 25),
                                  )),
                            ),
                          ),
                          Container(
                            height: 180,
                            width: 200,
                            child: Card(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () => Get.toNamed('/screenkurz',
                                    arguments: ['GEO418', 'HX70']),
                                child: Text(
                                  '418HX70',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ),
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
