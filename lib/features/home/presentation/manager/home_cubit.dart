// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:weatherly_forecasts/features/home/data/model/current_model.dart';
import 'package:weatherly_forecasts/features/home/data/model/forecastday_model.dart';
import 'package:weatherly_forecasts/features/home/data/model/weather_model.dart';
import 'package:weatherly_forecasts/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  final HomeRepo homeRepo;
  late WeatherModel weatherModel;

  Future<void> fetchWeather({required String location , required String lang }) async {
    emit(FetchWeatherLoading());
    var result = await homeRepo.fetchWeather(location: location, lang: lang);
    result.fold((failure) {
      emit(FetchWeatherFailure(error: failure.errMessage));
      fetchHiveWeather(fetchWeatherError: true);
    }, (model) {
      emit(FetchWeatherSuccess(model: model));
      weatherModel = model;
      fetchHiveWeather();
    });
  }

  Future<void> fetchHiveWeather({ bool fetchWeatherError = false, bool needUpdates = true}) async {
    emit(FetchHiveWeatherLoading());
    var result = await homeRepo.fetchHiveWeather();
    result.fold((failure) {
      if(fetchWeatherError == true ){
        emit(FetchHiveWeatherFailure(error: failure.errMessage));
      }
      else{
        addHiveWeather(model: weatherModel, );
      }
    }, (model) {
      if(fetchWeatherError == false && needUpdates == true){
        updateHiveWeather(model: model);
      }
      else {
        emit(FetchHiveWeatherSuccess(model: model));
      }
    });
  }

  Future<void> addHiveWeather({required WeatherModel model}) async {
    emit(AddHiveWeatherLoading());
    var result = await homeRepo.addHiveWeather(model: model);
    result.fold((failure) {
      emit(AddHiveWeatherFailure(error: failure.errMessage));
    }, (model) {
      emit(AddHiveWeatherSuccess(model: model));
      fetchHiveWeather(needUpdates: false);
    });
  }

  Future<void> updateHiveWeather({required WeatherModel model}) async {
    emit(UpdateHiveWeatherLoading());
    var result = await homeRepo.fetchHiveWeather();
    result.fold((failure) {
      emit(UpdateHiveWeatherFailure(error: failure.errMessage));
    }, (model) {
      emit(UpdateHiveWeatherSuccess(model: model));
      fetchHiveWeather(needUpdates: false);
    });
  }

  int indexOfCurrentForecastModel(List<Forecastday> days) {
    int indexOfCurrentDay = 0;
    var now = DateFormat('yyyy-MM-dd').format(DateTime.now());
    for (int item = 0; item < days.length; item++) {
      // ignore: unrelated_type_equality_checks
      if (now == days[item].date) {
        indexOfCurrentDay = item;
        break;
      }
    }
    return indexOfCurrentDay;
  }

  Forecastday currentForecastModel(List<Forecastday> days) {
    int indexOfCurrentDay = indexOfCurrentForecastModel(days);
    return days[indexOfCurrentDay];
  }

  Current currentHourData(List<Forecastday> days) {
    Forecastday data = currentForecastModel(days);
    int indexOfCurrentDay = 0;
    var now = DateFormat('yyyy-MM-dd HH').format(DateTime.now());
    for (int item = 0; item < data.hour.length; item++) {
      var time = DateFormat('yyyy-MM-dd HH').format(DateTime.parse(data.hour[item].time.toString()));
      if (now == time) {
        indexOfCurrentDay = item;
        data.hour[indexOfCurrentDay].time = DateFormat('EEEE, d, h:mm a').format(DateTime.now()).toString();
        return data.hour[indexOfCurrentDay];
      }
    }
    return data.hour[indexOfCurrentDay];
  }

  Forecastday tomorrow(List<Forecastday> days){
    int currentDay = indexOfCurrentForecastModel(days);
    if(currentDay == days.length-1){
      var day = days[currentDay];
      return day;
    }
    else{
      var day = days[currentDay+1];
      return day;
    }
  }

  List<Forecastday> nextDays(List<Forecastday> days) {
    if (days.length > 2) {
      return days.sublist(2);
    } else {
      return [];
    }
  }

  int averageAirQuality({required int humidity , required double precipitation , required double windSpeed}){
    var airQuality = (humidity * 0.3) + (1 - precipitation) * 0.4 + (windSpeed * 0.3);
    return airQuality.toInt();
  }

}
