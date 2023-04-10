import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';
import 'package:flutter_graveyard_frontend/models/user_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LoginDetails extends StatelessWidget {
  const LoginDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Container(
      height: 400,
      width: 500,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(192, 224, 229, 1),
        borderRadius: BorderRadius.circular(20),
      ),
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
              ),
            ),
            TextFormField(
              //username
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Username',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //password
              controller: _passwordController,
              obscureText: true,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                //login button
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    const Color.fromRGBO(147, 198, 231, 1),
                  ),
                ),
                onPressed: () async {
                  final userRepository = UserRepository();
                  try {
                    final User? user = await userRepository.login(
                      _usernameController.text,
                      _passwordController.text,
                    );
                    if (user != null) {
                      // set user to state if user exists
                      Provider.of<UserProvider>(context, listen: false).setUser(
                          user.userID,
                          user.username,
                          user.role,
                          user.accessToken);
                      Provider.of<UserProvider>(context, listen: false).setPageTitle("Select Graveyard");
                      // navigate to selectgraveyard_screen
                      Navigator.of(context).pushReplacementNamed(
                        '/graveyard-selection',
                      );
                    } else {
                      // show error message if login fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid username or password'),
                        ),
                      );
                    }
                  } catch (e) {
                    // show error message if there's an error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                  }
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