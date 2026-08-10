import '../database/read_cutpara_excel.dart';
import '../database/read_geo_excel.dart';

Future<void> loadInitialData() async {
  try {
    await ReadGeoExcel().loadExcel();
  } catch (error, stackTrace) {
    print('Initial geo data loading failed: $error');
    print(stackTrace);
  }

  try {
    await ReadCutparaExcel().loadExcel();
  } catch (error, stackTrace) {
    print('Initial cutpara data loading failed: $error');
    print(stackTrace);
  }
}
