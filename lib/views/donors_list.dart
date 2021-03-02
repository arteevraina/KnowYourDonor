import 'package:flutter/material.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

class DonorsList extends StatefulWidget {
  @override
  _DonorsListState createState() => _DonorsListState();
}

class _DonorsListState extends State<DonorsList> {
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
                        Center(
                          child: Text(
                            "7006480030",
                            style: mediumTextStyle(),
                          ),
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
