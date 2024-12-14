import 'package:flutter/material.dart';

import 'home_view_sub_weather_item.dart';
class HomeViewSubWeatherDetailsLine extends StatelessWidget {
  final String image1;
  final String title1;
  final String description1;
  final String image2;
  final String title2;
  final String description2;
  final bool isEnableDivider;

  const HomeViewSubWeatherDetailsLine({
    super.key,
    required this.image1,
    required this.title1,
    required this.description1,
    required this.image2,
    required this.title2,
    required this.description2,
    this.isEnableDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HomeViewSubWeatherItem(
              image: image1,
              tittle: title1,
              description: description1,
            ),
            const Expanded(child: SizedBox()), // Spacer between the two widgets
            HomeViewSubWeatherItem(
              image: image2,
              tittle: title2,
              description: description2,
            ),
          ],
        ),
        if (isEnableDivider)
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
      ],
    );
  }
}
