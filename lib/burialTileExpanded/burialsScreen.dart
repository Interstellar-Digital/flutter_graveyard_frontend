import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';

import 'graveSearchbar.dart';

class BurialScreen extends StatelessWidget {
  const BurialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(
            onPressCallBack: () {}, pageTitle: 'District_BurialScreenHolder'),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchGraveList(),
                    );
                  },
                  icon: Icon(Icons.search),
                ),
                FloatingActionButton(
                  backgroundColor: Color.fromRGBO(6,208,111, 1),
                  child: Text(
                    '+Add',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: () {}, //add person to grave list
                )
              ],
            ),
            Column(),
          ],
        ));
  }
}
