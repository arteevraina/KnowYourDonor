import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:knowyourdonor/models/Donor.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/components/loader.dart';
import 'package:knowyourdonor/components/formbutton.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/constants/validators.dart';
import 'package:knowyourdonor/repository/donorRepository.dart';

class DonateBlood extends StatefulWidget {
  @override
  _DonateBloodState createState() => _DonateBloodState();
}

class _DonateBloodState extends State<DonateBlood> {
  // Unique key for the validation of the form.
  final _formKey = GlobalKey<FormState>();

  // Text Controllers for Forms.
  TextEditingController _donorNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _bloodgroupController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Provider for DonorRepository.
    DonorRepository donorProvider = Provider.of(context);

    // Get the user email ID.
    var email = Provider.of<AuthProvider>(context).user.email;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Know Your Donor",
          style: appBarTextStyle(),
        ),
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                'assets/stethoscope.svg',
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter details to donate blood",
                      style: mediumTextStyle(),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _donorNameController,
                      validator: userNameValidator,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Donor's Name",
                        hintText: "Enter your Name",
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: _addressController,
                      validator: addressValidator,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Address Line",
                        hintText: "Street Name, City Name",
                        prefixIcon: Icon(
                          Icons.home,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: _bloodgroupController,
                      validator: bloodGroupValidator,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Blood Group",
                        hintText: "Enter your Blood Group",
                        prefixIcon: Icon(
                          Icons.category,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      validator: phoneNumberValidator,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Phone Number",
                        hintText: "Enter your Phone Number",
                        prefixIcon: Icon(
                          Icons.phone,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    (donorProvider.state == SubmitState.Submitting)
                        ? Loader()
                        : GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                /// First get the [lat] and [long] of the
                                /// address and then create [instance].
                                List<Location> locations =
                                    await locationFromAddress(
                                  _addressController.text,
                                );

                                // Get the first item in the list.
                                Location coordinates = locations.first;

                                /// Create [instance] of [Donor Model]
                                /// and then post it using [DonorRepository]
                                /// function.
                                Donor donor = Donor(
                                  _donorNameController.text,
                                  email,
                                  _addressController.text,
                                  _bloodgroupController.text,
                                  int.parse(_phoneNumberController.text),
                                  coordinates.latitude,
                                  coordinates.longitude,
                                );

                                if (await context
                                    .read<DonorRepository>()
                                    .postDonor(donor)) {
                                  /// If everything goes fine
                                  /// then show toast.
                                  Fluttertoast.showToast(
                                    msg: "Post Created",
                                  );

                                  // Clear all the text fields.
                                  _donorNameController.clear();
                                  _addressController.clear();
                                  _bloodgroupController.clear();
                                  _phoneNumberController.clear();
                                } else {
                                  /// Else toast that Request is
                                  /// rejected.
                                  Fluttertoast.showToast(
                                    msg: "Request Rejected",
                                  );
                                }
                              }
                            },
                            child: FormButton(
                              buttonText: "Post",
                              colorDifference: 60,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
