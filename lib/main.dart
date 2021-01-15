import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jongen/database/read_cutpara_excel.dart';
import 'package:jongen/logic/index_set_provider%20.dart';
import 'package:jongen/logic/material_choise_provider.dart';
import 'package:jongen/screens/resharp_pdf.dart';
import './models/grid_provider.dart';
import './logic/get_arguments_provoider.dart';
import 'package:jongen/logic/pos_text_model.dart';
import 'package:provider/provider.dart';
import 'package:jongen/database/read_geo_excel.dart';

import 'package:jongen/screens/screen_kurz.dart';
import './screens/start_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PosTextModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => IndexSetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MaterialChoiseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetArgumentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GridProvider(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.white,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => StartScreen()),
          GetPage(name: '/screenkurz', page: () => ScreenKurz()),
          GetPage(
              name: '/resharp_pdf',
              page: () => ResharpPdf(),
              transition: Transition.zoom),
        ],
      )));
  ReadGeoExcel().loadExcel();
  ReadCutparaExcel().loadExcel();
}
