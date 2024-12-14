part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class FetchWeatherLoading extends HomeState {}
final class FetchWeatherSuccess extends HomeState {
  final WeatherModel model;
  FetchWeatherSuccess({
    required this.model,
  });
}
final class FetchWeatherFailure extends HomeState {
  final String error;
  FetchWeatherFailure({
    required this.error,
  });
}

final class FetchHiveWeatherLoading extends HomeState {}
final class FetchHiveWeatherSuccess extends HomeState {
  final WeatherModel model;
  FetchHiveWeatherSuccess({
    required this.model,
  });
}
final class FetchHiveWeatherFailure extends HomeState {
  final String error;
  FetchHiveWeatherFailure({
    required this.error,
  });
}

final class UpdateHiveWeatherLoading extends HomeState {}
final class UpdateHiveWeatherSuccess extends HomeState {
  final WeatherModel model;
  UpdateHiveWeatherSuccess({
    required this.model,
  });
}
final class UpdateHiveWeatherFailure extends HomeState {
  final String error;
  UpdateHiveWeatherFailure({
    required this.error,
  });
}

final class AddHiveWeatherLoading extends HomeState {}
final class AddHiveWeatherSuccess extends HomeState {
  final WeatherModel model;
  AddHiveWeatherSuccess({
    required this.model,
  });
}
final class AddHiveWeatherFailure extends HomeState {
  final String error;
  AddHiveWeatherFailure({
    required this.error,
  });
}

final class WeatherDataFailure extends HomeState {
  final String error;
  WeatherDataFailure({
    required this.error,
  });
}

