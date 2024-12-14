import 'dart:convert';
import 'package:hive/hive.dart';
import 'current_model.dart';
import 'forecast_model.dart';
import 'location_model.dart';

part 'weather_model.g.dart'; // Required for Hive Type Adapter generation

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

@HiveType(typeId: 0) // Assign a unique typeId for WeatherModel
class WeatherModel {
    WeatherModel( {
        required this.current,
        required this.location,
        required this.forecast,
    });

    @HiveField(0)
    final Current current;

    @HiveField(1)
    final Location location;

    @HiveField(2)
    final Forecast forecast;

    factory WeatherModel.fromJson(Map<dynamic, dynamic> json) => WeatherModel(
        current: Current.fromJson(json["current"]),
        location: Location.fromJson(json["location"]),
        forecast: Forecast.fromJson(json["forecast"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "current": current.toJson(),
        "location": location.toJson(),
        "forecast": forecast.toJson(),
    };
}

