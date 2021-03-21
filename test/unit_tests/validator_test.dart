// Units tests for validators.
import 'package:flutter_test/flutter_test.dart';
import 'package:knowyourdonor/constants/validators.dart';

void main() {
  group('Validators Tests', () {
    ///[userNameValidator] tests.
    test('userNameValidator test when empty string is passed', () {
      // Verify that it returns correct string.
      expect(
        "Username is empty",
        userNameValidator(""),
      );
    });

    test(
        'userNameValidator test when string of less than 3 characteres is passed',
        () {
      // Verify that it returns correct string.
      expect(
        "Username cannot be less than 3 characters",
        userNameValidator("ar"),
      );
    });

    test('userNameValidator test when correct string is passed', () {
      // Verify that it returns null.
      expect(
        null,
        userNameValidator("arteev"),
      );
    });

    ///[passwordValidator] tests.
    test("passwordValidator test when empty string is passed", () {
      // Verify that it returns correct string.
      expect(
        "Password is empty",
        passwordValidator(""),
      );
    });

    test("passwordValidator test when string less than 5 characters is passed",
        () {
      // Verify that it returns correct string.
      expect(
        "Password cannot be less than 5 characters",
        passwordValidator("abcd"),
      );
    });

    test("passwordValidator test when correct string is passed", () {
      // Verify that it returns null.
      expect(
        null,
        passwordValidator("abcde"),
      );
    });

    /// [phoneNumberValidator] tests.
    test("phoneNumberValidator test when empty string is passed", () {
      // Verify that it returns correct string.
      expect(
        "Please enter your Phone Number",
        phoneNumberValidator(""),
      );
    });

    test("phoneNumberValidator test when incorrect string is passed", () {
      // Verify that it returns correct string.
      expect(
        "Phone Number is not valid",
        phoneNumberValidator("1234565"),
      );
    });

    test("phoneNumberValidator test when correct string is passed", () {
      // Verify that it returns null.
      expect(
        null,
        phoneNumberValidator("7006480030"),
      );
    });

    /// [bloodGroupValidator] tests.
    test("bloodGroupValidator test when empty string is passed", () {
      // Verify that it returns correct string.
      expect(
        "Please enter your Blood Group",
        bloodGroupValidator(""),
      );
    });

    test("bloodGroupValidator test when incorrect string is passed", () {
      // Verify that it returns correct string.
      expect(
        "BloodGroup is not valid",
        bloodGroupValidator("a"),
      );
    });

    test("bloodGroupValidator test when correct string is passed", () {
      // Verify that it returns null.
      expect(
        null,
        bloodGroupValidator("A+"),
      );
    });

    /// [emailValidator] tests.
    test("emailValidator test when empty string is passed", () {
      // Verify that it returns correct string.
      expect(
        "Please enter your email",
        emailValidator(""),
      );
    });
    test("emailValidator test when incorrect string is passed", () {
      // Verify that it returns correct string.
      expect(
        "Email address is not valid",
        emailValidator("arteev"),
      );
    });

    test("emailValidator test when correct string is passed", () {
      // Verify that it returns correct string.
      expect(
        null,
        emailValidator("arteev@live.in"),
      );
    });

    ///[addressValidator] tests.
    test("addressValidator test when empty string is passed", () {
      // Verify that it returns correct string.
      expect(
        "Address is empty",
        addressValidator(""),
      );
    });

    test("addressValidator test when correct string is passed", () {
      // Verify that it returns null.
      expect(
        null,
        addressValidator("Durga Nagar, Jammu"),
      );
    });

    /// [unitsValidator] tests.
    test("unitsValidator when empty string is passed", () {
      // Verify that it returns correct string.
      expect(
        "Units are empty",
        unitsValidator(""),
      );
    });

    test("unitsValidator when correct string is passed", () {
      // Verify that it returns null.
      expect(
        "Units are empty",
        unitsValidator(""),
      );
    });
  });
}
