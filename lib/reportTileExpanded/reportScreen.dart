import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:flutter_graveyard_frontend/reportTileExpanded/quarterReport.dart';
import 'package:flutter_graveyard_frontend/reportTileExpanded/reportList.dart';

class ReportScreen extends StatelessWidget {
  final String pageTitle;
  const ReportScreen({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(
            context: context,
            onPressCallBack: () {
              Navigator.pop(context);
            },
            pageTitle: pageTitle),
        body: Padding(
          padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
          child: Column(
            children: [QuarterReport(), ReportTable()],
          ),
        ));
  }
}
