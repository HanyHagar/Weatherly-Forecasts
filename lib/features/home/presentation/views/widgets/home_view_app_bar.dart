
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherly_forecasts/features/home/data/model/location_model.dart';

import '../../../../../core/utils/styles.dart';

class HomeViewAppBar extends StatelessWidget {
  final Location location;
  const HomeViewAppBar({
    super.key, required this.location,
  });


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Row(
      children: [
        const SizedBox(height: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    "📍${location.name} ",
                  style: Styles.textStyle700.copyWith(color: Colors.white.withOpacity(0.9),fontSize: 13.sp ),
                  textAlign: TextAlign.start,
                ),
                Icon(CupertinoIcons.arrow_up_right,color: Styles.whiteColor,size: mediaQuery.width/20,)
              ],
            ),
             Text(
              "Good Morning",
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
