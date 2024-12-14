import 'package:dartz/dartz.dart';
import 'package:weatherly_forecasts/core/errors/failure.dart';
import 'package:weatherly_forecasts/features/home/data/model/weather_model.dart';

abstract class HomeRepo{
  Future<Either<Failure, WeatherModel>> fetchWeather({required  String location,required String lang});
  Future<Either<Failure, WeatherModel>> fetchHiveWeather();
  Future<Either<Failure, WeatherModel>> addHiveWeather({required  WeatherModel model});
  Future<Either<Failure, WeatherModel>> updateHiveWeather({required  WeatherModel model});
}