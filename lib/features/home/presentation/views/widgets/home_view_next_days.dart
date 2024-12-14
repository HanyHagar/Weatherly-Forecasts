import 'package:flutter/material.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';
import 'package:weatherly_forecasts/features/home/data/model/forecastday_model.dart';
import 'package:weatherly_forecasts/features/home/presentation/views/next_days_view.dart';

class HomeViewNextDays extends StatelessWidget {
  final Forecastday tomorrow;
  final List<Forecastday> days;
  const HomeViewNextDays({
    super.key, required this.days, required this.tomorrow,
  });


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);

    return Transform.translate(
      offset: const Offset(0, -50),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  NextDaysView(tomorrow: tomorrow,days: days,),));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(colors: [Colors.deepPurple,Colors.amber]).createShader(bounds);
                },
                child: const Text(
                  '   Next days',
                  style: Styles.textStyle30,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.arrow_circle_right_rounded,color: Colors.white,size: mediaQuery.width/12,),
            )
          ],
        ),
      ),
    );
  }
}
