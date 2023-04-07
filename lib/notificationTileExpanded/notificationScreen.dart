import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(onPressCallBack: (){}, pageTitle: 'NotificationScreenHolder'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nothing here yet'),
          ],
        ),
      ),
    );
  }
}