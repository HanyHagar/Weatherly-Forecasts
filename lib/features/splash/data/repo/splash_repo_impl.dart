import 'package:dartz/dartz.dart';
import 'package:weatherly_forecasts/core/errors/failure.dart';
import 'package:weatherly_forecasts/core/utils/location_service.dart';
import 'package:weatherly_forecasts/features/splash/data/models/location_model.dart';

import 'splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  @override
  Future<Either<Failure, LocationModel>> getLocation() async {
    try {
      var position = await LocationService().getCurrentLocation();
      // Map the Position to LocationModel
      LocationModel locationModel = LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
        altitude: position.altitude,
        speed: position.speed,
        speedAccuracy: position.speedAccuracy,
        heading: position.heading,
        time: position.timestamp.millisecondsSinceEpoch.toDouble(),
        isMock: position.isMocked,
      );

      return right(locationModel);
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
