import 'package:flutter/material.dart';
import 'package:flutter_animations_tutorial/growing_square.dart';
import 'package:flutter_animations_tutorial/growing_square_flutter.dart';
import 'package:flutter_animations_tutorial/rotating_square.dart';
import 'package:flutter_animations_tutorial/staggered_animations.dart';

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
