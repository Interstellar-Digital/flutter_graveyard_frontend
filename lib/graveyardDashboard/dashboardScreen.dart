import 'package:flutter/material.dart';
import 'dashboardTiles.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class GraveyardDashboard extends StatelessWidget {
  final String pageTitle;
  const GraveyardDashboard({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          context: context,
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: pageTitle,
          showBackArrow: true),
      body: GraveyardDashboardTiles(),
    );
  }
}
