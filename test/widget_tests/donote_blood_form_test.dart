import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:knowyourdonor/views/donate_blood_form.dart';
import 'package:knowyourdonor/provider/auth_provider.dart';
import 'package:knowyourdonor/provider/bottom_navigation_provider.dart';
import 'package:knowyourdonor/repository/donorRepository.dart';
import 'package:knowyourdonor/repository/seekerRepository.dart';
import '../mock.dart';

Widget createDonateBloodFormDemoScreen() => MultiProvider(
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
        home: DonateBlood(),
      ),
    );

void main() {
  /// Initializing [FirebaseApp] just as in [main.dart].
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group("Blood Form Tests", () {
    testWidgets("Check if Blood Form shows up", (tester) async {
      await tester.pumpWidget(createDonateBloodFormDemoScreen());

      /// Check if [Blood Form] shows up.
      expect(
        find.byType(DonateBlood),
        findsOneWidget,
      );
    });

    testWidgets("Form does not submit when fields are kept empty",
        (tester) async {
      await tester.pumpWidget(createDonateBloodFormDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Get the hold of Post button.
      var post = find.text("Post");

      // Tap on the Post button.
      await tester.tap(post);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );
    });

    testWidgets("Form does not submit when any of field is kept empty",
        (tester) async {
      await tester.pumpWidget(createDonateBloodFormDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      /// Get the total number of [TextFormField]'s.
      var length = tester.widgetList(find.byType(TextFormField)).length;

      /// Get the number between [0, 4].
      var index = Random().nextInt(length);

      if (index == 0) {
        // Fill all the other TextFormFields except at index 0.
        // Fill in Address Line.
        await tester.enterText(
          find.byType(TextFormField).at(1),
          "Durga Nagar, Jammu",
        );

        // Fill in bloodgroup field.
        await tester.enterText(
          find.byType(TextFormField).at(2),
          "A+",
        );

        // Fill in phonenumber.
        await tester.enterText(
          find.byType(TextFormField).at(3),
          "9419191919",
        );
      } else if (index == 1) {
        // Fill all the other TextFormFields except at index 1.
        // Fill in Donors Name.
        await tester.enterText(
          find.byType(TextFormField).at(0),
          "Arteev Raina",
        );

        // Fill in bloodgroup field.
        await tester.enterText(
          find.byType(TextFormField).at(2),
          "A+",
        );

        // Fill in phonenumber.
        await tester.enterText(
          find.byType(TextFormField).at(3),
          "9419191919",
        );
      } else if (index == 2) {
        // Fill all the other TextFormFields except at index 2.
        // Fill in Donors Name.
        await tester.enterText(
          find.byType(TextFormField).at(0),
          "Arteev Raina",
        );

        // Fill in Address Line.
        await tester.enterText(
          find.byType(TextFormField).at(1),
          "Durga Nagar, Jammu",
        );

        // Fill in phonenumber.
        await tester.enterText(
          find.byType(TextFormField).at(3),
          "9419191919",
        );
      } else if (index == 3) {
        // Fill all the other TextFormFields except at index 3.
        // Fill in Donors Name.
        await tester.enterText(
          find.byType(TextFormField).at(0),
          "Arteev Raina",
        );

        // Fill in Address Line.
        await tester.enterText(
          find.byType(TextFormField).at(1),
          "Durga Nagar, Jammu",
        );

        // Fill in bloodgroup field.
        await tester.enterText(
          find.byType(TextFormField).at(2),
          "A+",
        );
      }

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );
    });

    testWidgets("Form validates to true when all fields are correctly filled",
        (tester) async {
      await tester.pumpWidget(createDonateBloodFormDemoScreen());

      /// Get the hold of [Form] Widget.
      var form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      var formKey = form.key as GlobalKey<FormState>;

      // Fill in Donors Name.
      await tester.enterText(
        find.byType(TextFormField).at(0),
        "Arteev Raina",
      );

      // Fill in Address Line.
      await tester.enterText(
        find.byType(TextFormField).at(1),
        "Durga Nagar, Jammu",
      );

      // Fill in bloodgroup field.
      await tester.enterText(
        find.byType(TextFormField).at(2),
        "A+",
      );

      // Fill in phonenumber.
      await tester.enterText(
        find.byType(TextFormField).at(3),
        "9419191919",
      );

      // Verify that key's current state validates to true.
      expect(
        formKey.currentState.validate(),
        true,
      );
    });
  });
}
