import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Class for the Phone Auth Service.
class AuthService with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  String verificationId;

  // Function for verifying Phone Number.
  Future<void> verifyPhone(String phoneNumber) async {
    try {
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
    } catch (e) {
      throw e;
    }
  }

  //Function for verifying OTP sent.
  Future<void> verifyOTP(String otp) async {
    print("Verification ID " + verificationId);
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      final UserCredential user = await auth.signInWithCredential(credential);
      final User currentUser = auth.currentUser;
      print(user);

      if (currentUser.uid != "") {
        print(currentUser.uid);
      }
    } catch (e) {
      throw e;
    }
  }
}
