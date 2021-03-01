import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowyourdonor/constants/colors.dart';

TextStyle smallTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: normalTextColor,
      fontSize: 10,
    ),
  );
}

TextStyle mediumTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: errorTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
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
        color: buttonTextColor, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

// Text Style for AppBar Title.
TextStyle appBarTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: appBarTitleColor,
      fontSize: 25,
    ),
  );
}
