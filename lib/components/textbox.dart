import 'package:flutter/material.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

// TextBox for Emails, Password, Phone Number
Widget TextBox(
    {@required BuildContext context,
    @required String hintText,
    @required TextEditingController inputController,
    @required Function validator,
    @required bool isPassword}) {
  return TextFormField(
    obscureText: isPassword,
    validator: validator,
    controller: inputController,
    style: mediumTextStyle(),
    decoration: InputDecoration(
      hintStyle: mediumTextStyle(),
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.pink,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    ),
  );
}
