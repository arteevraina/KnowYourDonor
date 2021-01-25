import 'package:flutter/material.dart';
import 'package:knowyourdonor/components/appbar.dart';

class Recipient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar(title: "Recipient List"),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 300,
            width: 300,
            child: Text(
              "Recipient",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
