import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/nav_bar.dart';
import 'graveyards.dart';
import 'main_content.dart';

class GraveyardSelectionPage extends StatelessWidget {
  const GraveyardSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: graveyards.length,
            itemBuilder: (BuildContext context, int index) {
              final graveyard = graveyards[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            //TODO: implement delete functionality
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            //TODO: implement add functionality
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListTile(
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
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}