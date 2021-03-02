import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:knowyourdonor/views/request_blood_form.dart';

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
      home: RequestBlood(),
    );
  }
}
