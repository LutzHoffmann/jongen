import 'package:flutter/material.dart';

enum Actions { bestz, date, kdnr }

class PopupPdfMenue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 10, color: Colors.blue);
    return PopupMenuButton<Actions>(
      elevation: 20,
      color: Colors.white,
      tooltip: 'Change Fields',
      initialValue: Actions.bestz,
      onSelected: (Actions result) {
        onChanged(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Actions>>[
        const PopupMenuItem<Actions>(
          value: Actions.bestz,
          height: 25,
          child: Text(
            'Ordersign',
            style: style,
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<Actions>(
          height: 25,
          value: Actions.kdnr,
          child: Text(
            'Customer Number',
            style: style,
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<Actions>(
          height: 25,
          value: Actions.date,
          child: Text(
            'Date',
            style: style,
          ),
        ),
      ],
    );
  }

  void onChanged(result) {}
}
