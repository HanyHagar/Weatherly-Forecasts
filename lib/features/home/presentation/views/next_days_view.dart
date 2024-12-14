import 'package:flutter/material.dart';
import 'package:weatherly_forecasts/core/widgets/background_Widget.dart';
import 'package:weatherly_forecasts/features/home/data/model/forecastday_model.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/widgets/next_days_view_body.dart';

class NextDaysView extends StatelessWidget {
  final Forecastday tomorrow;
  final List<Forecastday> days;
  const NextDaysView({super.key, required this.days, required this.tomorrow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackgroundWidget(),
          NextDaysViewBody(
            tomorrow: tomorrow,
            days: days,
          ),
        ],
      ),
    );
  }
}
