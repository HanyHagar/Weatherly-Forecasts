import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:weatherly_forecasts/const/const_text.dart';
import 'package:weatherly_forecasts/features/home/data/model/weather_model.dart';

class HiveServices{
  final _box  = Hive.openBox<WeatherModel>(kHiveBox);
  Future<Iterable<WeatherModel>> fetchHiveWeather() async {
    var box = await _box;
    log("Hive Data : ${box.values.length}");
    return box.values.toList();
}
  Future<Iterable<WeatherModel>> addHiveWeather(WeatherModel model) async {
    var box = await _box;
    log("Hive Data : ${box.values.length}");
    await box.add(model);
    return box.values;
  }
  Future<Iterable<WeatherModel>> updateHiveWeather(WeatherModel model) async {
    var box = await _box;
    await box.putAt(0, model);
    return box.values;
  }
}