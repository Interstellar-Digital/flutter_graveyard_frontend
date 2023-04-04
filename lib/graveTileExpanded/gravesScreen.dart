import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesButtons.dart';
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
      body: Column(
        children: [
          GraveButtons(),
        ],
      ),
    );
  }
}
