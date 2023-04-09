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
  const GraveyardManagementSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}