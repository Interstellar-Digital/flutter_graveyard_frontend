import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle titles = const TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text(
          'Name',
          style: titles,
        )),
        DataColumn(
            label: Text(
          'Email',
          style: titles,
        )),
        DataColumn(
            label: Text(
          'Contact',
          style: titles,
        )),
        DataColumn(
            label: Text(
          'Purchase Date',
          style: titles,
        )),
        DataColumn(
            label: Text(
          'Status',
          style: titles,
        )),
      ],
      rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(Text('Peter Pan')),
          DataCell(Text('PeterPan@gmail.com')),
          DataCell(Text('123-4567')),
          DataCell(Text('1-10-2021')),
          DataCell(Text('Paid'))
        ]),
        DataRow(cells: <DataCell>[
          DataCell(Text('Marvin Gay')),
          DataCell(Text('MarvenGay@gmail.com')),
          DataCell(Text('309-1283')),
          DataCell(Text('4-11-2023')),
          DataCell(Text('Decilned'))
        ]),
        DataRow(cells: <DataCell>[
          DataCell(Text('Sauske Uchia')),
          DataCell(Text('SasukeUchiha@hotmail.com')),
          DataCell(Text('728-1298')),
          DataCell(Text('02-07-2023')),
          DataCell(Text('Paid'))
        ]), //to make rows dynamic watch this: https://www.youtube.com/watch?v=46RJ6D_g00c
      ],
    );
  }
}
