import 'package:flutter/widgets.dart';

import 'app.dart';
import 'startup/load_initial_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadInitialData();
  runApp(JongenApp());
}
