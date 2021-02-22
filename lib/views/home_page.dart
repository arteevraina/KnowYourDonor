import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowyourdonor/components/textbox.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

// Screen for Home Page of the App.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: upperHalfColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/doctor.svg',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: lowerHalfColor,
                    ),
                  ),
                ),
              ],
            ),
            Center(
                child: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                      color: lowerHalfColor,
                      border: Border.all(
                        width: 3,
                        color: borderColor,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Request Blood",
                        style: mediumTextStyle(),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                      color: lowerHalfColor,
                      border: Border.all(
                        width: 3,
                        color: borderColor,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Donate Blood",
                        style: mediumTextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
