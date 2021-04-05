// Library imports.
import 'package:flutter/material.dart';

// Local imports.
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/components/textbox.dart';

// ignore: non_constant_identifier_names
Widget AlertBox(
    {@required BuildContext context,
    @required String inputText,
    @required String buttonText,
    @required String title,
    @required TextEditingController inputController,
    @required GestureDetector gestureDetector,
    TextInputType keyboardtype}) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: largeTextStyle(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextBox(
                  context: context,
                  keyboardtype: keyboardtype,
                  hintText: inputText,
                  inputController:
                      inputController, //make it @required if necessary
                  validator: null, //Add an otp validator
                  isPassword: false),
            ],
          ),
          actions: [
            gestureDetector,
          ],
        ),
      ),
    ),
  );
}
