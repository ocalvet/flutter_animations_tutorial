import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GrowingSquare extends StatefulWidget {
  @override
  _GrowingSquareState createState() => _GrowingSquareState();
}

class _GrowingSquareState extends State<GrowingSquare>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> rotation;
  AnimationController controller;
  bool stop = false;

  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    rotation = Tween(begin: 0.0, end: 360.0).animate(controller)
      ..addListener(() {
        // Listen to animation changes in value here
        // print('rot:${rotation.value}');
        // print('width:${animation.value}');
        // print('height:${animation.value}');
      });
    animation = Tween(begin: 0.0, end: 360.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
          print(animation.value);
        });
      })
      ..addStatusListener((state) {
        if (AnimationStatus.completed == state) {
          controller.reverse();
        } else if (AnimationStatus.dismissed == state) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.setState(() {
          stop = !stop;
          stop
              ? controller.stop()
              : controller.status == AnimationStatus.forward
                  ? controller.forward()
                  : controller.reverse();
        });
      },
      child: Transform.rotate(
        child: Container(
          width: animation?.value,
          height: animation?.value,
          color: Colors.green,
        ),
        angle: rotation == null ? 0 : (rotation.value) * pi / 180,
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
