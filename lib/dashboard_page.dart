import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/login_page.dart';

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
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
            child: ListView(
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
          Expanded(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: Text('Main Content'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}