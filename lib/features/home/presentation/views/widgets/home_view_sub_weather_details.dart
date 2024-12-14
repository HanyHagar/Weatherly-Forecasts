import 'package:flutter/material.dart';
import 'package:weatherly_forecasts/features/home/data/model/astro_model.dart';
import 'package:weatherly_forecasts/features/home/data/model/current_model.dart';
import 'package:weatherly_forecasts/generated/assets.dart';

import 'home_view_sub_weather_details_line.dart';

class HomeViewSubWeatherDetails extends StatelessWidget {
  final Astro astro;
  final Current current;
  final int airQuality;

  const HomeViewSubWeatherDetails({super.key, required this.astro, required this.current, required this.airQuality});


  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -30),
      child:  Column(
        children: [
          HomeViewSubWeatherDetailsLine(
            image1: Assets.imagesSunrise,
            title1: "Sunrise",
            description1: astro.sunrise,
            image2: Assets.imagesSunset,
            title2: "Sunset",
            description2: astro.sunset,
          ),
           HomeViewSubWeatherDetailsLine(
            image1: Assets.imagesAirQuality,
            title1: "Air Quality",
            description1: "${airQuality.toString()} %",
            image2: Assets.imagesHumidity,
            title2: "Humidity",
            description2: "${current.humidity}%",
           ),
           HomeViewSubWeatherDetailsLine(
            image1: Assets.imagesPrecipitation,
            title1: "Precipitation",
            description1: "${current.precipIn.toInt()}%",
            image2: Assets.images2,
            title2: "Light Rain",
            description2: "${current.chanceOfRain}%",
            isEnableDivider: false,
          ),
        ],
      ),
    );
  }
}
