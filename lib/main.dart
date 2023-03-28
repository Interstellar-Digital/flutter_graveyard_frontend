import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';
import 'login/login_screen.dart';

void main() => runApp(GraveyardManagementSystem());

class GraveyardManagementSystem extends StatelessWidget {
  const GraveyardManagementSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: GraveyardInDistrictSelectionScreen()


    );
  }
}

