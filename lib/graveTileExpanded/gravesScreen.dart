import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/addplotPopup.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesAvailablePlot.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesReservedPlots.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesUsedplots.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/removePopup.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/updateGravePricePopup.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:flutter_graveyard_frontend/providers/graveyard_provider.dart';
import 'package:flutter_graveyard_frontend/repository/grave_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GravesScreen extends StatelessWidget {
  final String pageTitle;
  const GravesScreen({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      final graveyardId = prefs.getString('graveyardID');
      final accessToken = prefs.getString("accessToken");


      // GraveRepository().getGravesByGraveyardId(graveyardId!, accessToken!).then((graves) {
      //   print("Graves: $graves");
      // }).catchError((error) {
      //   print("Error: $error");
      // });
    });

    return Scaffold(
      appBar: NavBar(
          context: context,
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: pageTitle,
          showBackArrow: true),
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