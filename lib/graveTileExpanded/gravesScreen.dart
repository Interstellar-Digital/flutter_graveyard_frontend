import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/addplotPopup.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesAvailablePlot.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesReservedPlots.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesUsedplots.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/removePopup.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/updateGravePricePopup.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class GravesScreen extends StatelessWidget {
  final String pageTitle;
  const GravesScreen({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(context: context,
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: pageTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200),
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  RemoveGravePopup(),
                            );
                          },
                          child: Text('Remove Plot/Grave'),
                        ),
                        SizedBox(
                          height: 75,
                        ),
                        AvailablePlots(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  AddGravePopup(),
                            );
                          },
                          child: Text('Add Plot/Grave'),
                        ),
                        SizedBox(
                          height: 75,
                        ),
                        UsedPlots(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  UpdateGravePricePopup(),
                            );
                          },
                          child: Text('Update Price'),
                        ),
                        SizedBox(
                          height: 75,
                        ),
                        ReservedPlots(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
