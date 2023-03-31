import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'login/login_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          // Add other providers here if needed
        ],
        child: GraveyardManagementSystem(),
      ),
    );

class GraveyardManagementSystem extends StatelessWidget {
  const GraveyardManagementSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return const LoginScreen();
        },
      ),
    );
  }
}
