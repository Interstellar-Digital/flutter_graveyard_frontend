import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';

class LoginDetails extends StatelessWidget {
  const LoginDetails({super.key});
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
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //password
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                //login button
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(147, 198, 231, 1)),
                ),
                onPressed: () {
                  //navigate to selectgraveyard_screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                      const GraveyardInDistrictSelectionScreen(),
                    ),
                  );
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