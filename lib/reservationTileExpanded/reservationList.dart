import 'package:flutter/material.dart';

class ReservationList extends StatelessWidget {
  ReservationList({super.key});

  final List<String> reservationName = <String>[
    //make the name lenght constant so it prints to the screen properly
    'Johnny Test     ',
    'Marven Gay      ',
  ];
  final List<String> reservedPlotType = <String>[
    'family',
    'single',
  ];
  final List<String> reservedPlotNo = <String>[
    '155',
    '190',
  ];
  final List<String> contact = <String>[
    '281-2917',
    '309-1283',
  ];
  final List<String> reservationDate = <String>[
    '2-10-2023',
    '4-11-2023',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: ListView.builder(
              itemCount: reservationName.length,
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
                        Text('${reservationName[index]}'),
                        Text('${reservedPlotType[index]}'),
                        Text('${reservedPlotNo[index]}'),
                        Text('${contact[index]}'),
                        Text('${reservationDate[index]}'),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete))
                          ],
                        )
                      ],
                    ),
                  ],
                );
              })),
    );
  }
}
