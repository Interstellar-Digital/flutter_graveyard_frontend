import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/burialTileExpanded/burialsList.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';

import 'addBurial.dart';
import 'graveSearchbar.dart';

class BurialScreen extends StatelessWidget {
  final String pageTitle;
  const BurialScreen({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(
            context: context,
            onPressCallBack: () {
              Navigator.pop(context);
            },
            pageTitle: pageTitle,
            showBackArrow: true),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 800,
                    child: GraveSearch(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: AddGrave(context),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text('Plot Type',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text('Plot No.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text('Stay',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text('Date of Birth',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text('Date of Death',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            GraveList()
          ],
        ));
  }
}
