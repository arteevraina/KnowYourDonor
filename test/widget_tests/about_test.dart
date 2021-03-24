import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:knowyourdonor/views/about.dart';

Widget createAboutDemoScreen() => MaterialApp(
      home: About(),
    );

void main() {
  group("About Page Tests", () {
    testWidgets("Check if About Page shows up", (tester) async {
      await tester.pumpWidget(createAboutDemoScreen());

      /// Check if [About Page] shows up.
      expect(
        find.byType(About),
        findsOneWidget,
      );
    });
  });
}
