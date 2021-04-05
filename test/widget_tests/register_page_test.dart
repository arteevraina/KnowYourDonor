// Library imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Local imports.
import 'package:knowyourdonor/views/login_page.dart';
import 'package:knowyourdonor/views/register_page.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/provider/bottom_navigation_provider.dart';
import 'package:knowyourdonor/repository/donorRepository.dart';
import 'package:knowyourdonor/repository/seekerRepository.dart';
import '../mock.dart';

Widget createRegisterPageDemoScreen() => MultiProvider(
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
        home: RegisterPage(),
      ),
    );

void main() {
  /// Initializing [FirebaseApp] just as in [main.dart].
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });
  group("Register Page Tests", () {
    testWidgets("Check if Register Page shows up", (tester) async {
      await tester.pumpWidget(createRegisterPageDemoScreen());

      /// Check if [Register Page] shows up.
      expect(
        find.byType(RegisterPage),
        findsOneWidget,
      );
    });

    testWidgets("Validations return false when empty form is submitted",
        (tester) async {
      await tester.pumpWidget(createRegisterPageDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Get hold of Register button.
      var registerButton = find.text("Register");

      // Tap on the Register button.
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );

      /// Verify that we are still on [Register Page].
      expect(
        find.byType(RegisterPage),
        findsOneWidget,
      );
    });

    testWidgets("Validations return false when incorrect email is submitted",
        (tester) async {
      await tester.pumpWidget(createRegisterPageDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Get hold of Register button.
      var registerButton = find.text("Register");

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

      // Tap on the Register button.
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );

      /// Verify that we are still on [Register Page].
      expect(
        find.byType(RegisterPage),
        findsOneWidget,
      );
    });

    testWidgets("Validations return false when incorrect password is submitted",
        (tester) async {
      await tester.pumpWidget(createRegisterPageDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Get hold of Register button.
      var registerButton = find.text("Register");

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
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );

      /// Verify that we are still on [Register Page].
      expect(
        find.byType(RegisterPage),
        findsOneWidget,
      );
    });

    testWidgets(
        "Validations return false when correct email & password is submitted",
        (tester) async {
      await tester.pumpWidget(createRegisterPageDemoScreen());

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

    testWidgets("On Log In tap navigates to Log In Page", (tester) async {
      await tester.pumpWidget(createRegisterPageDemoScreen());

      // Find Log In! text.
      var login = find.text("Already registered ? Log In!");

      // Tap on the Log In! text.
      await tester.tap(login);
      await tester.pumpAndSettle();

      // Check if Login Page shows up.
      expect(
        find.byType(LoginPage),
        findsOneWidget,
      );
    });
  });
}
