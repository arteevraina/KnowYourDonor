import 'package:flutter/material.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:knowyourdonor/views/home.dart';
import 'package:knowyourdonor/views/login_page.dart';
import 'package:knowyourdonor/views/otp_page.dart';
import 'package:knowyourdonor/views/splash_screen.dart';

// Consumer widget for the various Auth States.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService.instance(),
      child: Consumer<AuthService>(builder: (context, AuthService user, _) {
        print(user.status);
        if (user.status == Status.Uninitialized) {
          return SplashScreen();
        } else if (user.status == Status.PhoneNumberNotVerified ||
            user.status == Status.PhoneNumberVerifying) {
          return LoginPage();
        } else if (user.status == Status.PhoneNumberVerified ||
            user.status == Status.OTPSentState ||
            user.status == Status.OTPVerifying) {
          return OTPPage();
        } else if (user.status == Status.OTPNotVerified) {
          return LoginPage();
        } else if (user.status == Status.OTPVerified) {
          return Home();
        }
      }),
    );
  }
}
