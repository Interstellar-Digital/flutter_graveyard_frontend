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
            PaymentDetail(),
          ],
        ),
      ),
    );
  }
}