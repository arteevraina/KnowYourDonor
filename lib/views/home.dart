import 'package:flutter/material.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:provider/provider.dart';

// Home Screen of the App.
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: RaisedButton(
          onPressed: () {
            Provider.of<AuthService>(context, listen: false).signOut();
          },
          child: Text("Sign Out"),
        ),
      ),
    );
  }
}
