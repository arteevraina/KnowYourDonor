import 'package:flutter/material.dart';
import 'package:knowyourdonor/components/formbutton.dart';
import 'package:knowyourdonor/constants/text_styles.dart';

class DonateBlood extends StatefulWidget {
  @override
  _DonateBloodState createState() => _DonateBloodState();
}

class _DonateBloodState extends State<DonateBlood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter details to donate blood",
                style: mediumTextStyle(),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Donor's Name",
                  hintText: "Enter your Name",
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Address Line",
                  hintText: "Enter your address",
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Blood Group",
                  hintText: "Enter your Blood Group",
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone Number",
                  hintText: "Enter your Phone Number",
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              FormButton(
                buttonText: "Post",
                colorDifference: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
