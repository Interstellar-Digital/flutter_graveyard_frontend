
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
            NotificationSearch(),
            SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text('Email',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text('Contact',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text('Purchase Date',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text('Status',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              ),
            ),
            SizedBox(
              width: 50,
            ),
            NotificationList(),
          ],
        ),
      ),
    );
  }
}