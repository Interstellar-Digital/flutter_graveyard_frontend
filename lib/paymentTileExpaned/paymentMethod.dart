import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          onPressCallBack: () {
            Navigator.pop(context);
          },
          pageTitle: 'payment method',
          context: context),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
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
              width: 700,
              decoration: BoxDecoration(
                color: Color.fromRGBO(174, 226, 255, 1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, offset: Offset(1, 2), blurRadius: 5)
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 20,
                        child:
                            Container(color: Colors.grey, child: Text('VISA')),
                      ),
                      SizedBox(
                        width: 40,
                        height: 20,
                        child: Container(
                            color: Colors.grey, child: Text('Credit')),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 600,
                      child: TextFormField(
                          decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Card Number',
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                            decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Expiration Date',
                        )),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                            decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'CVV',
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 600,
                    child: TextFormField(
                        decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'First Name',
                    )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 600,
                    child: TextFormField(
                        decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Last Name',
                    )),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('Purchase',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ))),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
