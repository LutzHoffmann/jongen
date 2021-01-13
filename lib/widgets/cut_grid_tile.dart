import 'package:flutter/material.dart';

class CutGridTile extends StatelessWidget {
  final bez;
  final value;

  CutGridTile(this.bez, this.value);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Stack(
        children: [
          Column(
            children: [
              Card(
                color: Colors.blue,
                elevation: 15,
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bez,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(value),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
