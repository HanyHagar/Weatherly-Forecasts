import 'package:flutter/material.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';
import 'package:weatherly_forecasts/features/home/data/model/forecastday_model.dart';
import 'package:weatherly_forecasts/generated/assets.dart';

import 'next_days_view_tomorrow_item.dart';

class NextDaysViewTomorrow extends StatelessWidget {
  final Forecastday tomorrow;
  const NextDaysViewTomorrow({super.key, required this.tomorrow});

  @override
  Widget build(BuildContext context) {
    var screenWeight = MediaQuery.sizeOf(context).height;
    var screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: double.infinity,
      height: screenHeight/3,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Transform.translate(
        offset: Offset(0, -screenHeight/60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        Assets.images2,
                        width: screenWeight/5,
                        height: screenHeight/5,
                        fit: BoxFit.fill,
                      ),
                      Transform.translate(
                        offset: Offset(screenWeight/35, screenHeight/13),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${tomorrow.day.maxtempC.toInt().toString()}º',
                              style: Styles.textStyle30.copyWith(
                                  fontSize: screenWeight/15,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              '/${tomorrow.day.mintempC.toInt().toString()}º',
                              style: Styles.textStyle30.copyWith(
                                  fontSize: screenWeight/30,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(flex:1,child: SizedBox(),),
                        Text(
                          'Tomorrow',
                          style: Styles.textStyle30.copyWith(
                            fontSize: screenWeight/35,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Expanded(
                          flex: 2,
                          child: Text(
                            tomorrow.day.condition.text.toString(),
                            maxLines: 2,
                            style: Styles.textStyle30.copyWith(
                                fontSize: screenWeight/35,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -screenHeight/40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NextDaysViewTomorrowItem(screenHeight: screenHeight, screenWeight: screenWeight,image:Assets.imagesPrecipitation,tittle: 'Precipitation',data: '${tomorrow.day.totalprecipIn.toInt().toString()}%',),
                  NextDaysViewTomorrowItem(screenHeight: screenHeight, screenWeight: screenWeight,image:Assets.imagesHumidity,tittle: 'Humidity',data: '${tomorrow.day.avghumidity.toInt().toString()}%',),
                  NextDaysViewTomorrowItem(screenHeight: screenHeight, screenWeight: screenWeight,image:Assets.imagesAirQuality,tittle: 'Wind Speed',data: '${tomorrow.day.maxwindKph.toInt().toString()} km/h',changeImageColor: true,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

