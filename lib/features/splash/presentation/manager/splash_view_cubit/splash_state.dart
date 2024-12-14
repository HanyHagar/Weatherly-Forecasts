part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class GetLocationLoading extends SplashState {}

final class GetLocationSuccess extends SplashState {
  final LocationModel model;
  GetLocationSuccess({required this.model});
}

final class GetLocationFailure extends SplashState {
  final String error;

  GetLocationFailure({required this.error});
}
