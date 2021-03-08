import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/components/textbox.dart';
import 'package:knowyourdonor/components/button.dart';
import 'package:knowyourdonor/components/loader.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/constants/validators.dart';
import 'package:knowyourdonor/constants/colors.dart';

import 'package:knowyourdonor/views/login_page.dart';

// Stateful Widget that handles Email Register Task.
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Unique key for the validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: SvgPicture.asset(
                    'assets/doctor.svg',
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
                flex: 2,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextBox(
                        context: context,
                        hintText: "Enter your email",
                        isPassword: false,
                        inputController: _emailController,
                        validator: emailValidator,
                        keyboardtype: TextInputType.emailAddress,
                        fieldIcon: Icon(
                          Icons.email,
                          color: buttonColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextBox(
                        context: context,
                        hintText: "Enter your password",
                        isPassword: true,
                        inputController: _passwordController,
                        validator: passwordValidator,
                        keyboardtype: TextInputType.text,
                        fieldIcon: Icon(
                          Icons.security,
                          color: buttonColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            if (!await context.read<AuthProvider>().register(
                                  _emailController.text,
                                  _passwordController.text,
                                )) {
                              Fluttertoast.showToast(
                                msg: "Could not Register",
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            }
                          }
                        },
                        child: (authProvider.authState == AuthState.Registering)
                            ? Loader()
                            : Button(
                                context: context,
                                buttonText: "Register",
                                colorDifference: 60,
                              ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Already registered ? Log In!",
                          style: smallTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
