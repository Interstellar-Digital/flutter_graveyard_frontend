import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:flutter_graveyard_frontend/reservationTileExpanded/addReservation.dart';
import 'package:flutter_graveyard_frontend/reservationTileExpanded/reservationList.dart';
import 'package:flutter_graveyard_frontend/reservationTileExpanded/reservationSearchbar.dart';

class ReservationScreen extends StatelessWidget {
  final String pageTitle;
  const ReservationScreen({super.key, required this.pageTitle});

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
                    child: ReservationSearch(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: AddReservation(context),
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
                  Text('Contact',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text('Reservation Date',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            ReservationList()
          ],
        ));
  }
}
