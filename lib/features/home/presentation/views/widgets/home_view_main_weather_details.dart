
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';
import 'package:weatherly_forecasts/features/home/data/model/current_model.dart';
import 'package:weatherly_forecasts/features/home/presentation/manager/home_cubit.dart';
import 'package:weatherly_forecasts/generated/assets.dart';

class HomeViewMainWeatherDetails extends StatelessWidget {
  final Current current;
  final String  image;
  const HomeViewMainWeatherDetails({super.key, required this.current, required this.image});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Image.asset(
          image,
          width: mediaQuery.width,
          height: mediaQuery.height / 3,
        ),
        Transform.translate(
          offset: Offset(0, -mediaQuery.height /16),
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(mediaQuery.width*0.04, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: current.tempC.toInt().toString(),
                        style: Styles.textStyle500.copyWith(color: Colors.white.withOpacity(0.9),fontSize: 85.sp ),

                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: Offset(0, -mediaQuery.height*0.02),
                          child: Text(
                            "°",
                            style: Styles.textStyle60
                                .copyWith(fontSize: mediaQuery.width / 6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset:  Offset(0, -mediaQuery.height *0.02),
                child: Text(
                  current.condition.text.toString(),
                  style: Styles.textStyle500.copyWith(color: Colors.white.withOpacity(0.9),fontSize: 22.sp ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -20),
                child: Text(
                  current.time.toString(),
                  style: Styles.textStyle500.copyWith(color: Colors.white.withOpacity(0.9),fontSize: 15.sp ),
                ),
              ),
              //
            ],
          ),
        ),
      ],
    );
  }
}
