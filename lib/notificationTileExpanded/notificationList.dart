import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  NotificationList({super.key});

  final List<String> name = <String>[
    //make the name lenght constant so it prints to the screen properly
    'Peter Pan       ',
    'Marvin Gay      ',
    'Sauske Uchia    ',
  ];
  final List<String> email = <String>[
    'PeterPan@gmail.com        ',
    'MarvenGay@gmail.com       ',
    'SasukeUchiha@hotmail.com  ',
  ];
  final List<String> contact = <String>[
    '123-4567',
    '309-1283',
    '728-1298',
  ];
  final List<String> purchaseDate = <String>[
    '1-10-2021 ',
    '4-11-2023 ',
    '02-07-2023',
  ];
  final List<String> status = <String>['Paid    ', 'Decilned', 'Paid    '];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return Column(
                  children: [
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${name[index]}'),
                        Text('${email[index]}'),
                        Text('${contact[index]}'),
                        Text('${purchaseDate[index]}'),
                        Text('${status[index]}'),
                      ],
                    ),
                  ],
                );
              })),
    );
  }
}