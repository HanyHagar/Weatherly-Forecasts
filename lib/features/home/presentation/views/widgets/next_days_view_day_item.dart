import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weatherly_forecasts/core/utils/api_services.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';
import 'package:weatherly_forecasts/features/home/data/model/forecastday_model.dart';
import 'package:weatherly_forecasts/features/home/data/repo/home_repo_impl.dart';
import 'package:weatherly_forecasts/features/home/presentation/manager/home_cubit.dart';

class NextDaysViewDayItem extends StatelessWidget {
  final Forecastday day;
  const NextDaysViewDayItem({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ignore: sized_box_for_whitespace
        Expanded(
          flex: 3,
          child: Text(
            day.date.toString().isNotEmpty
                ? ' ${DateFormat('EEEE').format(DateTime.parse(day.date.toString(),),)}' // Only day name
                : 'Invalid date',
            style: Styles.textStyle700.copyWith(fontSize: 13.sp),
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                HomeCubit(HomeRepoImpl(ApiServices())).getWeatherIcon(day.day.condition.code),
                width: mediaQuery.width / 12,
                height: mediaQuery.height / 12,
              ),
              Expanded(
                child: Text(
                  day.day.condition.text.toString(),
                  style: Styles.textStyle500.copyWith(fontSize: 10.sp),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${day.day.maxtempC.toInt()}° ',
                style: Styles.textStyle700.copyWith(fontSize: 15.sp),
              ),
              Text(
                ' ${day.day.mintempC.toInt()}° ',
                style: Styles.textStyle700.copyWith(fontSize: 15.sp),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
