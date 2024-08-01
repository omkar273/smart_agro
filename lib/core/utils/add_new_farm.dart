import 'dart:developer';
import 'package:qrscan/qrscan.dart' as scanner;

Future<String?> addNewFarm() async {
  try {
    String? cameraScanResult = await scanner.scan();
    log(cameraScanResult ?? 'none');
  } catch (e) {
    log(e.toString());
  }
  return null;
}
