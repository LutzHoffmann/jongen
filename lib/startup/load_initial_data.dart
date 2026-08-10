import '../database/read_cutpara_excel.dart';
import '../database/read_geo_excel.dart';

typedef InitialDataLoader = Future<void> Function();
typedef InitialDataErrorLogger = void Function(
  String label,
  Object error,
  StackTrace stackTrace,
);

Future<void> loadInitialData({
  InitialDataLoader loadGeo,
  InitialDataLoader loadCutpara,
  InitialDataErrorLogger onError,
}) async {
  final logError = onError ?? logInitialDataError;

  await _runInitialDataLoader(
    'geo',
    loadGeo ?? () => ReadGeoExcel().loadExcel(),
    logError,
  );
  await _runInitialDataLoader(
    'cutpara',
    loadCutpara ?? () => ReadCutparaExcel().loadExcel(),
    logError,
  );
}

Future<void> _runInitialDataLoader(
  String label,
  InitialDataLoader loader,
  InitialDataErrorLogger onError,
) async {
  try {
    await loader();
  } catch (error, stackTrace) {
    onError(label, error, stackTrace);
  }
}

void logInitialDataError(String label, Object error, StackTrace stackTrace) {
  print('Initial $label data loading failed: $error');
  print(stackTrace);
}
