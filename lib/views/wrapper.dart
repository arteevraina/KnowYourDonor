import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:knowyourdonor/provider/bottom_navigation_provider.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/views/donors_list.dart';
import 'package:knowyourdonor/views/home_page.dart';
import 'package:knowyourdonor/views/seekers_list.dart';
import 'package:knowyourdonor/views/login_page.dart';
import 'package:knowyourdonor/views/about.dart';

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

    /// Get the user email for [Drawer].
    var email = Provider.of<AuthProvider>(context).user.email;

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        child: Text(email[0].toUpperCase()),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Welcome $email",
                        style: drawerHeaderTextStyle(),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFE94F37),
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: drawerIconColor,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "Logout",
                      style: drawerListTextStyle(),
                    ),
                  ],
                ),
                onTap: () async {
                  if (await context.read<AuthProvider>().logout()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  }
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: drawerIconColor,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "Blood Requests",
                      style: drawerListTextStyle(),
                    ),
                  ],
                ),
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "Feature yet to added",
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: drawerIconColor,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "Developer Contact",
                      style: drawerListTextStyle(),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Know Your Donor",
            style: appBarTextStyle(),
          ),
          elevation: 0,
          backgroundColor: appBarColor,
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
                Icons.list,
              ),
              label: "Seekers",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_outlined,
              ),
              label: "Donors",
            ),
          ],
        ),
      ),
    );
  }
}
