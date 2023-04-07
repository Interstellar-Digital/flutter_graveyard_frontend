import 'package:flutter/material.dart';

class UsedPlots extends StatelessWidget {
  const UsedPlots({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15,),
        child: Column(
          children: [
            Text('Used Plots'),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Single'),
                Text('SingleHolder'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Companion'), Text('Number')],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Family'),
                Text('Number'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cremated Remains'),
                Text('Number'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('Number'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
