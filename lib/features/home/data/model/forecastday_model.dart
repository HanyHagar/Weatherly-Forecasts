import 'package:hive/hive.dart';
import 'astro_model.dart';
import 'current_model.dart';
import 'day_model.dart';

part 'forecastday_model.g.dart'; // Required for Hive code generation.

@HiveType(typeId: 5) // Assign a unique typeId for the Forecastday class.
class Forecastday {
  @HiveField(0) // Unique index for each field.
  DateTime date;

  @HiveField(1)
  Astro astro;

  @HiveField(2)
  int dateEpoch;

  @HiveField(3)
  List<Current> hour;

  @HiveField(4)
  Day day;

  Forecastday({
    required this.date,
    required this.astro,
    required this.dateEpoch,
    required this.hour,
    required this.day,
  });

  factory Forecastday.fromJson(Map<dynamic, dynamic> json) => Forecastday(
    date: DateTime.parse(json["date"]),
    astro: Astro.fromJson(json["astro"]),
    dateEpoch: json["date_epoch"],
    hour: List<Current>.from(json["hour"].map((x) => Current.fromJson(x))),
    day: Day.fromJson(json["day"]),
  );

  Map<dynamic, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "astro": astro.toJson(),
    "date_epoch": dateEpoch,
    "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
    "day": day.toJson(),
  };
}
