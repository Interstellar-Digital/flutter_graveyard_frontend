import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/login_page.dart';
import 'package:flutter_graveyard_frontend/main_content.dart';
import 'package:flutter_graveyard_frontend/graveyard_list.dart';

class DashboardPage extends StatelessWidget {
  final Map<String, dynamic>? selectedGraveyard;

  const DashboardPage({Key? key, required this.selectedGraveyard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 1,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    title: const Text('Dashboard'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Graveyards'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Sales'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: selectedGraveyard != null
                ? MainContent(selectedGraveyard: selectedGraveyard)
                : const GraveyardSelectionPage(),
          ),
        ],
      ),
    );
  }
}
