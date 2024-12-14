import 'package:flutter/material.dart';
import 'package:weatherly_forecasts/core/utils/styles.dart';

class NextDaysViewAppBar extends StatelessWidget {
  const NextDaysViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: screenWidth*0.06,
          decoration: BoxDecoration(
            color: Colors.grey.shade300.withOpacity(0.5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:  EdgeInsetsDirectional.only(start: screenWidth*0.02),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: screenWidth * 0.06,
            ),
          ),
        ),
      ),
      title:Text(
        'Next Days',
        style: Styles.textStyle30.copyWith(
          fontSize: screenWidth/14,
          fontWeight: FontWeight.w700
        )
      ),
    );
  }
}
