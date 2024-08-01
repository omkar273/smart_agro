import 'package:geocoding/geocoding.dart';

Future<String?> getCityName(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    return place.locality; // This is the city name
  } catch (e) {
    print("Failed to get city name: $e");
    return null;
  }
}
