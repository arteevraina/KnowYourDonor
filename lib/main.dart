import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:knowyourdonor/views/login_page.dart';
// import 'package:knowyourdonor/views/register_page.dart';
import 'package:knowyourdonor/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// Calling the Material App at the root of Widget Tree.
// This will serve as the root of the App.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
