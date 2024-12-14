import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly_forecasts/features/splash/data/models/location_model.dart';
import 'package:weatherly_forecasts/features/splash/data/repo/splash_repo.dart';
// ignore: depend_on_referenced_packages

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.splashRepo) : super(SplashInitial());
  final SplashRepo splashRepo;
  static SplashCubit get(context) => BlocProvider.of<SplashCubit>(context);
  Future<void> getLocation() async {
    emit(GetLocationLoading());
    var result = await splashRepo.getLocation();
    result.fold(
      (l) => emit(GetLocationFailure(error: l.errMessage.toString())),
      (r) => emit(GetLocationSuccess(model: r)),
    );
  }
}
