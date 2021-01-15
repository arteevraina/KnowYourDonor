import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowyourdonor/components/textbox.dart';
import 'package:knowyourdonor/components/button.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/constants/validators.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/views/otp_page.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Stateful Widget that handles Login Tasks
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  void signIn() {
    print(_formKey.currentState.validate());
  }

  sendOTP(BuildContext context) {
    try {
      Provider.of<AuthService>(
        context,
        listen: false,
      ).verifyPhone("+91" + _phoneNumberController.text).then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => OTPPage()));
      }).catchError((e) {
        String errorMsg = "Can't Authenticare you, Try Again Later";
        if (e.toString().contains(
            'We have blocked all requests from this device due to unusual activity. Try again later.')) {
          errorMsg = "Please wait as you have exceeded you number requests";
        }
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
              flex: 1,
              child: Center(
                child: Text(
                  'KNOW YOUR DONOR',
                  style: largeTextStyle(),
                ),
              ),
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
                        hintText: "Phone Number",
                        countrycode: '+91',
                        isPassword: false,
                        inputController: _phoneNumberController,
                        validator: phoneNumberValidator,
                        keyboardtype: TextInputType.phone,
                        fieldIcon: Icon(
                          Icons.call,
                          color: buttonColor,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          sendOTP(context);
                          print("Do something to verify the phone number");
                        }
                      },
                      child: Button(
                        context: context,
                        buttonText: "Send OTP",
                        colorDifference: 60,
                      ),
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
