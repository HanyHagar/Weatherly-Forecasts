import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly_forecasts/core/widgets/background_Widget.dart';
import 'package:weatherly_forecasts/core/widgets/snack_bar_widget.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/home_view.dart';
import 'package:weatherly_forecasts/features/splash/data/repo/splash_repo.dart';
import 'package:weatherly_forecasts/features/splash/data/repo/splash_repo_impl.dart';
import 'package:weatherly_forecasts/features/splash/presentation/manager/splash_view_cubit/splash_cubit.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var repo = SplashRepoImpl();
    return BlocProvider(
      create: (context) => SplashCubit(repo as SplashRepo)..getLocation(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is GetLocationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBarWidget.create(
                title: 'Unable to Access Location Data',
                message: state.error.toString(),
                type: ContentType.warning,
              ),
            );
          }
          if (state is GetLocationSuccess) {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) =>  HomeView(locationModel:state.model,),
            ));
          }
        },
        builder: (context, state) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body:Stack(
              children: [
                BackgroundWidget(),
                SplashViewBody(),
              ],
            ),
          );
        },
      ),
    );
  }
}
