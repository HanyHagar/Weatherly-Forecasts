import 'package:dartz/dartz.dart';
import 'package:weatherly_forecasts/core/errors/failure.dart';
import 'package:weatherly_forecasts/features/splash/data/models/location_model.dart';

abstract class SplashRepo {
  Future<Either<Failure, LocationModel>> getLocation();
}
