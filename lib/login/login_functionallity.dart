import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LoginDetails extends StatelessWidget {
  LoginDetails({super.key});
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 500,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(192, 224, 229, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                )),
            TextFormField(
              //username
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Username',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onChanged: (value) {
                context.read<UserProvider>().username = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //password
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onChanged: (value) {
                context.read<UserProvider>().password = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                //login button
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(147, 198, 231, 1)),
                ),
                onPressed: () async {
                  //navigate to selectgraveyard_screen
                  final username = _usernameController.text;
                  final password = _passwordController.text;

                  context.read<UserProvider>().login(username, password);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const GraveyardInDistrictSelectionScreen(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Logged In"),
                    backgroundColor: Colors.greenAccent,
                  ));
                },
                child: const Text('Log In'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
