import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowyourdonor/components/textbox.dart';
import 'package:knowyourdonor/components/button.dart';
import 'package:knowyourdonor/constants/validators.dart';
import 'package:knowyourdonor/components/alertbox.dart';
import '../constants/colors.dart';

// Stateful Widget that handles Login Tasks
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();

  void signIn() {
    print(_formKey.currentState.validate());
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
                        hintText: "Name",
                        isPassword: false,
                        inputController: _bloodGroupController,
                        validator: bloodGroupValidator,
                        fieldIcon: Icon(
                          Icons.person,
                          color: buttonColor,
                        )),
                    TextBox(
                        context: context,
                        hintText: "Blood Group",
                        isPassword: false,
                        inputController: _bloodGroupController,
                        validator: bloodGroupValidator,
                        fieldIcon: Icon(
                          Icons.lock,
                          color: buttonColor,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // dummufunction()
                      },
                      child: Button(
                          context: context,
                          buttonText: "Register",
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
