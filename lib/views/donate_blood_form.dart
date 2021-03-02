import 'package:flutter/material.dart';
import 'package:knowyourdonor/components/formbutton.dart';
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
    );
  }
}
