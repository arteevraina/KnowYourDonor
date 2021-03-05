import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowyourdonor/components/formbutton.dart';
import 'package:knowyourdonor/constants/colors.dart';
import 'package:knowyourdonor/constants/text_styles.dart';
import 'package:knowyourdonor/constants/validators.dart';

class DonateBlood extends StatefulWidget {
  @override
  _DonateBloodState createState() => _DonateBloodState();
}

class _DonateBloodState extends State<DonateBlood> {
  // Unique key for the validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _donorNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _bloodgroupController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        hintText: "Enter your address",
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
                    GestureDetector(
                      onTap: () {
                        _formKey.currentState.validate();
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
