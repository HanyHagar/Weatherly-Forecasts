
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherly_forecasts/features/home/data/model/location_model.dart';

import '../../../../../core/utils/styles.dart';

class HomeViewAppBar extends StatelessWidget {
  final Location location;
  final String welcomeText;
  const HomeViewAppBar({
    super.key, required this.location, required this.welcomeText,
  });


  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    return Row(
      children: [
        const SizedBox(height: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    "📍${location.name}",
                  style: Styles.textStyle700.copyWith(color: Colors.white.withOpacity(0.9),fontSize: 16.sp ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
             Text(
              welcomeText,
              style: Styles.textStyle500.copyWith(color: Colors.white.withOpacity(0.9),fontSize: 23.sp ),
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}

// GestureDetector(
// child: Container(
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// border: Border.all(
// color: Styles.whiteColor,
// width: 2,
// )
// ),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Icon(
// CupertinoIcons.ellipsis_vertical,
// color: Styles.whiteColor,
// size: mediaQuery.width/17,
// weight: 2,
// ),
// ),
// ),
// ),
