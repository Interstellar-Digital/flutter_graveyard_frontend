import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/burialTileExpanded/burialsScreen.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesScreen.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';

//import 'package:flutter_graveyard_frontend/graveyardSelection/graveyard_dashboard.dart';

import 'package:flutter_graveyard_frontend/graveyardDashboard/dashboardScreen.dart';
import 'login/login_screen.dart';

void main() => runApp(
    GraveyardManagementSystem()
);

class GraveyardManagementSystem extends StatelessWidget {
  const GraveyardManagementSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
