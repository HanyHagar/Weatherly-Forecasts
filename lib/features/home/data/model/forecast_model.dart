import 'package:hive/hive.dart';
import 'forecastday_model.dart';

part 'forecast_model.g.dart'; // Required for Hive code generation.

@HiveType(typeId: 4) // Assign a unique typeId for this Hive object.
class Forecast {
  @HiveField(0) // Assign a unique index to each field.
  List<Forecastday> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<dynamic, dynamic> json) => Forecast(
    forecastday: List<Forecastday>.from(
      json["forecastday"].map((x) => Forecastday.fromJson(x)),
    ),
  );

  Map<dynamic, dynamic> toJson() => {
    "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
  };
}
