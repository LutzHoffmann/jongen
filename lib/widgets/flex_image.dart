import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../logic/pos_text_model.dart';

class FlexImage extends StatefulWidget {
  @override
  _FlexImageState createState() => _FlexImageState();
}

class _FlexImageState extends State<FlexImage> {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<PosTextModel>(context).returnItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(children: <Widget>[
          Container(
            width: 300,
            child: Center(
              child: SizedBox(
                key: Key('iSB'),
                height: 200,
                width: 300,
                child: Image.asset(
                  'assets/images/leg.png',
                ),
              ),
            ),
          ),
          ...items
        ]),
      ],
    );
  }
}
