// This is a basic Flutter widget test.

// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:meditation_app/screens/sessionScreen.dart';
import 'package:meditation_app/widgets/timerWidget.dart';

void main() {
  testWidgets('Start session buttton test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: Timerwidget())));

    final buttonFinder = find.text('Start timer');
    expect(buttonFinder, findsAny);
  
    // Tap the '+' icon and trigger a frame.
    await tester.tap(buttonFinder);
    await tester.pump();

    // // Verify that our counter has incremented.
    expect(find.text('Start timer'), findsNothing);
    expect(find.text('Pause'), findsAny);
    expect(find.text('End session'), findsAny);
  });
}
