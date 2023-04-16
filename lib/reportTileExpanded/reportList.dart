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
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(),
                      children: [
                        // buildRow([
                        //   '   ',
                        //   'Single',
                        //   'Companion',
                        //   'Family',
                        //   'Cremated Remains',
                        //   'Total'
                        // ]),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // TableRow buildRow(List<String> cells) => TableRow(
  //   children: cells.map((cell){
  //     return Padding(
  //       padding: EdgeInserts.all(12),
  //       child: Center(child: Text(cell)),
  //     );
  //   }
  // ),
  // );
     
}