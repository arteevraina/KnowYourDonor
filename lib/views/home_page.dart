// Library imports.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Local imports.
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/views/donate_blood_form.dart';
import 'package:knowyourdonor/views/request_blood_form.dart';

// Screen for Home Page of the App.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    items: [
                      //1st Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/Quote 1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //2nd Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/Quote 2.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //3rd Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/Quote 3.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //4th Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/Quote 4.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //5th Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/Quote 5.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    //Slider Container properties
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 10,
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
            ),
          ),
        ],
      ),
    );
  }
}
