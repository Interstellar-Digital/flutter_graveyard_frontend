import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_graveyard_frontend/login_page.dart';
import 'package:flutter_graveyard_frontend/main_content.dart';
import 'package:flutter_graveyard_frontend/graveyard_list.dart';
import 'package:flutter_graveyard_frontend/user_provider.dart';

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
              final userProvider =
                  Provider.of<UserProvider>(context, listen: false);
              userProvider.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return Row(
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
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        'Welcome, ${userProvider.user?.username ?? 'Unknown'}'),
                    Text('Role: ${userProvider.user?.role ?? 'Unknown'}'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
