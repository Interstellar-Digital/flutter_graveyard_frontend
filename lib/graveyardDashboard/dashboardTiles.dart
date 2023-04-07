import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesScreen.dart';

import '../burialTileExpanded/burialsScreen.dart';

class GraveyardDashboardTiles extends StatelessWidget {
  const GraveyardDashboardTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Graves',
      'Burials',
      'Reservations',
      'Report',
      'Payments',
      'Notifications',
    ];
    final List<String> images = [
      'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/graves.png',
      'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/openGraves.png',
      'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/reservedGraves.png',
      'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/report.png',
      'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/payment.png',
      'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/notification.png',
    ];
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 250, right: 250, top: 50),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    if ('${items[index]}' == 'Graves') {
                      return GravesScreen(pageTitle: '${items[index]}');
                    }
                    if ('${items[index]}' == 'Burials') {
                      return BurialScreen(pageTitle: '${items[index]}');
                    }
                    if ('${items[index]}' == 'Reservations') {
                      return GravesScreen(pageTitle: '${items[index]}');
                    }
                    if ('${items[index]}' == 'Report') {
                      return GravesScreen(pageTitle: '${items[index]}');
                    }
                    if ('${items[index]}' == 'Payments') {
                      return GravesScreen(pageTitle: '${items[index]}');
                    }

                    return GravesScreen(pageTitle: '${items[index]}');
                  }),
                );
              },
              child: Card(
                color: Color.fromRGBO(185, 243, 252, 1),
                elevation: 7,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Image.network(
                        '${images[index]}',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${items[index]}',
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
      ),
    );
  }
}
