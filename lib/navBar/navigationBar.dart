import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/profile/adminProfile.dart';

import 'package:provider/provider.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';

import 'package:flutter_graveyard_frontend/profile/adminProfile.dart';


PreferredSize NavBar(
    {required void Function()? onPressCallBack,
    required String pageTitle,
    required BuildContext context}) {
  return PreferredSize(
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                  'assets/gp_logo.png'),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: onPressCallBack,
              ),
            ],
          ),
          Text(
            pageTitle, //dynamic
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const ProfilePage(),
                    ),
                  );
                },
                child: Image.asset(
                    'assets/usericon.png'),
              ),
              Image.asset(
                  'assets/AddUser.png'),
            ],
          )
        ],
      ),
      color: Color.fromRGBO(174, 226, 255, 1),
    ),
    preferredSize: Size.fromHeight(80),
  );
}
