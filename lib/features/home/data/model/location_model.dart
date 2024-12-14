
import 'package:hive/hive.dart';

part 'location_model.g.dart'; // Required for Hive Type Adapter generation
@HiveType(typeId: 3) // Assign a unique typeId for WeatherModel

class Location {
  Location({
    required this.localtime,
    required this.country,
    required this.localtimeEpoch,
    required this.name,
    required this.lon,
    required this.region,
    required this.lat,
    required this.tzId,
  });
  @HiveField(0)
  String localtime;
  @HiveField(1)
  String country;
  @HiveField(2)
  int localtimeEpoch;
  @HiveField(3)
  String name;
  @HiveField(4)
  double lon;
  @HiveField(5)
  String region;
  @HiveField(6)
  double lat;
  @HiveField(7)
  String tzId;

  factory Location.fromJson(Map<dynamic, dynamic> json) => Location(
    localtime: json["localtime"],
    country: json["country"],
    localtimeEpoch: json["localtime_epoch"],
    name: json["name"],
    lon: json["lon"]?.toDouble(),
    region: json["region"],
    lat: json["lat"]?.toDouble(),
    tzId: json["tz_id"],
  );

  Map<dynamic, dynamic> toJson() => {
    "localtime": localtime,
    "country": country,
    "localtime_epoch": localtimeEpoch,
    "name": name,
    "lon": lon,
    "region": region,
    "lat": lat,
    "tz_id": tzId,
  };
}
