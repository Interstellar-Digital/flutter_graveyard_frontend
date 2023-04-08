import 'package:flutter/material.dart';
import 'graveyard_in_district.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class GraveyardInDistrictSelectionScreen extends StatelessWidget {
  const GraveyardInDistrictSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          context: context,
          onPressCallBack: () {},
          pageTitle: 'Select Graveyard',
          showBackArrow: false),
      body: GraveyardInDiscrict(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(254, 222, 255, 1),
        child: Text(
          '+Add',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {}, //add cemetery tile
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
