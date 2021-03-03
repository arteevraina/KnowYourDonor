import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Different Auth States.
enum AuthState {
  Initial,
  NotRegistered,
  Registering,
  Registered,
  NotLoggedIn,
  LoggingIn,
  LoggedIn,
}

// Auth Provider Class.
class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;

  AuthState _authState = AuthState.Initial;

  AuthState get authState => _authState;
  User get user => _user;

  // Function for listening to auth changes.
  AuthProvider.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((firebaseUser) {
      if (firebaseUser == null) {
        _authState = AuthState.NotLoggedIn;
      } else {
        _user = firebaseUser;
        print(user.email);
        _authState = AuthState.LoggedIn;
      }

      notifyListeners();
    });
  }

  // Function for logging in user.
  Future<bool> login(String email, String password) async {
    try {
      _authState = AuthState.LoggingIn;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } catch (e) {
      print(e);
      _authState = AuthState.NotLoggedIn;
      notifyListeners();
      return false;
    }
  }

  // Function for registering user.
  Future<bool> register(String email, String password) async {
    try {
      _authState = AuthState.Registering;
      notifyListeners();

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } catch (e) {
      print(e);
      _authState = AuthState.NotRegistered;
      notifyListeners();
      return false;
    }
  }

  Future logout() async {
    await _auth.signOut();
    _authState = AuthState.NotLoggedIn;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
