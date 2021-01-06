import 'package:flutter/material.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/constants/colors.dart';

// Multipurpose Button for login and other tasks.
Widget Button(
    {@required BuildContext context,
    @required String buttonText,
    Color textColor,
    Color backgroundColor}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: buttonColor,
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
