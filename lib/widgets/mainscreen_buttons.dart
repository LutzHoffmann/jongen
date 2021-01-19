import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenButtons extends StatelessWidget {
  final buttonText;

  MainScreenButtons(this.buttonText);
  @override
  Widget build(BuildContext context) {
    final argument1Substring = 'Geo' + buttonText.substring(0, 3);
    return Container(
      height: (Get.height) / 5,
      width: Get.width / 2,
      child: Card(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        color: Colors.transparent,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () => Get.toNamed('/screenkurz',
              arguments: [argument1Substring, buttonText.substring(3)]),
          child: Text(
            buttonText,
            style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
