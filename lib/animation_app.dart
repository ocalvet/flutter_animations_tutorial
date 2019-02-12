import 'package:flutter/material.dart';
import 'package:flutter_animations_tutorial/rotating_text/rotating_square.dart';

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sampleText = 'TEST';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Positioned(
            left: 120,
            top: 150,
            child: RotatingSquare(
              displayText: sampleText,
            ),
          )
        ],
      ),
    );
  }
}
