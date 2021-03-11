// Functions for validations of usernames, passwords, phonenumbers, bloodgroups ,emailaddress.
// More functions will be added as the app grows.

// Function for validating userName.
Function(String) userNameValidator = (String userName) {
  if (userName.isEmpty) {
    return "Username is empty";
  }

  if (userName.length < 3) {
    return "Username cannot be less than 3 characters";
  }

  return null;
};

// Function for validating passwords.
Function(String) passwordValidator = (String password) {
  if (password.isEmpty) {
    return "Password is empty";
  }

  if (password.length < 5) {
    return "Password cannot be less than 5 characters";
  }

  return null;
};

// Function for validating phoneNumbers.
Function(String) phoneNumberValidator = (String phoneNumber) {
  String p = r'^[2-9]{1}[0-9]{9}$';
  RegExp regExp = RegExp(p);

  if (phoneNumber.isEmpty) {
    return "Please enter your Phone Number";
  }

  if (!regExp.hasMatch(phoneNumber)) {
    return "Phone Number is not valid";
  }

  return null;
};

// Function for validating bloodgroup.
Function(String) bloodGroupValidator = (String bloodGroup) {
  String p = r'^(A|B|AB|O)[+-]$';
  RegExp regExp = RegExp(p);

  if (bloodGroup.isEmpty) {
    return "Please enter your Blood Group";
  }

  if (!regExp.hasMatch(bloodGroup)) {
    return "BloodGroup is not valid";
  }

  return null;
};

// Function for validating emails.
Function(String) emailValidator = (String emailAddress) {
  String p =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(p);

  if (emailAddress.isEmpty) {
    return "Please enter your email";
  }

  if (!regExp.hasMatch(emailAddress)) {
    return "Email address is not valid";
  }

  return null;
};

// Function for validating address.
Function(String) addressValidator = (String address) {
  String p = r"^[#.0-9a-zA-Z\s,-]+$";
  RegExp regExp = RegExp(p);

  if (address.isEmpty) {
    return "Address is empty";
  }

  if (!regExp.hasMatch(address)) {
    return "Address is not valid";
  }

  return null;
};

// Function for validating units of Blood.
Function(String) unitsValidator = (String units) {
  if (units.isEmpty) {
    return "Units are empty";
  }

  return null;
};
