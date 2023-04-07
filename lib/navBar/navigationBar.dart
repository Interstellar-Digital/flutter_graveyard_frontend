import 'package:flutter/material.dart';
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
              Image.network(
                  'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/gp_logo.png'),
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
                child: Image.network(
                    'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/usericon.png'),
              ),
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
