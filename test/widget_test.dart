// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitnest/main.dart';
import 'package:fitnest/core/controllers/settings_controller.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final settings = SettingsController();
    await settings.loadSettings();
    await tester.pumpWidget(MyApp(settings: settings));

    // Verify that our counter starts at 0.
    expect(find.text('Hello'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Hello'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
