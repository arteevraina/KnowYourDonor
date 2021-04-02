import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:knowyourdonor/views/login_page.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/provider/bottom_navigation_provider.dart';
import 'package:knowyourdonor/repository/donorRepository.dart';
import 'package:knowyourdonor/repository/seekerRepository.dart';
import '../mock.dart';

Widget createLoginPageDemoScreen() => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider.instance(),
        ),
        ChangeNotifierProvider(
          create: (_) => SeekerRepository(FirebaseFirestore.instance),
        ),
        ChangeNotifierProvider(
          create: (_) => DonorRepository(FirebaseFirestore.instance),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(),
        )
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );

void main() {
  /// Initializing [FirebaseApp] just as in [main.dart].
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group("Login Page Tests", () {
    testWidgets("Check if Login Page shows up", (tester) async {
      await tester.pumpWidget(createLoginPageDemoScreen());

      /// Check if [Login Page] shows up.
      expect(
        find.byType(LoginPage),
        findsOneWidget,
      );
    });

    testWidgets("Validations return false when empty form is submitted",
        (tester) async {
      await tester.pumpWidget(createLoginPageDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Get hold of Login button.
      var loginButton = find.text("Login");

      // Tap on the Login button.
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );

      /// Verify that we are still on [Login Page].
      expect(
        find.byType(LoginPage),
        findsOneWidget,
      );
    });

    testWidgets("Validations return false when incorrect email is submitted",
        (tester) async {
      await tester.pumpWidget(createLoginPageDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Get hold of Login button.
      var loginButton = find.text("Login");

      // Fill in email field.
      await tester.enterText(
        find.byType(TextFormField).at(0),
        "arteev",
      );

      // Fill in password field.
      await tester.enterText(
        find.byType(TextFormField).at(1),
        "abcd1234",
      );

      // Tap on the Login button.
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );

      /// Verify that we are still on [Login Page].
      expect(
        find.byType(LoginPage),
        findsOneWidget,
      );
    });

    testWidgets("Validations return false when incorrect password is submitted",
        (tester) async {
      await tester.pumpWidget(createLoginPageDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Get hold of Login button.
      var loginButton = find.text("Login");

      // Fill in email field.
      await tester.enterText(
        find.byType(TextFormField).at(0),
        "arteev@live.in",
      );

      // Fill in password field.
      await tester.enterText(
        find.byType(TextFormField).at(1),
        "abc",
      );

      // Tap on the Register button.
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );

      /// Verify that we are still on [Login Page].
      expect(
        find.byType(LoginPage),
        findsOneWidget,
      );
    });

    testWidgets(
        "Validations return false when correct email & password is submitted",
        (tester) async {
      await tester.pumpWidget(createLoginPageDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Fill in email field.
      await tester.enterText(
        find.byType(TextFormField).at(0),
        "arteev@live.in",
      );

      // Fill in password field.
      await tester.enterText(
        find.byType(TextFormField).at(1),
        "abcd12234",
      );

      // Verify that key's current state validates to true.
      expect(
        formKey.currentState.validate(),
        true,
      );
    });
  });
}
