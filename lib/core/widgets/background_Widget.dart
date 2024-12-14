// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(100, 100),
          child: Container(
            width: mediaQuery.width / 2, // Smaller size for the circle
            height: mediaQuery.height / 2,
            decoration:  BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.5),
                  blurRadius: 100,
                  spreadRadius: mediaQuery.width/2, // Ensures the blur spreads evenly around the circle
                  offset: const Offset(0, 0), // Centers the shadow around the circle
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(100, -100),
          child: Container(
            width: mediaQuery.width / 2, // Smaller size for the circle
            height: mediaQuery.height / 2,
            decoration:  BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.orange,
                  blurRadius: 50,
                  spreadRadius: mediaQuery.width/2, // Ensures the blur spreads evenly around the circle
                  offset: const Offset(0, 0), // Centers the shadow around the circle
                ),
              ],
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
          ),
        ),
      ],
    );
  }
}
