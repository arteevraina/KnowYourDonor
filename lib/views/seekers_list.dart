import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/components/loader.dart';
import 'package:knowyourdonor/components/alertButton.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/repository/seekerRepository.dart';
import 'package:knowyourdonor/repository/location_repository.dart';

class SeekersList extends StatefulWidget {
  @override
  _SeekersListState createState() => _SeekersListState();
}

class _SeekersListState extends State<SeekersList> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  // Seeker fields.
  String address;
  String bloodGroup;
  String name;
  double latitude;
  double longitude;
  int phoneNumber;
  int units;
  bool isPlatelets;

  final LocationRepository _seekerLocationRepository = LocationRepository();

  Stream<QuerySnapshot> seekers;

  double currentLat, currentLong;

  bool isTapped = false;

  @override
  void initState() {
    getCurrentLocation();
    fetchSeekers();
    super.initState();
  }

  /// Function for getting [Current Location].
  Future<void> getCurrentLocation() async {
    Position res = await _seekerLocationRepository.getCurrentLocation();

    // Set the state and show map.
    setState(() {
      currentLat = res.latitude;
      currentLong = res.longitude;
    });
  }

  /// Function for getting [Donors].
  void fetchSeekers() async {
    seekers = context.read<SeekerRepository>().getSeekers();

    // Get the email of the user.
    var email = context.read<AuthProvider>().user.email;

    /// Iterating over the list and calling [initMarker]
    /// for each document.
    seekers.forEach(
      (element) {
        element.docs.forEach(
          (element) {
            if (email != element.data()['email']) {
              initMarker(element.data(), element.id);
            }
          },
        );
      },
    );
  }

  /// After getting [Seeker] document populate the
  /// field to show in [Dialog Box]
  Future<void> populateSeeker(String id) async {
    DocumentSnapshot doc =
        await context.read<SeekerRepository>().getSeekerById(id);
    name = doc["name"];
    address = doc["address"];
    bloodGroup = doc["bloodGroup"];
    latitude = doc["latitude"];
    longitude = doc["longitude"];
    phoneNumber = doc["phoneNumber"];
    units = doc["units"];
    isPlatelets = doc["isPlatelet"];
  }

  /// Function for initialising location [Markers].
  void initMarker(Map<String, dynamic> info, String id) {
    // Set the markerId.
    var markerIdVal = id;
    final MarkerId markerId = MarkerId(markerIdVal);

    // Create a new Marker.
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        info['latitude'],
        info['longitude'],
      ),
      onTap: () async {
        await populateSeeker(id);
        setState(() {
          isTapped = true;
        });
      },
      zIndex: 2,
    );

    // Set the state and show markes.
    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // If currentLat or currentLong is null then wait.
      // else show Google Maps.
      body: (currentLat == null || currentLong == null)
          ? Center(
              child: Loader(),
            )
          : Stack(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: context.read<SeekerRepository>().getSeekers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Error: ${snapshot.error}",
                          style: mediumTextStyle(),
                        ),
                      );
                    }

                    if (!snapshot.hasData) {
                      return Center(
                        child: Loader(),
                      );
                    }

                    return Stack(
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(currentLat, currentLong),
                            zoom: 15,
                          ),
                          markers: Set<Marker>.of(markers.values),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                        isTapped
                            ? Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 2,
                                backgroundColor: backgroundColor,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23,
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: SvgPicture.asset(
                                          'assets/stethoscope.svg',
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.only(
                                        top: 10.0,
                                        // bottom: 10.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(30),
                                                  ),
                                                  border: Border.all(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 4.0,
                                                    bottom: 4.0,
                                                  ),
                                                  child: Text(
                                                    name,
                                                    style: mediumTextStyle(),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: circleColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50.0),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    bloodGroup.toUpperCase(),
                                                    style:
                                                        bloodGroupTextStyle(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(30),
                                                  ),
                                                  border: Border.all(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 4.0,
                                                    bottom: 4.0,
                                                  ),
                                                  child: Text(
                                                    "$units units",
                                                    style: mediumTextStyle(),
                                                  ),
                                                ),
                                              ),
                                              isPlatelets
                                                  ? Text(
                                                      "* Platelets Required!",
                                                      style: cardTextStyle(),
                                                    )
                                                  : SizedBox(
                                                      width: 0.0,
                                                    ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  final Uri _phoneNumberURI =
                                                      Uri(
                                                    scheme: 'tel',
                                                    path:
                                                        phoneNumber.toString(),
                                                  );
                                                  await canLaunch(
                                                          _phoneNumberURI
                                                              .toString())
                                                      ? await launch(
                                                          _phoneNumberURI
                                                              .toString())
                                                      : Fluttertoast.showToast(
                                                          msg:
                                                              "Could not make a call",
                                                        );
                                                },
                                                child: AlertButton(
                                                  "Call",
                                                  Icons.call,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isTapped = false;
                                                  });
                                                },
                                                child: AlertButton(
                                                  "Exit",
                                                  Icons.exit_to_app,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Seekers in your Area",
                        style: mediumTextStyle(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
