import 'package:flutter/material.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

class SeekersList extends StatefulWidget {
  @override
  _SeekersListState createState() => _SeekersListState();
}

class _SeekersListState extends State<SeekersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: double.maxFinite,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Arteev Raina",
                              style: mediumTextStyle(),
                            ),
                            Text(
                              "A+",
                              style: mediumTextStyle(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2 units",
                              style: mediumTextStyle(),
                            ),
                            Text(
                              "7006480030",
                              style: mediumTextStyle(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
