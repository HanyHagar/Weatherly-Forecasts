import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:weatherly_forecasts/core/errors/failure.dart';
import 'package:weatherly_forecasts/core/utils/api_services.dart';
import 'package:weatherly_forecasts/core/utils/hive_services.dart';
import 'package:weatherly_forecasts/features/home/data/model/weather_model.dart';
import 'home_repo.dart';


class HomeRepoImpl implements HomeRepo{
  final ApiServices apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, WeatherModel>> fetchWeather({required String location , required String lang}) async {
    try{
      var data = await apiService.fetchWeather(location: location, lang: lang,);
      var weatherModel = WeatherModel.fromJson(data);
      return right(weatherModel);
    }
    catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, WeatherModel>> addHiveWeather({required WeatherModel model }) async {
    try{
      var data = await HiveServices().addHiveWeather(model);
      return right(data.first);
    }
    catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, WeatherModel>> fetchHiveWeather() async {
    try{
      var data = await HiveServices().fetchHiveWeather();
      return right(data.first);
    }
    catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, WeatherModel>> updateHiveWeather({required WeatherModel model}) async {
    try{
      var data = await HiveServices().updateHiveWeather(model);
      return right(data.first);
    }
    catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure.fromHiveError(e),
        );
      }
      return left(
        HiveFailure(
          e.toString(),
        ),
      );
    }
  }



}