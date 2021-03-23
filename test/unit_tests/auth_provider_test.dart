import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import '../mock.dart';

// Mock Firebase [Core or Auth] Classes for unit tests.
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  /// Initializing [FirebaseApp] just as in [main.dart].
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  // Creating instances from the mocked classes.
  MockFirebaseAuth _auth = MockFirebaseAuth();
  BehaviorSubject<MockUser> _user = BehaviorSubject<MockUser>();

  // Mocking on authStateChanges function.
  when(_auth.authStateChanges()).thenAnswer((_) {
    return _user;
  });

  AuthProvider _provider = AuthProvider(_auth);
  group('Auth Provider Tests', () {
    /// Mocking [signInWithEmailAndPassword] function
    /// This means if [email = "email"] and [password="password"]
    /// is passed to the function.
    /// Then it will add the user to the Stream.
    when(
      _auth.signInWithEmailAndPassword(
        email: "email",
        password: "password",
      ),
    ).thenAnswer((_) async {
      _user.add(MockUser());
      return MockUserCredential();
    });

    /// Mocking [signInWithEmailAndPassword] function
    /// This means if [email = "emails"] and [password="passwords"]
    /// is passed to the function.
    /// Then it will throw an error.
    when(
      _auth.signInWithEmailAndPassword(
        email: "emails",
        password: "passwords",
      ),
    ).thenThrow((_) {
      return null;
    });

    /// Mocking [createUserWithEmailAndPassword] function
    /// This means if [email = "email"] and [password="password"]
    /// is passed to the function.
    /// Then it will add user to the Stream.
    when(
      _auth.createUserWithEmailAndPassword(
        email: "email",
        password: "password",
      ),
    ).thenAnswer((_) async {
      _user.add(MockUser());
      return MockUserCredential();
    });
    test("Login with correct email and password", () async {
      bool isLogin = await _provider.login(
        "email",
        "password",
      );

      // Verify that it returns true.
      expect(isLogin, true);

      /// Verify that [AuthState] is [LoggedIn].
      expect(_provider.authState, AuthState.LoggedIn);
    });

    test("Login with incorrect email and password", () async {
      bool isLogin = await _provider.login(
        "emails",
        "passwords",
      );

      // Verify that it returns false.
      expect(isLogin, false);

      /// Verify that [AuthState] is [NotLoggedIn].
      expect(_provider.authState, AuthState.NotLoggedIn);
    });

    test("Register user with email and password", () async {
      bool isLogin = await _provider.register(
        "email",
        "password",
      );

      // Verify that it returns true.
      expect(isLogin, true);

      /// Verify that [AuthState] is [Registered].
      expect(_provider.authState, AuthState.Registered);
    });
    test("Log Out user", () async {
      bool isLoggedOut = await _provider.logout();

      // Verify that it returns true.
      expect(isLoggedOut, true);

      /// Verify that [AuthState] is [LoggedOut].
      expect(_provider.authState, AuthState.LoggedOut);
    });
  });
}
