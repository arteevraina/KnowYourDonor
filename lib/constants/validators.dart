// Functions for validations of usernames, passwords, phonenumbers, bloodgroups, emailaddresses.
// More functions will be added as the app grows.

// import 'dart:html';

Function(String) userNameValidator = (String userName) {
  if (userName.isEmpty) {
    return "Username is Empty";
  }

  if (userName.length < 3) {
    return "Username cannot be less than 3 characters";
  }

  return null;
};

Function(String) passwordValidator = (String password) {
  if (password.isEmpty) {
    return "Password is Empty";
  }

  if (password.length < 5) {
    return "Password cannot be less than 5 characters";
  }

  return null;
};

Function(String) phoneNumberValidator = (String phoneNumber) {
  String p = r'^[2-9]{1}[0-9]{9}$';
  RegExp regExp = RegExp(p);

  if (phoneNumber.isEmpty) {
    return "Please Enter your Phone Number";
  }

  if (!regExp.hasMatch(phoneNumber)) {
    return "PhoneNumber is not valid";
  }

  return null;
};

Function(String) bloodGroupValidator = (String bloodGroup) {
  String p = r'^(A|B|AB|O)[+-]$';
  RegExp regExp = RegExp(p);

  if (bloodGroup.isEmpty) {
    return "Please Enter your Blood Group";
  }

  if (!regExp.hasMatch(bloodGroup)) {
    return "BloodGroup is not valid";
  }

  return null;
};


Function(String) emailAddressValidator = (String emailaddress) {
  String email = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]";
  bool valids = RegExp(email).hasMatch(emailaddress);

  if (emailaddress.isEmpty) {
    return "Please enter a valid email";
  }
  if (valids == false) {
    return "Email Address is not Valid";
  }
  return null;
};