import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../widgets/main_drawer.dart';

class StartScreen extends StatelessWidget {
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        toolbarOpacity: 1,
        title: Text(
          'Jongen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: MainDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.red, Colors.yellow],
              stops: [0.35, 0.7, 0.8],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black,
                                        Colors.red,
                                        Colors.yellow
                                      ],
                                      stops: [
                                        0.35,
                                        0.7,
                                        0.8
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                ),
                                height: 180,
                                width: 200,
                                child: Card(
                                  color: Colors.transparent,
                                  child: ElevatedButton(
                                    onPressed: () => Get.toNamed('/screenkurz',
                                        arguments: ['GEO417', 'HX63']),
                                    child: Text('417HX63'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.red,
                                    Colors.yellow
                                  ],
                                  stops: [
                                    0.35,
                                    0.7,
                                    0.8
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            height: 180,
                            width: 200,
                            child: Card(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                onPressed: () => Get.toNamed('/screenkurz',
                                    arguments: ['GEO417', 'HX70']),
                                child: Text('417HX70'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.red,
                                    Colors.yellow
                                  ],
                                  stops: [
                                    0.35,
                                    0.7,
                                    0.8
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            height: 180,
                            width: 200,
                            child: Card(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                  onPressed: () => Get.toNamed('/screenkurz',
                                      arguments: ['GEO418', 'HX63']),
                                  child: Text('418HX63')),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.red,
                                    Colors.yellow
                                  ],
                                  stops: [
                                    0.35,
                                    0.7,
                                    0.8
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            height: 180,
                            width: 200,
                            child: Card(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                onPressed: () => Get.toNamed('/screenkurz',
                                    arguments: ['GEO418', 'HX70']),
                                child: Text('418HX70'),
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
