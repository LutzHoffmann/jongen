import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String headline = 'Informationen zur App';

    const String bodyText =
        ('''Diese App wurde von einer Privatperson entwickelt. Die Firma Jongen stellt ausschliesslich die hier verwendeten Daten als Pdf auf Ihrer Webseite zum Download bereit. 
 Der Appentwicker bezieht sich auf diese Daten in einem veränderten Format.
 Vergleichen Sie die Daten mit der auf der Webseite erhältlichen Pdf-Datei! Diese App erhebt und übermittelt 
 keine Daten und persönliche Imformationen. Alle Daten werden local verarbeitet. Haftungsauschluss für nicht verifizerte Daten! ''');

    const String impressum = 'Impressum';
    const String impressum_text =
        ('Lutz Hoffmann \nHittastrasse 11 \n41061 Mönchengladbch \nGermany \nlutz_hoffmann@gmx.net');
    final headstyle = TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 25,
        fontWeight: FontWeight.bold);
    final bodyTextStyle =
        TextStyle(color: Theme.of(context).accentColor, fontSize: 20);

    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: Get.height / 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  headline,
                  style: headstyle,
                )
              ],
            ),
            Divider(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        bodyText,
                        style: bodyTextStyle,
                        textAlign: TextAlign.center,
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  impressum,
                  style: headstyle,
                ),
              ],
            ),
            Divider(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    impressum_text,
                    style: bodyTextStyle,
                    textAlign: TextAlign.left,
                    maxLines: null,
                    overflow: TextOverflow.visible,
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
