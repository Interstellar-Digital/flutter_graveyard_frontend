import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class ReportScreen extends StatelessWidget {
  final String pageTitle;
  const ReportScreen({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: pageTitle),
    );
  }
}
