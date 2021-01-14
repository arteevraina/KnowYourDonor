import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowyourdonor/components/textbox.dart';
import 'package:knowyourdonor/components/button.dart';
import 'package:knowyourdonor/constants/validators.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import '../constants/colors.dart';

// Stateless Widget that handles OTP Verification Task
class OTPPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();

  // Function for verifyOTP
  verifyOTP(BuildContext context) {
    print("Verify OTP**");
    try {
      Provider.of<AuthService>(
        context,
        listen: false,
      ).verifyOTP(_otpController.text).then((value) {
        print("Verify OTP");
        Fluttertoast.showToast(
          msg: "OTP Verified",
          textColor: normalTextColor,
          backgroundColor: buttonColor,
        );
      }).catchError((e) {
        print(e);
        String errorMsg = "Can't Authenticare you, Try Again Later";
        if (e.toString().contains(
            'The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user')) {
          errorMsg = "Invalid OTP";
        }
        Fluttertoast.showToast(
          msg: e.toString(),
          textColor: errorTextColor,
          backgroundColor: buttonColor,
        );
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: errorTextColor,
        backgroundColor: buttonColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: SvgPicture.asset(
                  'assets/drop.svg',
                  color: errorTextColor,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 2,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBox(
                      context: context,
                      hintText: "Enter OTP",
                      isPassword: false,
                      inputController: _otpController,
                      validator: bloodGroupValidator,
                      fieldIcon: Icon(
                        Icons.lock,
                        color: buttonColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // dummufunction()
                        verifyOTP(context);
                      },
                      child: Button(
                          context: context,
                          buttonText: "Verify OTP",
                          colorDifference: 60),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
