import 'package:flutter/material.dart';
import 'package:knowyourdonor/views/login_page.dart';

void main() {
  runApp(MyApp());
}

// Calling the Material App at the root of Widget Tree.
// This will serve as the root of the App.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
