import 'package:hive/hive.dart';
import 'condition_model.dart';

part 'current_model.g.dart'; // This is required for code generation

@HiveType(typeId: 1) // Assign a unique type ID for this class
class Current extends HiveObject {
  Current({
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windDegree,
    required this.windchillF,
    required this.windchillC,
    this.lastUpdatedEpoch,
    required this.tempC,
    required this.tempF,
    required this.cloud,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.dewpointF,
    required this.uv,
    this.lastUpdated,
    required this.heatindexF,
    required this.dewpointC,
    required this.isDay,
    required this.precipIn,
    required this.heatindexC,
    required this.windDir,
    required this.gustMph,
    required this.pressureIn,
    required this.gustKph,
    required this.precipMm,
    required this.condition,
    required this.visKm,
    required this.pressureMb,
    required this.visMiles,
    this.snowCm,
    this.willItRain,
    this.diffRad,
    this.chanceOfRain,
    this.shortRad,
    this.willItSnow,
    this.timeEpoch,
    this.time,
    this.chanceOfSnow,
  });

  @HiveField(0)
  double feelslikeC;
  @HiveField(1)
  double feelslikeF;
  @HiveField(2)
  int windDegree;
  @HiveField(3)
  double windchillF;
  @HiveField(4)
  double windchillC;
  @HiveField(5)
  int? lastUpdatedEpoch;
  @HiveField(6)
  double tempC;
  @HiveField(7)
  double tempF;
  @HiveField(8)
  int cloud;
  @HiveField(9)
  double windKph;
  @HiveField(10)
  double windMph;
  @HiveField(11)
  int humidity;
  @HiveField(12)
  double dewpointF;
  @HiveField(13)
  double uv;
  @HiveField(14)
  String? lastUpdated;
  @HiveField(15)
  double heatindexF;
  @HiveField(16)
  double dewpointC;
  @HiveField(17)
  int isDay;
  @HiveField(18)
  double precipIn;
  @HiveField(19)
  double heatindexC;
  @HiveField(20)
  String windDir;
  @HiveField(21)
  double gustMph;
  @HiveField(22)
  double pressureIn;
  @HiveField(23)
  double gustKph;
  @HiveField(24)
  double precipMm;
  @HiveField(25)
  Condition condition; // Ensure `Condition` is also Hive-compatible
  @HiveField(26)
  double visKm;
  @HiveField(27)
  double pressureMb;
  @HiveField(28)
  double visMiles;
  @HiveField(29)
  int? snowCm;
  @HiveField(30)
  int? willItRain;
  @HiveField(31)
  double? diffRad;
  @HiveField(32)
  int? chanceOfRain;
  @HiveField(33)
  double? shortRad;
  @HiveField(34)
  int? willItSnow;
  @HiveField(35)
  int? timeEpoch;
  @HiveField(36)
  String? time;
  @HiveField(37)
  double? chanceOfSnow;

  factory Current.fromJson(Map<dynamic, dynamic> json) => Current(
    feelslikeC: json["feelslike_c"]?.toDouble(),
    feelslikeF: json["feelslike_f"]?.toDouble(),
    windDegree: json["wind_degree"],
    windchillF: json["windchill_f"]?.toDouble(),
    windchillC: json["windchill_c"]?.toDouble(),
    lastUpdatedEpoch: json["last_updated_epoch"],
    tempC: json["temp_c"]?.toDouble(),
    tempF: json["temp_f"]?.toDouble(),
    cloud: json["cloud"],
    windKph: json["wind_kph"]?.toDouble(),
    windMph: json["wind_mph"]?.toDouble(),
    humidity: json["humidity"],
    dewpointF: json["dewpoint_f"]?.toDouble(),
    uv: json["uv"]?.toDouble(),
    lastUpdated: json["last_updated"],
    heatindexF: json["heatindex_f"]?.toDouble(),
    dewpointC: json["dewpoint_c"]?.toDouble(),
    isDay: json["is_day"],
    precipIn: json["precip_in"]?.toDouble(),
    heatindexC: json["heatindex_c"]?.toDouble(),
    windDir: json["wind_dir"],
    gustMph: json["gust_mph"]?.toDouble(),
    pressureIn: json["pressure_in"]?.toDouble(),
    gustKph: json["gust_kph"]?.toDouble(),
    precipMm: json["precip_mm"]?.toDouble(),
    condition: Condition.fromJson(json["condition"]),
    visKm: json["vis_km"],
    pressureMb: json["pressure_mb"],
    visMiles: json["vis_miles"],
    snowCm: json["snow_cm"] != null ? json["snow_cm"].toInt() : 0,
    willItRain: json["will_it_rain"],
    diffRad: json["diff_rad"]?.toDouble(),
    chanceOfRain: json["chance_of_rain"],
    shortRad: json["short_rad"]?.toDouble(),
    willItSnow: json["will_it_snow"],
    timeEpoch: json["time_epoch"],
    time: json["time"],
    chanceOfSnow: json["chance_of_snow"]?.toDouble(),
  );

  Map<dynamic, dynamic> toJson() => {
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "wind_degree": windDegree,
    "windchill_f": windchillF,
    "windchill_c": windchillC,
    "last_updated_epoch": lastUpdatedEpoch,
    "temp_c": tempC,
    "temp_f": tempF,
    "cloud": cloud,
    "wind_kph": windKph,
    "wind_mph": windMph,
    "humidity": humidity,
    "dewpoint_f": dewpointF,
    "uv": uv,
    "last_updated": lastUpdated,
    "heatindex_f": heatindexF,
    "dewpoint_c": dewpointC,
    "is_day": isDay,
    "precip_in": precipIn,
    "heatindex_c": heatindexC,
    "wind_dir": windDir,
    "gust_mph": gustMph,
    "pressure_in": pressureIn,
    "gust_kph": gustKph,
    "precip_mm": precipMm,
    "condition": condition.toJson(),
    "vis_km": visKm,
    "pressure_mb": pressureMb,
    "vis_miles": visMiles,
    "snow_cm": snowCm,
    "will_it_rain": willItRain,
    "diff_rad": diffRad,
    "chance_of_rain": chanceOfRain,
    "short_rad": shortRad,
    "will_it_snow": willItSnow,
    "time_epoch": timeEpoch,
    "time": time,
    "chance_of_snow": chanceOfSnow,
  };
}
