import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/views/donate_blood_form.dart';
import 'package:knowyourdonor/views/request_blood_form.dart';

// Screen for Home Page of the App.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                await context.read<AuthProvider>().logout();
              },
            )
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: upperHalfColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/doctor.svg',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: lowerHalfColor,
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(height: 200.0),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: lowerHalfColor,
                                  border: Border.all(
                                    width: 3,
                                    color: borderColor,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'text $i',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                  child: Container(
                height: MediaQuery.of(context).size.height / 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestBlood(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: lowerHalfColor,
                          border: Border.all(
                            width: 3,
                            color: borderColor,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Request Blood",
                            style: homePageButtonTextStyle(),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DonateBlood(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: lowerHalfColor,
                          border: Border.all(
                            width: 3,
                            color: borderColor,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Donate Blood",
                            style: homePageButtonTextStyle(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
