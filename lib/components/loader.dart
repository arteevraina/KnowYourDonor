// Library imports.
import 'dart:math';
import 'package:flutter/material.dart';

// Local imports.
import 'package:knowyourdonor/constants/colors.dart';

// ignore: non_constant_identifier_names
class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  final Color loaderColor = buttonColor;
  AnimationController controller;
  // ignore: non_constant_identifier_names
  Animation<double> rotation_animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    rotation_animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    controller.repeat();
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Center(
        child: RotationTransition(
          turns: rotation_animation,
          child: Stack(
            children: [
              for (var i = 0; i < 8; i++)
                Transform.translate(
                  offset: Offset(30 * cos(i * pi / 4), 30 * sin(i * pi / 4)),
                  child: Dot(
                    radius: 2 + i.toDouble() * 1.5,
                    color: Color.fromARGB(
                        buttonColor.alpha,
                        buttonColor.red - (5 * i),
                        buttonColor.green - (5 * i),
                        buttonColor.blue - (5 * i)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  Dot({this.radius, this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: this.radius,
          height: this.radius,
          decoration: BoxDecoration(color: this.color, shape: BoxShape.circle)),
    );
  }
}
