import 'package:flutter/material.dart';
import 'package:knowyourdonor/components/appbar.dart';
import 'package:provider/provider.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';

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
              Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                child: Text(
                  "Home",
                  style: TextStyle(color: normalTextColor, fontSize: 30),
                ),
                color: Colors.amber,
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Provider.of<AuthService>(context, listen: false).signOut();
                  },
                  child: Text("Sign Out"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
