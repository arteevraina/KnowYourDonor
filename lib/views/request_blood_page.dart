import 'package:flutter/material.dart';
import 'package:knowyourdonor/components/appbar.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

// Form for Request Blood.
class RequestBlood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar(title: "Request Blood"),
        body: Column(
          children: [
            Center(
              child: Text(
                "Enter details of Patient",
                style: mediumTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
