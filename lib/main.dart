import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/burialTileExpanded/burialsScreen.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesScreen.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';
import 'package:flutter_graveyard_frontend/graveyardDashboard/dashboardScreen.dart';
import 'package:flutter_graveyard_frontend/login/login_screen.dart';

import 'package:provider/provider.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // Add other providers here as necessary
      ],
      child: GraveyardManagementSystem(),
    ),
  );
}

class GraveyardManagementSystem extends StatelessWidget {
  const GraveyardManagementSystem({Key? key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return MaterialApp(
      title: 'Graveyard Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: user != null ? '/dashboard' : '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => GraveyardDashboard(pageTitle: '', accessToken: ''),
        '/graveyard-selection': (context) => GraveyardInDistrictSelectionScreen(),
        '/graves': (context) => GravesScreen(pageTitle: ''),
        '/burials': (context) => BurialScreen(pageTitle: ''),
      },
    );
  }
}