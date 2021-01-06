import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowyourdonor/components/textbox.dart';
import 'package:knowyourdonor/components/button.dart';
import 'package:knowyourdonor/constants/validators.dart';

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
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                'assets/drop.svg',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBox(
                    context: context,
                    hintText: "Phone Number",
                    isPassword: false,
                    inputController: _phoneNumberController,
                    validator: phoneNumberValidator,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextBox(
                    context: context,
                    hintText: "Your Name",
                    isPassword: false,
                    inputController: _userNameController,
                    validator: userNameValidator,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextBox(
                    context: context,
                    hintText: "Blood Group",
                    isPassword: false,
                    inputController: _bloodGroupController,
                    validator: bloodGroupValidator,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: signIn,
                    child: Button(
                      context: context,
                      buttonText: "Login",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
