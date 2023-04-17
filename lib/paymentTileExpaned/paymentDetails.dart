import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/paymentTileExpaned/paymentMethod.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'First Name *',
              )),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Middle Name',
              )),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Last Name *',
              )),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Contact *',
              )),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email*',
              )),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Address *',
              )),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Plot Type *',
              )),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Plot Number *',
              )),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Date *',
              )),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => PaymentMethodScreen()),
                ),
              );
            },
            child: Text('Coninue')),
        TextButton(onPressed: () {}, child: Text('Cancel'))
      ],
    );
  }
}
