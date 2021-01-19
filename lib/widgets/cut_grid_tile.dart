import 'package:flutter/material.dart';

class CutGridTile extends StatelessWidget {
  final bez;
  final value;

  CutGridTile(this.bez, this.value);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        children: [
          Card(
            color: Theme.of(context).primaryColor,
            elevation: 0,
            child: Stack(
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        bez,
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.2), fontSize: 40),
                      ),
                    ),
                    Center(
                      child: Text(value),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
