import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesAvailablePlot.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesReservedPlots.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesUsedplots.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class GravesScreen extends StatelessWidget {
  const GravesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: 'CemteryGrave_Placeholder'),
      body: Row(
        children: [
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Remove Plot/Grave'),
              ),
              AvailablePlots(),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Plot/Grave'),
              ),
              UsedPlots(),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Update Price'),
              ),
              ReservedPlots(),
            ],
          ),
        ],
      ),
    );
  }
}
