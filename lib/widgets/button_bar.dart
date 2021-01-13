import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/material_choise_provider.dart';
import '../widgets/elevated_buttons.dart';
import '../widgets/pop_button.dart';

class ButtBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MaterialChoiseProvider(),
      child: Container(
        child: ButtonBar(
          buttonPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          alignment: MainAxisAlignment.end,
          children: [
            ChoiseButtons('rough'),
            ChoiseButtons('finish'),
            PopButton(),
          ],
        ),
      ),
    );
  }
}
