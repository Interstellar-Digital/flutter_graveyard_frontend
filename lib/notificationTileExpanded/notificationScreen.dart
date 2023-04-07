import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class NotificationScreen extends StatelessWidget {
  final String pageTitle;
  const NotificationScreen({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: pageTitle),
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
