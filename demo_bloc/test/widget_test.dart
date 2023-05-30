import 'dart:math';

import 'package:demo_bloc/main.dart';
import 'package:demo_bloc/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Display TextField', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    await tester.enterText(textField, '18');
    expect(find.text('18'), findsOneWidget);
  });
}
