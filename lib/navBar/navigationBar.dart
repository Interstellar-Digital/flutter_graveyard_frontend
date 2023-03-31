import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';

PreferredSize NavBar() {
  return PreferredSize(
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
              'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/gp_logo.png'),
          //backbutton
          Consumer<UserProvider>(
            builder: (context, userProvider, _) {
              final user = userProvider.user;
              final username = user != null ? user.username : '';
              return Text(
                'Welcome, $username!', // display username if user is logged in
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            },
          ),
          Row(
            children: [
              Image.network(
                  'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/usericon.png'),
              Image.network(
                  'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/AddUser.png'),
            ],
          )
        ],
      ),
      color: Color.fromRGBO(174, 226, 255, 1),
    ),
    preferredSize: Size.fromHeight(80),
  );
}
