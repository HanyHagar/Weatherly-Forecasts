import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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

  Future<void> fetchWeather(
      {required String location, required String lang}) async {
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

  Future<void> fetchHiveWeather(
      {bool fetchWeatherError = false, bool needUpdates = true}) async {
    emit(FetchHiveWeatherLoading());
    var result = await homeRepo.fetchHiveWeather();
    result.fold((failure) {
      if (fetchWeatherError == true) {
        emit(FetchHiveWeatherFailure(error: failure.errMessage));
      } else {
        addHiveWeather(
          model: weatherModel,
        );
      }
    }, (model) {
      if (fetchWeatherError == false && needUpdates == true) {
        updateHiveWeather(model: weatherModel);
      } else {
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
    var result = await homeRepo.updateHiveWeather(model: model);
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
      var time = DateFormat('yyyy-MM-dd HH')
          .format(DateTime.parse(data.hour[item].time.toString()));
      if (now == time) {
        indexOfCurrentDay = item;
        data.hour[indexOfCurrentDay].time =
            DateFormat('EEEE, d, h:mm a').format(DateTime.now()).toString();
        return data.hour[indexOfCurrentDay];
      }
    }
    return data.hour[indexOfCurrentDay];
  }

  Forecastday tomorrow(List<Forecastday> days) {
    int currentDay = indexOfCurrentForecastModel(days);
    if (currentDay == days.length - 1) {
      var day = days[currentDay];
      return day;
    } else {
      var day = days[currentDay + 1];
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

  int averageAirQuality(
      {required int humidity,
      required double precipitation,
      required double windSpeed}) {
    var airQuality =
        (humidity * 0.3) + (1 - precipitation) * 0.4 + (windSpeed * 0.3);
    return airQuality.toInt();
  }

  String getWeatherIcon(int weatherCode) {
    switch (weatherCode) {
      case 1087:
      case 1273:
      case 1276:
      case 1279:
      case 1282:
        return "assets/images/1.png";
      case 1180:
      case 1183:
      case 1063:
      case 1150:
      case 1153:
      case 1186:
      case 1189:
      case 1240:
        return "assets/images/2.png";
      case 1192:
      case 1195:
      case 1201:
      case 1243:
      case 1246:
        return "assets/images/3.png";
      case 1066:
      case 1069:
      case 1072:
      case 1114:
      case 1117:
      case 1171:
      case 1198:
      case 1204:
      case 1207:
      case 1210:
      case 1213:
      case 1216:
      case 1219:
      case 1222:
      case 1225:
      case 1237:
      case 1249:
      case 1252:
      case 1255:
      case 1258:
      case 1261:
      case 1264:
      case 1168:
        return "assets/images/4.png";
      case 1030:
      case 1035:
      case 1147:
        return "assets/images/5.png";
      case 1000:
        return "assets/images/6.png";
      case 1003:
        return "assets/images/7.png";
      case 1006:
      case 1009:
        return "assets/images/8.png";
      default:
        return "assets/images/9.png";
    }
  }


  String setWelcomeText({required String sunrise, required String sunset}) {
    // Get the current time in 'yyyy-MM-dd HH' format
    var now = DateFormat('HH').format(DateTime.now());
    var sunriseTime = DateFormat('HH').parse(sunrise);
    var sunsetTime = DateFormat('HH').parse(sunset);
    var currentTime = DateFormat('HH').parse(now);

    if (currentTime.isBefore(sunsetTime) && currentTime.isAfter(sunriseTime)) {
      return 'Good Morning';
    } else {
      return 'Good Evening';
    }
  }}
