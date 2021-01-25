import 'package:flutter/material.dart';
import 'package:knowyourdonor/components/appbar.dart';

class Donor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar(title: "Donor List"),
        body: Center(
            child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child: Text(
            "Donor",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          color: Colors.cyan,
        )),
      ),
    );
  }
}
