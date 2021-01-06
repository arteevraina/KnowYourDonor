import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowyourdonor/constants/colors.dart';

TextStyle mediumTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: Colors.pink,
    ),
  );
}

TextStyle buttonTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: buttonTextColor,
    ),
  );
}
