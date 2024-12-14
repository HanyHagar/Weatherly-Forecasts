import 'package:hive/hive.dart';
import 'condition_model.dart';

part 'day_model.g.dart'; // Required for generated code

@HiveType(typeId: 7) // Assign a unique type ID for the `Day` class
class Day extends HiveObject {
  @HiveField(0)
  double avgvisKm;

  @HiveField(1)
  double uv;

  @HiveField(2)
  double avgtempF;

  @HiveField(3)
  double avgtempC;

  @HiveField(4)
  int dailyChanceOfSnow;

  @HiveField(5)
  double maxtempC;

  @HiveField(6)
  double maxtempF;

  @HiveField(7)
  double mintempC;

  @HiveField(8)
  double avgvisMiles;

  @HiveField(9)
  int dailyWillItRain;

  @HiveField(10)
  double mintempF;

  @HiveField(11)
  double totalprecipIn;

  @HiveField(12)
  double totalsnowCm;

  @HiveField(13)
  int avghumidity;

  @HiveField(14)
  Condition condition; // Ensure `Condition` is Hive-compatible

  @HiveField(15)
  double maxwindKph;

  @HiveField(16)
  double maxwindMph;

  @HiveField(17)
  int dailyChanceOfRain;

  @HiveField(18)
  double totalprecipMm;

  @HiveField(19)
  int dailyWillItSnow;

  Day({
    required this.avgvisKm,
    required this.uv,
    required this.avgtempF,
    required this.avgtempC,
    required this.dailyChanceOfSnow,
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.avgvisMiles,
    required this.dailyWillItRain,
    required this.mintempF,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avghumidity,
    required this.condition,
    required this.maxwindKph,
    required this.maxwindMph,
    required this.dailyChanceOfRain,
    required this.totalprecipMm,
    required this.dailyWillItSnow,
  });

  factory Day.fromJson(Map<dynamic, dynamic> json) => Day(
    avgvisKm: json["avgvis_km"]?.toDouble(),
    uv: json["uv"]?.toDouble(),
    avgtempF: json["avgtemp_f"]?.toDouble(),
    avgtempC: json["avgtemp_c"]?.toDouble(),
    dailyChanceOfSnow: json["daily_chance_of_snow"],
    maxtempC: json["maxtemp_c"]?.toDouble(),
    maxtempF: json["maxtemp_f"]?.toDouble(),
    mintempC: json["mintemp_c"]?.toDouble(),
    avgvisMiles: json["avgvis_miles"]?.toDouble(),
    dailyWillItRain: json["daily_will_it_rain"],
    mintempF: json["mintemp_f"]?.toDouble(),
    totalprecipIn: json["totalprecip_in"]?.toDouble(),
    totalsnowCm: json["totalsnow_cm"]?.toDouble(),
    avghumidity: json["avghumidity"],
    condition: Condition.fromJson(json["condition"]),
    maxwindKph: json["maxwind_kph"]?.toDouble(),
    maxwindMph: json["maxwind_mph"]?.toDouble(),
    dailyChanceOfRain: json["daily_chance_of_rain"],
    totalprecipMm: json["totalprecip_mm"]?.toDouble(),
    dailyWillItSnow: json["daily_will_it_snow"],
  );

  Map<dynamic, dynamic> toJson() => {
    "avgvis_km": avgvisKm,
    "uv": uv,
    "avgtemp_f": avgtempF,
    "avgtemp_c": avgtempC,
    "daily_chance_of_snow": dailyChanceOfSnow,
    "maxtemp_c": maxtempC,
    "maxtemp_f": maxtempF,
    "mintemp_c": mintempC,
    "avgvis_miles": avgvisMiles,
    "daily_will_it_rain": dailyWillItRain,
    "mintemp_f": mintempF,
    "totalprecip_in": totalprecipIn,
    "totalsnow_cm": totalsnowCm,
    "avghumidity": avghumidity,
    "condition": condition.toJson(),
    "maxwind_kph": maxwindKph,
    "maxwind_mph": maxwindMph,
    "daily_chance_of_rain": dailyChanceOfRain,
    "totalprecip_mm": totalprecipMm,
    "daily_will_it_snow": dailyWillItSnow,
  };
}
