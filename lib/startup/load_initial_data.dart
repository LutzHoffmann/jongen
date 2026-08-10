import '../database/read_cutpara_excel.dart';
import '../database/read_geo_excel.dart';

Future<void> loadInitialData() async {
  await ReadGeoExcel().loadExcel();
  await ReadCutparaExcel().loadExcel();
}
