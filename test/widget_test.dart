// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';
import 'package:flutter_graveyard_frontend/login/login_functionallity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('LoginDetails widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<UserProvider>(
        create: (context) => UserProvider(),
        child: MaterialApp(
          home: Scaffold(
            body: LoginDetails(),
          ),
        ),
      ),
    );

    // Find the TextFormField widgets
    final usernameFieldFinder = find.byType(TextFormField).at(0);
    final passwordFieldFinder = find.byType(TextFormField).at(1);

    // Enter text in username and password fields
    await tester.enterText(usernameFieldFinder, 'admin');
    await tester.enterText(passwordFieldFinder, 'password');

    // Tap on the login button
    await tester.tap(find.text('Log In'));

    // Wait for the widget tree to rebuild
    await tester.pumpAndSettle();

    // Verify that the GraveyardInDistrictSelectionScreen is displayed
    expect(find.byType(GraveyardInDistrictSelectionScreen), findsOneWidget);
  });
}
