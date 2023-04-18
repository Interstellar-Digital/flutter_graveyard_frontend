import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:flutter_graveyard_frontend/paymentTileExpaned/paymentDetails.dart';

class PaymentScreen extends StatelessWidget {
  final String pageTitle;
  const PaymentScreen({super.key, required this.pageTitle});

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
              padding: const EdgeInsets.only(top: 30, bottom: 60),
              child: Text(
                'Please fill out the information below to make payment *',
                style: TextStyle(
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
            Container(
              width: 800,
              child: PaymentDetail(),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 199, 199),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, offset: Offset(1, 4), blurRadius: 9)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
