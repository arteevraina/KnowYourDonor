import 'package:flutter/material.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

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
        color: backgroundColor, borderRadius: BorderRadius.circular(30)),
    child: Center(
      child: Text(
        buttonText,
        style: mediumTextStyle(),
      ),
    ),
  );
}
