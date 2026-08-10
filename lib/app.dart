import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'database/read_cutpara_excel.dart';
import 'database/read_geo_excel.dart';
import 'logic/get_arguments_provoider.dart';
import 'logic/index_set_provider .dart';
import 'logic/material_choise_provider.dart';
import 'logic/pos_text_model.dart';
import 'models/grid_provider.dart';
import 'screens/about_screen.dart';
import 'screens/resharp_pdf.dart';
import 'screens/screen_kurz.dart';
import 'screens/start_screen.dart';

class JongenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
          primaryColor: Colors.white,
          accentColor: Colors.grey,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => StartScreen()),
          GetPage(name: '/screenkurz', page: () => ScreenKurz()),
          GetPage(
              name: '/resharp_pdf',
              page: () => ResharpPdf(),
              transition: Transition.zoom),
          GetPage(
              name: '/aboutscreen',
              page: () => AboutScreen(),
              transition: Transition.zoom),
        ],
      ),
    );
  }
}
