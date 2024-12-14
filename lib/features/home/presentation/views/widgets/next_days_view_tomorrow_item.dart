import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';

class NextDaysViewTomorrowItem extends StatelessWidget {
  const NextDaysViewTomorrowItem({
    super.key,
    required this.screenHeight,
    required this.screenWeight, required this.image, required this.tittle, required this.data,  this.changeImageColor = false, this.imageColor = Colors.white,
  });

  final double screenHeight;
  final double screenWeight;
  final String image;
  final String tittle;
  final String data;
  final bool changeImageColor;
  final Color imageColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        changeImageColor
            ?Image.asset(
          image,
          height: screenHeight/15,
          width: screenWeight/15,
          color: imageColor,
        )
            :Image.asset(
          image,
          height: screenHeight/15,
          width: screenWeight/15,
        ),
        Text(
          data,
          style: Styles.textStyle700.copyWith(fontSize: 15.sp),
        ),
        Text(
          tittle,
          style: Styles.textStyle700.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}

