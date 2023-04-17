import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:flutter_graveyard_frontend/notificationTileExpanded/notificationList.dart';
import 'package:flutter_graveyard_frontend/notificationTileExpanded/notificationSearchbar.dart';

class NotificationScreen extends StatelessWidget {
  final String pageTitle;
  const NotificationScreen({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          context: context,
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: pageTitle),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: SizedBox(
                child: NotificationSearch(),
                width: 800,
              ),
            ),
            NotificationList(),
          ],
        ),
      ),
    );
  }
}
