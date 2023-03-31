import 'package:flutter/material.dart';
import 'login_functionallity.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            color: const Color.fromRGBO(174, 226, 255, 1),
            child: Row(
              children: [
                SizedBox(
                  child: Image.network(
                    'https://raw.githubusercontent.com/Interstellar-Digital/images/main/images/gp_logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(child: LoginDetails()));
  }
}
