import 'package:flutter/material.dart';
import 'package:knowyourdonor/components/appbar.dart';
import 'package:knowyourdonor/views/donate_blood_page.dart';
import 'package:knowyourdonor/views/request_blood_page.dart';
// import 'package:provider/provider.dart';
// import 'package:knowyourdonor/provider/auth_provider.dart';

// Home Screen of the App.
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar(
          title: "Home",
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestBlood()));
                },
                child: Text("Request Blood"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DonateBlood()));
                },
                child: Text("Donate Blood"),
              ),
              // RaisedButton(
              //   onPressed: () {
              //     Provider.of<AuthService>(context, listen: false).signOut();
              //   },
              //   child: Text("Sign Out"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
