import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:knowyourdonor/provider/bottom_navigation_provider.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/views/donors_list.dart';
import 'package:knowyourdonor/views/home_page.dart';
import 'package:knowyourdonor/views/seekers_list.dart';
import 'package:knowyourdonor/views/login_page.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  /// Initialize [currentTab] variable.
  var currentTab = [
    HomePage(),
    SeekersList(),
    DonorsList(),
  ];

  @override
  Widget build(BuildContext context) {
    /// Get the provider for [BNB].
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Know Your Donor",
            style: appBarTextStyle(),
          ),
          elevation: 0,
          backgroundColor: appBarColor,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                if (await context.read<AuthProvider>().logout()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                }
              },
            )
          ],
        ),
        body: currentTab[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.currentIndex = index;
          },
          backgroundColor: backgroundColor,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unSelectedItemColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
              ),
              label: 'School',
            ),
          ],
        ),
      ),
    );
  }
}
