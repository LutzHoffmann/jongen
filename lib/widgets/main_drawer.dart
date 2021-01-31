import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.white.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Menue',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: InkResponse(
                  onTap: () => {Get.toNamed('/')},
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                title: InkResponse(
                  onTap: () => {_launchURL('https://www.jongen.de')},
                  child: Text('Jongen im Web', style: TextStyle(fontSize: 20)),
                ),
              ),
              ListTile(
                title: InkResponse(
                  onTap: () => {
                    _launchURL(
                        'https://www.jongen.de/out/Download/VHM/VHM%20417+418/VHM%20417+418_de2016.pdf')
                  },
                  child: Text('Pdf der Werkzeugdaten',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              ListTile(
                title: InkResponse(
                  onTap: () => {Get.toNamed('resharp_pdf')},
                  child: Text('Nachschleifauftrag',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              ListTile(
                title: InkResponse(
                  onTap: () => {Get.toNamed('aboutscreen')},
                  child: Text('About', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String urlDyn) async {
    final url = urlDyn;
    if (await canLaunch(
      url,
    )) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
