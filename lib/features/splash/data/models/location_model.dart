class LocationModel {
  final double latitude; // Latitude, in degrees
  final double longitude; // Longitude, in degrees
  final double accuracy; // Estimated horizontal accuracy of this location, radial, in meters
  final double altitude; // In meters above the WGS 84 reference ellipsoid
  final double speed; // In meters/second
  final double speedAccuracy; // In meters/second, always 0 on iOS and web
  final double
      heading; // Heading is the horizontal direction of travel of this device, in degrees
  final double time; // timestamp of the LocationData
  final bool isMock;

  LocationModel(
      {required this.latitude,
      required this.longitude,
      required this.accuracy,
      required this.altitude,
      required this.speed,
      required this.speedAccuracy,
      required this.heading,
      required this.time,
      required this.isMock}); // Is the location currently mocked
}
