import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';

import 'background_Widget.dart';

class FailureView extends StatelessWidget {
  const FailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: Center(
              child: Text('No Weather Data',style: Styles.textStyle500.copyWith(fontSize: 14.sp),),
            ),
          ),
        ],
      ),
    );
  }
}
