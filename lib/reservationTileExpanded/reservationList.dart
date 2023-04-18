import 'package:flutter/material.dart';

class ReservationList extends StatelessWidget {
  ReservationList({super.key});
  
  @override
  Widget build(BuildContext context) {
    TextStyle titles = const TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );

    return DataTable(columns: <DataColumn>[
      DataColumn(
          label: Text(
        'Name',
        style: titles,
      )),
      DataColumn(
          label: Text(
        'Plot Type',
        style: titles,
      )),
      DataColumn(
          label: Text(
        'Plot No.',
        style: titles,
      )),
      DataColumn(
          label: Text(
        'Contact',
        style: titles,
      )),
      DataColumn(
          label: Text(
        'Reservation',
        style: titles,
      )),
      DataColumn(
          label: Text(
        '    ',
        style: titles,
      )),
    ], rows: <DataRow>[
      DataRow(cells: <DataCell>[
        DataCell(Text('Johnny Test')),
        DataCell(Text('family')),
        DataCell(Text('155')),
        DataCell(Text('281-2917')),
        DataCell(Text('2-10-2023')),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ],
        ))
      ]),
      DataRow(cells: <DataCell>[
        DataCell(Text('Marven Gay')),
        DataCell(Text('single')),
        DataCell(Text('190')),
        DataCell(Text('309-1283')),
        DataCell(Text('4-11-2023')),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ],
        ))
      ])
    ]);
  }
}
