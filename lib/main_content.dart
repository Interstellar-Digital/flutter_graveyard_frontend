import 'package:flutter/material.dart';


class MainContent extends StatelessWidget {
  // Dummy data for a list of graves
  final List<Map<String, dynamic>> graves = [
    {
      'id': '1',
      'grave_name': 'John Doe',
      'status': 'occupied',
    },
    {
      'id': '2',
      'grave_name': 'Jane Doe',
      'status': 'unoccupied',
    },
    {
      'id': '3',
      'grave_name': 'Alice Smith',
      'status': 'occupied',
    },
    {
      'id': '4',
      'grave_name': 'Bob Johnson',
      'status': 'unoccupied',
    },
    {
      'id': '5',
      'grave_name': 'David Lee',
      'status': 'occupied',
    },
    {
      'id': '6',
      'grave_name': 'Mary Davis',
      'status': 'unoccupied',
    },
    {
      'id': '7',
      'grave_name': 'Tom Brown',
      'status': 'occupied',
    },
    {
      'id': '8',
      'grave_name': 'Sara Wilson',
      'status': 'unoccupied',
    },
    {
      'id': '9',
      'grave_name': 'Mike Jackson',
      'status': 'occupied',
    },
    {
      'id': '10',
      'grave_name': 'Jenny Lopez',
      'status': 'unoccupied',
    },
  ];

  MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;
    if (width >= 600) {
      crossAxisCount = 2;
    }
    if (width >= 900) {
      crossAxisCount = 3;
    }
    if (width >= 1200) {
      crossAxisCount = 4;
    }

    return GridView.builder(
      itemCount: graves.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 2 / 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final grave = graves[index];

        return Card(
          child: ListTile(
            title: Text(grave['grave_name']),
            subtitle: Text('ID: ${grave['id']}, Status: ${grave['status']}'),
          ),
        );
      },
    );
  }
}