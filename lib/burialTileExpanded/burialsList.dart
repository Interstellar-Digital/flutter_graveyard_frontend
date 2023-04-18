import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/repository/deceased_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/deceased_model.dart';

class GraveList extends StatefulWidget {
  GraveList({super.key});

  @override
  State<GraveList> createState() => _GraveListState();
}

class _GraveListState extends State<GraveList> {
  int _numDeceased = 0;
  late List<Deceased> deceased;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final graveyardId = prefs.getString('graveyardID');
      final accessToken = prefs.getString("accessToken");

      DeceasedRepository().getAllDeceased(accessToken!).then((graves) {
        setState(() {
          _numDeceased = graves!.length;
          deceased = graves;
        });
      }).catchError((error) {
        print("Error: $error");
      });
    });
  }

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
        'Stay',
        style: titles,
      )),
      DataColumn(
          label: Text(
        'Date of Birth',
        style: titles,
      )),
      DataColumn(
          label: Text(
        'Date of Death',
        style: titles,
      )),
      DataColumn(
          label: Text(
        '    ',
        style: titles,
      )),
    ], rows: <DataRow>[
      DataRow(cells: <DataCell>[
        DataCell(Text('$_numDeceased')),
        DataCell(Text('family')),
        DataCell(Text('155')),
        DataCell(Text('6')),
        DataCell(Text('2-10-1964')),
        DataCell(Text('19-8-2000')),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ],
        )),
      ]),
      DataRow(cells: <DataCell>[
        DataCell(Text('Dalisay Traversa')),
        DataCell(Text('single')),
        DataCell(Text('190')),
        DataCell(Text('3')),
        DataCell(Text('4-11-2000')),
        DataCell(Text('20-7-2022')),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ],
        )),
      ]),
    ]);
  }
}
