import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';

class HomeViewSubWeatherItem extends StatelessWidget {
  const HomeViewSubWeatherItem({
    super.key,
    required this.image,
    required this.tittle,
    required this.description,
  });
  final String image;
  final String tittle;
  final String description;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: mediaQuery.width / 7,
            height: mediaQuery.height / 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tittle,
                style: Styles.textStyle500.copyWith(
                  fontSize: 12.sp,
                ),
              ),
              Text(
                description,
                maxLines: 1,
                style: Styles.textStyle500.copyWith(
                  fontSize: 14.sp,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
