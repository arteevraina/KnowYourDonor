import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowyourdonor/constants/colors.dart';

TextStyle mediumTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: normalTextColor,
    ),
  );
}

TextStyle largeTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
        color: errorTextColor, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

TextStyle buttonTextStyle() {
  return GoogleFonts.josefinSlab(
      textStyle: TextStyle(
          color: buttonTextColor, fontSize: 30, fontWeight: FontWeight.bold));
}
