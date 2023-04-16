import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_graveyard_frontend/login/login_functionallity.dart';

void main() {
  testWidgets('LoginDetails should render login button and input fields', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginDetails(),
        ),
      ),
    );
    expect(find.text('Log In'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
  });
}