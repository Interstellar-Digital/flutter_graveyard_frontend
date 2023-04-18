import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesScreen.dart';
import 'package:flutter_graveyard_frontend/notificationTileExpanded/notificationScreen.dart';
import 'package:flutter_graveyard_frontend/paymentTileExpaned/paymentScreen.dart';
import 'package:flutter_graveyard_frontend/reportTileExpanded/reportScreen.dart';
import 'package:flutter_graveyard_frontend/reservationTileExpanded/reservationScreen.dart';
import '../burialTileExpanded/burialsScreen.dart';

class GraveyardDashboardTiles extends StatefulWidget {
  const GraveyardDashboardTiles({Key? key});

  @override
  GraveyardDashboardTilesState createState() =>
      GraveyardDashboardTilesState();
}

class GraveyardDashboardTilesState extends State<GraveyardDashboardTiles> {
  final List<String> items = [
    'Graves',
    'Burials',
    'Reservations',
    'Report',
    'Payments',
    'Notifications',
  ];
  final List<String> images = [
    'assets/graves.png',
    'assets/openGraves.png',
    'assets/reservedGraves.png',
    'assets/report.png',
    'assets/payment.png',
    'assets/notification.png',
  ];
  final List<String> routes = [
    '/graves',
    '/burials',
    '/reservations',
    '/report',
    '/payments',
    '/notifications',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.15,
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          mainAxisSpacing: 15.0, // Spacing between rows
          crossAxisSpacing: 10.0, // Spacing between columns
          childAspectRatio: 3 / 2.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, routes[index]);
            },
            child: Card(
              color: Color.fromRGBO(185, 243, 252, 1),
              elevation: 7,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Image.asset(
                      images[index],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      items[index],
                      style: TextStyle(fontSize: 24.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
