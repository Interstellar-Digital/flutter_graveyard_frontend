import 'package:flutter/material.dart';
import 'dashboardTiles.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class GraveyardDashboard extends StatefulWidget {
  final String pageTitle;
  final String accessToken;
  const GraveyardDashboard({Key? key, required this.pageTitle, required this.accessToken}) : super(key: key);

  @override
  GraveyardDashboardState createState() => GraveyardDashboardState();
}

class GraveyardDashboardState extends State<GraveyardDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          context: context,
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: widget.pageTitle,
          showBackArrow: true),
      body: GraveyardDashboardTiles(),
    );
  }
}