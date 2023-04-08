import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveyardDashboard/dashboardScreen.dart';

class GraveyardInDiscrict extends StatelessWidget {
  const GraveyardInDiscrict({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [      'San Juan Public Cemetery',      'Tunapuna Cemetery',      'Five Rivers Islamic Cemetery',      'Streamham Lodge',    ];

    EdgeInsets padding = EdgeInsets.only(top: 50);
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS || Platform.isFuchsia) {
      padding = EdgeInsets.symmetric(horizontal: 250, vertical: 50);
    }

    return Container(
      child: Padding(
        padding: padding,
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
                  MaterialPageRoute(
                    builder: (BuildContext context) => GraveyardDashboard(pageTitle:'${items[index]}',),
                  ),);
              },
              child: Card(
                color: Color.fromRGBO(185, 243, 252, 1),
                elevation: 7,
                child: Center(
                  child: Text(
                    '${items[index]}',
                    style: TextStyle(fontSize: 24.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}