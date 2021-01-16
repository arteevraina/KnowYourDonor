import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowyourdonor/components/textbox.dart';
import 'package:knowyourdonor/components/button.dart';
import 'package:knowyourdonor/constants/validators.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

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
        // Toast shows when OTP is Verified.
        //TODO: Navigate to new Screen.
        Fluttertoast.showToast(
          msg: "OTP Verified",
          textColor: normalTextColor,
          backgroundColor: buttonColor,
        );
      }).catchError((e) {
        String errorMsg = "Can't Authenticare you, Try Again Later";

        // If error is due to Invalid Code.
        if (e.toString().contains(
            'The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user')) {
          errorMsg = "Invalid OTP";
        }

        // Show the toast for error.
        Fluttertoast.showToast(
          msg: errorMsg,
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
              height: 60,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: SvgPicture.asset(
                  'assets/girl.svg',
                ),
              ),
            ),
            Center(
              child: Text(
                'KNOW YOUR DONOR',
                style: largeTextStyle(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBox(
                      context: context,
                      hintText: "Enter OTP",
                      // countrycode: '',
                      keyboardtype: TextInputType.number,
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
