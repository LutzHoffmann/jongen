import 'package:flutter/widgets.dart';

import 'app.dart';
import 'startup/load_initial_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await loadInitialData();
  } catch (error, stackTrace) {
    print('Initial data loading failed: $error');
    print(stackTrace);
  }

  runApp(JongenApp());
}
