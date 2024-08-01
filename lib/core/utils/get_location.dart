import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_agro/core/utils/show_text_snackbar.dart';

Future<Position?> getCurrentLocation() async {
  try {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      showTextSnackbar(
        'Please enable the location permission to get the wheather data',
      );
      await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      openAppSettings();
    } else {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      log('${position.latitude}-${position.longitude}');
      return position;
    }
  } catch (e) {
    showTextSnackbar(e.toString());
  }
  return null;
}
