// Library imports.
import 'package:flutter/material.dart';

// Local imports.
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/constants/colors.dart';

// Button for Donor and Recipient Forms.
// ignore: non_constant_identifier_names
Widget FormButton(
    {@required String buttonText,
    Color textColor,
    Color backgroundColor,
    int colorDifference}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15),
    width: 150.0,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        buttonColor,
        Color.fromARGB(
            buttonColor.alpha,
            buttonColor.red - colorDifference,
            buttonColor.green - colorDifference,
            buttonColor.blue - colorDifference)
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      // color: buttonColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Center(
      child: Text(
        buttonText,
        style: buttonTextStyle(),
      ),
    ),
  );
}
