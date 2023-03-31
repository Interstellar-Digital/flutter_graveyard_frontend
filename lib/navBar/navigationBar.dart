import 'package:flutter/material.dart';

PreferredSize NavBar() {
  return PreferredSize(
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
              'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/gp_logo.png'),
          //backbutton
          Text(
            'Select Graveyard', //dynamic
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
