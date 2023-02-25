import 'package:flutter/material.dart';
import 'graves.dart';
import 'grave_details_page.dart';

class MainContent extends StatelessWidget {
  final Map<String, dynamic>? selectedGraveyard;

  const MainContent({Key? key, required this.selectedGraveyard})
      : super(key: key);

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Graves in ${selectedGraveyard?['name']}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Graves in ${selectedGraveyard?['name']}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: graves.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 2 / 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                final grave = graves[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GraveDetailsPage(grave: grave),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(grave['grave_name']),
                      subtitle: Text(
                          'ID: ${grave['id']}, Status: ${grave['status']}'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
