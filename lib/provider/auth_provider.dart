import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

enum Status {
  Uninitialized,
  PhoneNumberNotVerified,
  PhoneNumberVerifying,
  PhoneNumberVerified,
  OTPSentState,
  OTPNotVerified,
  OTPVerifying,
  OTPVerified,
}

// Class for the Phone Auth Service.
class AuthService with ChangeNotifier {
  FirebaseAuth auth;

  String verificationId;
  Status _status = Status.Uninitialized;
  User _user;

  Status get status => _status;
  User get user => _user;

  AuthService.instance() : auth = FirebaseAuth.instance {
    auth.authStateChanges().listen(onAuthStateChanged);
  }

  // Function for verifying Phone Number.
  Future<bool> verifyPhone(String phoneNumber) async {
    try {
      _status = Status.PhoneNumberVerifying;
      notifyListeners();
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },

          // Callback when code is sent to the device.
          codeSent: (String verId, [int forceCodeResend]) {
            this.verificationId = verId;
            _status = Status.OTPSentState;
            notifyListeners();
          },

          // Once the timeout passes device will no longer resolve any incoming message.
          timeout: const Duration(
            seconds: 120,
          ),

          // Callbacks when verification is completed.
          verificationCompleted: (AuthCredential phoneAuthCredential) async {
            print(phoneAuthCredential);
          },

          //Listens for errors with verification, such as too many attempts.
          verificationFailed: (FirebaseAuthException exception) {
            throw exception;
          });
      return true;
    } catch (e) {
      _status = Status.PhoneNumberNotVerified;
      notifyListeners();
      return false;
    }
  }

  //Function for verifying OTP sent.
  Future<void> verifyOTP(String otp) async {
    print("Verification ID " + verificationId);
    try {
      _status = Status.OTPVerifying;
      notifyListeners();
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
    } catch (e) {
      _status = Status.OTPNotVerified;
      notifyListeners();
      throw e;
    }
  }

  // Function for signing out.
  Future signOut() async {
    await auth.signOut();
    _status = Status.PhoneNumberNotVerified;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> onAuthStateChanged(User user) async {
    if (user == null) {
      _status = Status.PhoneNumberNotVerified;
    } else {
      print("Verified");
      _user = user;
      _status = Status.OTPVerified;
    }
    notifyListeners();
  }
}
