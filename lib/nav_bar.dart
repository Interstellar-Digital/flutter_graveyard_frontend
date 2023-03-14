import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_provider.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return AppBar(
      title: Row(
        children: [
          const Text('Graveyard Management'),
          const SizedBox(
              width: 10), // Add some spacing between the title and user info
          if (userProvider.user != null) ...[
            Text(
              '${userProvider.user?.username} (${userProvider.user?.role})',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ],
      ),
      actions: [
        if (userProvider.user?.role == 'admin') ...[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Do something for admin user
            },
          ),
        ],
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Log out user
          },
        ),
      ],
    );
  }
}
