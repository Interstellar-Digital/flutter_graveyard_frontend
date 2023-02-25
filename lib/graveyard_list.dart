import 'package:flutter/material.dart';
import 'graveyards.dart';
import 'main_content.dart';

class GraveyardSelectionPage extends StatelessWidget {
  const GraveyardSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Graveyard'),
      ),
      body: ListView.builder(
        itemCount: graveyards.length,
        itemBuilder: (BuildContext context, int index) {
          final graveyard = graveyards[index];
          return ListTile(
            title: Text(graveyard['name']),
            subtitle: Text(graveyard['location']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MainContent(selectedGraveyard: graveyard),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
