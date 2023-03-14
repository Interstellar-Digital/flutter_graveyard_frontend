import 'package:flutter/material.dart';

class GraveDetailsPage extends StatelessWidget {
  final Map<String, dynamic> grave;

  const GraveDetailsPage({required this.grave, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(grave['grave_name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${grave['id']}'),
            Text('Status: ${grave['status']}'),
          ],
        ),
      ),
    );
  }
}
