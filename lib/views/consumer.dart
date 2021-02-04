import 'package:flutter/material.dart';
// import 'package:knowyourdonor/views/home_page.dart';
import 'package:knowyourdonor/views/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:knowyourdonor/views/login_page.dart';
import 'package:knowyourdonor/views/otp_page.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/provider/bottom_navigation_provider.dart';

// Consumer widget for the various Auth States.
// MultiProvider used because we are using more than one provider.
class ConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService.instance()),
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider()),
      ],
      // ignore: missing_return
      child: Consumer<AuthService>(builder: (context, AuthService user, _) {
        print(user.status);
        if (user.status == Status.PhoneNumberNotVerified ||
            user.status == Status.PhoneNumberVerifying) {
          // return LoginPage();
          return Wrapper();
        } else if (user.status == Status.PhoneNumberVerified ||
            user.status == Status.OTPSentState ||
            user.status == Status.OTPVerifying) {
          return OTPPage();
        } else if (user.status == Status.OTPNotVerified) {
          return LoginPage();
        } else if (user.status == Status.OTPVerified) {
          return Consumer<BottomNavigationBarProvider>(
            builder: (context, value, child) => Wrapper(),
          );
        }
      }),
    );
  }
}
