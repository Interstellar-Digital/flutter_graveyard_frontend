import 'package:flutter/material.dart';

class QuarterReport extends StatelessWidget {
  const QuarterReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                  'Input Year then Select Quater you would like a report for *')
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.grey,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left:20, right: 20),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                        decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Year',
                    )),
                  ),
                  Text('First Quarter'),
                  Text('Second Quarter'),
                  Text('Third Quarter'),
                  Text('Fourth Quarter'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}