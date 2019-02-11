import 'dart:math';

import 'package:flutter/material.dart';

class RotatingSquare extends StatefulWidget {
  @override
  RotaringSquareState createState() => RotaringSquareState();
}

class RotaringSquareState extends State<RotatingSquare>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    controller.repeat();
    controller.addListener(() {
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ControlledRotatingWidget(
      controller: this.controller,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey,
          border: Border.all(width: 5, color: Colors.redAccent),
        ),
        child: Center(
          child: Text(
            'Hello',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 22,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

class ControlledRotatingWidget extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> rotation;
  final Animation<double> size;
  final Widget child;
  ControlledRotatingWidget(
      {Key key, @required this.controller, @required this.child})
      : rotation = Tween(begin: 0.0, end: 2 * pi).animate(controller),
        size = Tween(begin: 0.9, end: 1.2).animate(CurvedAnimation(
          curve: Curves.easeInOut,
          parent: controller,
        )),
        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(size.value, size.value, size.value)
        ..rotateZ(rotation.value),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
      child: child,
    );
  }
}