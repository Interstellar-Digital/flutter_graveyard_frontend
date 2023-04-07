import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';
import 'graveyard_in_district.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:provider/provider.dart';

class GraveyardInDistrictSelectionScreen extends StatelessWidget {
  const GraveyardInDistrictSelectionScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    bool isAdmin = userProvider.role == 'admin';

    return Scaffold(
      appBar: NavBar(context: context, onPressCallBack: () {  }, pageTitle: 'Select Graveyard'),
      body: GraveyardInDiscrict(),
      floatingActionButton: isAdmin
          ? FloatingActionButton(
        backgroundColor: Color.fromRGBO(254, 222, 255, 1),
        child: Text(
          '+Add',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          //add cemetery tile
        },
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      )
          : null,
    );
  }
}