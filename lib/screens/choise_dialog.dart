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
    return Center(
      child: AlertDialog(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
        scrollable: true,
        content: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              right: 0,
              top: 0,
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
            Center(
              child: CutGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
