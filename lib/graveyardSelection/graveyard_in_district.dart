import 'package:flutter/material.dart';

class GraveyardInDiscrict extends StatelessWidget {
  const GraveyardInDiscrict({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'San Juan Public Cemetery',
      'Tunapuna Cemetery',
      'Five Rivers Islamic Cemetery',
      'Streamham Lodge',
    ];
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 250, right: 250, top:50) ,
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            mainAxisSpacing: 15.0, // Spacing between rows
            crossAxisSpacing: 10.0, // Spacing between columns
            childAspectRatio: 3/2.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Color.fromRGBO(185,243,252, 1),
              elevation: 7,
              child: Center(
                child: Text(
                  '${items[index]}',
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
