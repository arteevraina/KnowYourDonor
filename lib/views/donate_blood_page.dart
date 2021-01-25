import 'package:flutter/material.dart';
import 'package:knowyourdonor/components/appbar.dart';

// Form for Donating Blood.
class DonateBlood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar(title: "Donate Blood"),
      ),
    );
  }
}
