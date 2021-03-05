import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:knowyourdonor/views/home_page.dart';
import 'package:knowyourdonor/views/login_page.dart';
import 'package:knowyourdonor/views/register_page.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => AuthProvider.instance(),
    )
  ], child: MyApp()));
}

// Calling the Material App at the root of Widget Tree.
// This will serve as the root of the App.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: _showScreen(context),
    );
  }
}

Widget _showScreen(BuildContext context) {
  switch (context.watch<AuthProvider>().authState) {
    case AuthState.LoggedOut:
      return LoginPage();
    case AuthState.Initial:
    case AuthState.NotRegistered:
      return RegisterPage();
    case AuthState.NotLoggedIn:
      return LoginPage();
    case AuthState.Registered:
      return LoginPage();
    case AuthState.LoggedIn:
      return HomePage();
    case AuthState.Registering:
      return RegisterPage();
    case AuthState.LoggingIn:
      return LoginPage();
  }

  return Container();
}
