import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedSquare extends AnimatedWidget {
  AnimatedSquare({Key key, Animation<double> animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.rotate(
        child: Container(
          width: animation?.value,
          height: animation?.value,
          color: Colors.green,
        ),
        angle: animation == null ? 0 : (animation.value) * pi / 180,
      );
  }
}