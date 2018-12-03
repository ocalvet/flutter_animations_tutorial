import 'package:flutter/material.dart';

class FlutterAnimationsTester extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateFlutterAnimationsTester();
  }
}

class _StateFlutterAnimationsTester extends State<FlutterAnimationsTester>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _mainAnimation;
  Animation<Offset> _slideAnmation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _mainAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
    );
    _slideAnmation = Tween(
      begin: Offset(0, 0),
      end: Offset(0, 1),
    ).animate(_mainAnimation);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnmation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}
