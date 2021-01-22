import 'package:flutter/material.dart';
import 'package:knowyourdonor/provider/bottom_navigation_provider.dart';
import 'package:knowyourdonor/views/donor_page.dart';
import 'package:knowyourdonor/views/home_page.dart';
import 'package:knowyourdonor/views/recipient_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  var currentTab = [
    Home(),
    Recipient(),
    Donor(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: "Recipient",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Donor",
          )
        ],
      ),
    );
  }
}
