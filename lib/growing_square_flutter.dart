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
  Animation<double> _opacityAnimation;
  Animation<Offset> _slideAnmation;
  @override
  void initState() {
    super.initState();
    this.setState(() {
      _animationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 3000));
      _mainAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
      );
      _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            0.0,
            1.0,
            curve: Curves.ease,
          ),
        ),
      );
      _slideAnmation = Tween(
        begin: Offset(0, 0),
        end: Offset(0.2, 1),
      ).animate(_mainAnimation);
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        'rendering ${(_opacityAnimation != null ? _opacityAnimation?.value : 0).toString()}');
    return SlideTransition(
      position: _slideAnmation,
      child: GestureDetector(
        child: Opacity(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          opacity: 1,
        ),
        onTap: () {
          _animationController.reset();
          _animationController.forward();
        },
      ),
    );
  }
}
