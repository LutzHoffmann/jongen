import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/grid_provider.dart';
import '../models/cut_grid.dart';

class ChoiseDialog extends StatefulWidget {
  @override
  _ChoiseDialogState createState() => _ChoiseDialogState();
}

class _ChoiseDialogState extends State<ChoiseDialog> {
  void renewList() =>
      Provider.of<GridProvider>(context, listen: false).renewList();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Stack(
              clipBehavior: Clip.hardEdge,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      CutGrid(),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: -0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                      renewList();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
