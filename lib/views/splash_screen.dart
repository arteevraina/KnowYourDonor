import 'package:flutter/material.dart';

// Splash Screen of the App.
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("SplashScreen");
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          "Know Your Donor",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
