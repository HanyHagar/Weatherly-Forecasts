
import 'package:flutter/material.dart';

import 'background_Widget.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BackgroundWidget(),
          SafeArea(child: Center(child: CircularProgressIndicator(),)),
        ],
      ),
    );
  }
}
