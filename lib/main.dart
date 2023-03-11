import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/dashboard_page.dart';
import 'package:flutter_graveyard_frontend/login_page.dart';

import 'package:provider/provider.dart';
import 'package:flutter_graveyard_frontend/user_provider.dart';
import 'package:flutter_graveyard_frontend/graveyards.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => DashboardPage(selectedGraveyard: graveyards[0])
      },
    );
  }
}
