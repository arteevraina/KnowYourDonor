import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Class for the Phone Auth Service.
class AuthService with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  String verificationId;

  Future<void> verifyPhone(String phoneNumber) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      print(verId + " **************");
      this.verificationId = verId;
    };
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent: smsOTPSent,
          timeout: const Duration(
            seconds: 120,
          ),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            throw exception;
          });
    } catch (e) {
      throw e;
    }
  }

  Future<void> verifyOTP(String otp) async {
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
