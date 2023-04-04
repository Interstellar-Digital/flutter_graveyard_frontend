import 'package:flutter/material.dart';
import 'dashboardTiles.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class GraveyardDashboard extends StatelessWidget {
  const GraveyardDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: 'Graveyard_Pageholder'),
      body: GraveyardDashboardTiles(),
    );
  }
}
