import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowyourdonor/constants/colors.dart';

TextStyle smallTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: normalTextColor,
      fontSize: 15,
    ),
  );
}

TextStyle mediumTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: errorTextColor,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle largeTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: errorTextColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}

// Text Styles for use in buttons.
TextStyle buttonTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: buttonTextColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
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

// Text Style for use in Home Page Button.
TextStyle homePageButtonTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: errorTextColor,
      letterSpacing: 1,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

// Text Style for bloodGroup inside Container.
TextStyle bloodGroupTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(color: bloodGroupColor),
    letterSpacing: 2,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
}

// Text Style for Drawer Header.
TextStyle drawerHeaderTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(color: headerTextColor),
    letterSpacing: 0,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
}

// Text Style for Drawer List Tiles.
TextStyle drawerListTextStyle() {
  return GoogleFonts.josefinSlab(
    textStyle: TextStyle(
      color: drawerListTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}
