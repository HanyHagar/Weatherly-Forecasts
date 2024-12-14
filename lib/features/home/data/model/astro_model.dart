import 'package:hive/hive.dart';

part 'astro_model.g.dart'; // Required for generated code

@HiveType(typeId: 6) // Assign a unique type ID for the `Astro` class
class Astro extends HiveObject {
  @HiveField(0)
  String moonset;

  @HiveField(1)
  int moonIllumination;

  @HiveField(2)
  String sunrise;

  @HiveField(3)
  String moonPhase;

  @HiveField(4)
  String sunset;

  @HiveField(5)
  int isMoonUp;

  @HiveField(6)
  int isSunUp;

  @HiveField(7)
  String moonrise;

  Astro({
    required this.moonset,
    required this.moonIllumination,
    required this.sunrise,
    required this.moonPhase,
    required this.sunset,
    required this.isMoonUp,
    required this.isSunUp,
    required this.moonrise,
  });

  factory Astro.fromJson(Map<dynamic, dynamic> json) => Astro(
    moonset: json["moonset"],
    moonIllumination: json["moon_illumination"],
    sunrise: json["sunrise"],
    moonPhase: json["moon_phase"],
    sunset: json["sunset"],
    isMoonUp: json["is_moon_up"],
    isSunUp: json["is_sun_up"],
    moonrise: json["moonrise"],
  );

  Map<dynamic, dynamic> toJson() => {
    "moonset": moonset,
    "moon_illumination": moonIllumination,
    "sunrise": sunrise,
    "moon_phase": moonPhase,
    "sunset": sunset,
    "is_moon_up": isMoonUp,
    "is_sun_up": isSunUp,
    "moonrise": moonrise,
  };
}
