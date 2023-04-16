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

import '../models/grave_model.dart';

class GravesScreen extends StatefulWidget {
  final String pageTitle;
  const GravesScreen({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _GravesScreenState createState() => _GravesScreenState();
}

class _GravesScreenState extends State<GravesScreen> {
  int _numGraves = 0;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final graveyardId = prefs.getString('graveyardID');
      final accessToken = prefs.getString("accessToken");

      GraveRepository().getGravesByGraveyardId(graveyardId!, accessToken!).then((graves) {
        setState(() {
          _numGraves = graves!.length;
        });
      }).catchError((error) {
        print("Error: $error");
      });
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200),
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Text('Number of Graves: $_numGraves', style: TextStyle(fontSize: 18)),
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}