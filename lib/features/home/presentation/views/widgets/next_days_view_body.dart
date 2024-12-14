// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weatherly_forecasts/features/home/data/model/forecastday_model.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/widgets/next_days_view_app_bar.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/widgets/next_days_view_day_item.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/widgets/next_days_view_tomorrow.dart';


class NextDaysViewBody extends StatelessWidget {
  final Forecastday tomorrow;
  final List<Forecastday> days;
  const NextDaysViewBody({super.key, required this.days, required this.tomorrow});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
        child: Column(
          children: [
            const NextDaysViewAppBar(),
            SizedBox(height: screenHeight/20,),
            NextDaysViewTomorrow(tomorrow: tomorrow,),
            Flexible(
              child: ListView.builder(
                itemCount: days.length,
                itemBuilder: (context, index) {
                  log("Index : $index");
                  return NextDaysViewDayItem( day: days[index],);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
