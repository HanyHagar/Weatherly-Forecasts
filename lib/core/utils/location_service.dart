import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    // Test if location services are enabled
    if (!serviceEnabled) {
      // Handle the case when location services are not enabled
      return Future.error("Location services are disabled");
    }

    // Check and request permission if needed
    await askPermission(permission);

    // Get the current location with location settings
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    return position;
  }

  Future<void> askPermission(LocationPermission permission) async {
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions denied, handle the error
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions denied forever, show an alert to the user
      return Future.error("Location permission denied forever");
    }
  }
}
