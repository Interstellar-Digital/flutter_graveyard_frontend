import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                Text('<'),
                Text('Year'),
                Text('>'),
                Text('<'),
                Text('Month'),
                Text('>')
              ],
            ),
            DataTable(columns: <DataColumn>[
              DataColumn(
                label: Text(' '),
              ),
              DataColumn(
                label: Text(' '),
              ),
              DataColumn(
                label: Text(' '),
              ),
              DataColumn(
                label: Text(' '),
              ),
              DataColumn(
                label: Text(' '),
              ),

            ], rows: <DataRow>[])
          ],
        ),
      ),
    );
  }
}
