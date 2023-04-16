import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
          onPressCallBack: () {},
          pageTitle: 'payment method',
          context: context),
      body: Column(
        children: [
          Text(
            'Please fill out the information below to make payment *',
            style: TextStyle(
              fontSize: 24,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 20,
                child: Container(color: Colors.grey, child: Text('VISA')),
              ),
              SizedBox(
                width: 40,
                height: 20,
                child: Container(color: Colors.grey, child: Text('Credit')),
              )
            ],
          ),
          Card(
            color: Color.fromRGBO(174, 226, 255, 1),
            child: Column(
              children: [
                TextFormField(
                    decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Card Number',
                )),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                          decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Expiration Date',
                      )),
                    ),
                    SizedBox(
                      width: 200,
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
                TextFormField(
                    decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'First Name',
                )),
                TextFormField(
                    decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Last Name',
                )),
                TextButton(onPressed: () {}, child: Text('Purchase')),
                TextButton(onPressed: () {}, child: Text('Cancel'))
              ],
            ),
          )
        ],
      ),
    );
  }
}