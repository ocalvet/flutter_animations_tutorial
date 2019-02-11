import 'package:flutter/material.dart';
import 'package:flutter_animations_tutorial/rotating_square.dart';

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: FlutterAnimationsTester(),
    // );
    return MaterialApp(
      // home: StaggerAnimationWidget(),
      home: Stack(
        children: [
          Positioned(
            left: 20,
            top: 50,
            child: RotatingSquare(),
          )
        ],
      ),
    );
  }
}
