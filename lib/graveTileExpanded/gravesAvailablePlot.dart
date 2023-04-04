import 'package:flutter/material.dart';

class AvailablePlots extends StatelessWidget {
  const AvailablePlots({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Available Plots'),
          Divider(),
          Row(
            children: [
              Text('Single'),
              Text('SingleHolder'),
            ],
          ),
          Divider(),
          Row(
            children: [Text('Companion'), Text('Number')],
          ),
          Divider(),
          Row(
            children: [
              Text('Family'),
              Text('Number'),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text('Cremated Remains'),
              Text('Number'),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text('Total'),
              Text('Number'),
            ],
          ),
        ],
      ),
    );
  }
}
