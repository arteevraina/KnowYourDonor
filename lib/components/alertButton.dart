// Library imports.
import 'package:flutter/material.dart';

// Local imports.
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

// Button for Custom Dialog.
// ignore: non_constant_identifier_names
Container AlertButton(String task, IconData icon) {
  return Container(
    decoration: BoxDecoration(
      color: buttonBackgroundColor,
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 8.0,
        bottom: 8.0,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            task,
            style: bloodGroupTextStyle(),
          ),
        ],
      ),
    ),
  );
}
