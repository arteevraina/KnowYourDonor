import 'package:flutter/material.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:provider/provider.dart';

// Home Screen of the App.
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
