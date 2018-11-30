import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class GrowingSquare extends StatefulWidget {
  @override
  _GrowingSquareState createState() => _GrowingSquareState();
}

class _GrowingSquareState extends State<GrowingSquare>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    print('setting state');
    controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
          print(animation.value);
        });
      })
      ..addStatusListener((state) {
        print("$state");
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
    return Container(
      width: animation?.value,
      height: animation?.value,
      color: Colors.green,
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
