import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherly_forecasts/const/const_text.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';

import '../../../../../generated/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Spacer(flex: 4),
          Transform.translate(
            offset: Offset(screenData.height/50, 0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 20, end: 20),
                  child: Image.asset(
                    Assets.images7, // Replace hardcoded path with constants
                    height: screenData.height /
                        2.5, // Slightly reduced for better scaling
                    fit:
                    BoxFit.contain, // Changed for better proportional scaling
                    color: Colors.black26,
                  ),
                ),
                Image.asset(
                  Assets.images7,
                  height: screenData.height / 2.5,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          const Spacer(flex: 1),
          Text(
            kName,
            maxLines: 1,
            style: Styles.textStyle900.copyWith(fontSize: 30.sp),
          ),
          const Spacer(flex: 1),
          Text(
            kSplashArTittle,
            maxLines: 8,
            style: Styles.textStyle500.copyWith(fontSize: 15.sp),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 2),
          RichText(
            text: TextSpan(
              style: Styles.textStyle500.copyWith(fontSize: 15.sp),
              children: [
                TextSpan(
                  text: 'By',
                  style: Styles.textStyle900.copyWith(fontSize: 10.sp),
                ),
                TextSpan(
                  text: ' Al Rammah',
                  style: Styles.textStyle700.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
