import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/login_page.dart';
import 'package:flutter_graveyard_frontend/main_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
            child: MainContent(),
          ),
        ],
      ),
    );
  }
}