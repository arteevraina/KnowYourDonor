import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:knowyourdonor/models/Seeker.dart';
import 'package:knowyourdonor/components/loader.dart';
import 'package:knowyourdonor/components/formbutton.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/constants/validators.dart';
import 'package:knowyourdonor/repository/seekerRepository.dart';
import 'package:knowyourdonor/repository/locationRepository.dart';

class RequestBlood extends StatefulWidget {
  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  // Unique key for the validation of the form.
  final _formKey = GlobalKey<FormState>();

  // Text Controllers for Forms.
  TextEditingController _seekerNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _bloodgroupController = TextEditingController();
  TextEditingController _unitsController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  // Instance for Location Class.
  Location location = Location();

  @override
  Widget build(BuildContext context) {
    // Provider for SeekerRepository.
    SeekerRepository seekerProvider = Provider.of(context);

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
                      "Enter details to request blood",
                      style: mediumTextStyle(),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _seekerNameController,
                      validator: userNameValidator,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Seeker's Name",
                        hintText: "Enter name",
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    GestureDetector(
                      onTap: () async {
                        /// Calling [Prediction Screen] for
                        /// selecting address with [lat] and [long].
                        await location.predictionScreen(context);
                        print("display prediction screen called");
                      },
                      child: TextFormField(
                        enabled: false,
                        controller: _addressController,
                        validator: addressValidator,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Address Line",
                          hintText: "Enter your address",
                          prefixIcon: Icon(
                            Icons.home,
                          ),
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
                      controller: _unitsController,
                      validator: unitsValidator,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Units required",
                        hintText: "Enter units of blood required",
                        prefixIcon: Icon(
                          Icons.stacked_bar_chart,
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
                    (seekerProvider.state == SubmitState.Submitting)
                        ? Loader()
                        : GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                /// Create [instance] of [Seeker Model]
                                /// and then post it using [SeekerRepository]
                                /// function.
                                Seeker seeker = Seeker(
                                  _seekerNameController.text,
                                  _addressController.text,
                                  _bloodgroupController.text,
                                  int.parse(_unitsController.text),
                                  int.parse(_phoneNumberController.text),
                                );

                                if (await context
                                    .read<SeekerRepository>()
                                    .postSeeker(seeker)) {
                                  /// If everything goes fine
                                  /// then show toast.
                                  Fluttertoast.showToast(
                                    msg: "Request Created",
                                  );
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
