

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly_forecasts/core/utils/api_services.dart';
import 'package:weatherly_forecasts/core/widgets/background_Widget.dart';
import 'package:weatherly_forecasts/core/widgets/failed_view.dart';
import 'package:weatherly_forecasts/core/widgets/loading_view.dart';
import 'package:weatherly_forecasts/core/widgets/snack_bar_widget.dart';
import 'package:weatherly_forecasts/features/home/data/repo/home_repo_impl.dart';
import 'package:weatherly_forecasts/features/home/presentation/manager/home_cubit.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:weatherly_forecasts/features/splash/data/models/location_model.dart';

class HomeView extends StatelessWidget {
  final LocationModel locationModel;

  const HomeView({super.key, required this.locationModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl(ApiServices()))..fetchWeather(location: "${locationModel.latitude},${locationModel.longitude}", lang: 'en'),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if(state is FetchHiveWeatherSuccess){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBarWidget.create(title: "Success", message: state.model.location.name, type: ContentType.success),

            );
          }
          if(state is FetchWeatherFailure){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBarWidget.create(title: "FAILURE", message: state.error, type: ContentType.failure),
            );
          }
        },
        builder: (context, state) {
          if (state is FetchHiveWeatherSuccess) {
            return Scaffold(
              backgroundColor: Colors.black,
              body:Stack(
                children: [
                  const BackgroundWidget(),
                  HomeViewBody(model: state.model,),
                ],
              ),
            );
          }
          else if (state is FetchHiveWeatherFailure){
            return const FailureView();
          }
          else{
            return const LoadingView();
          }
        },
      ),
    );
  }
}

