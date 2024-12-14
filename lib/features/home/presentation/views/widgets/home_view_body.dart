import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly_forecasts/features/home/data/model/weather_model.dart';
import 'package:weatherly_forecasts/features/home/presentation/manager/home_cubit.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/widgets/home_view_main_weather_details.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/widgets/home_view_next_days.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/widgets/home_view_sub_weather_details.dart';
import 'home_view_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  final WeatherModel model;
  const HomeViewBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        var location = model.location;
        var forecast = model.forecast;
        var currentHour = homeCubit.currentHourData(forecast.forecastday);
        var currentForecast = homeCubit.currentForecastModel(forecast.forecastday);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                HomeViewAppBar(
                  location: location,
                ),
                const Spacer(),
                HomeViewMainWeatherDetails(
                  current: currentHour,
                ),
                const Spacer(),
                HomeViewNextDays(
                  tomorrow: homeCubit.tomorrow(forecast.forecastday),
                  days: homeCubit.nextDays(forecast.forecastday),
                ),
                const Spacer(),
                HomeViewSubWeatherDetails(
                  current: currentHour,
                  astro: currentForecast.astro,
                  airQuality: homeCubit.averageAirQuality(
                    humidity: currentHour.humidity,
                    precipitation: currentHour.precipIn,
                    windSpeed: currentHour.windKph,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}


