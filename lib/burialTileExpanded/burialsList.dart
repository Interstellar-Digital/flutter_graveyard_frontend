import 'package:flutter/material.dart';

class GraveList extends StatelessWidget {
  GraveList({super.key});

  final List<String> deceased = <String>[
    //make the name lenght constant so it prints to the screen properly
    'John Doe        ',
    'Dalisay Traversa',
  ];
  final List<String> plotType = <String>[
    'family',
    'single',
  ];
  final List<String> plotNo = <String>[
    '155',
    '190',
  ];
  final List<String> stay = <String>[
    '6',
    '3',
  ];
  final List<String> dateOfBirth = <String>[
    '2-10-1964',
    '4-11-2000',
  ];
  final List<String> dateOfDeath = <String>[
    '19-8-2000',
    '20-7-2022',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: ListView.builder(
              itemCount: deceased.length,
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
                        Text('${deceased[index]}'),
                        Text('${plotType[index]}'),
                        Text('${plotNo[index]}'),
                        Text('${stay[index]}'),
                        Text('${dateOfBirth[index]}'),
                        Text('${dateOfDeath[index]}'),
                        Row(
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
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
