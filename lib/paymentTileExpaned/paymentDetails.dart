import 'package:flutter/material.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'First Name *',
              )),
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
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email*',
              )),
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
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Plot Number *',
              )),
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
         TextButton(onPressed: (){}, child: Text('Coninue')),
         TextButton(onPressed: (){}, child: Text('Cancel'))
      ],
    );
  }
}
