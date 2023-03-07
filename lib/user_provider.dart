import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/user_data.dart';
import 'graveyard_list.dart';
import 'user_info.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> login(String username, String password, BuildContext context) async {
    // replace with your authentication logic
    final dummyUser = _dummyUsers.firstWhere((user) => user?.username == username && user?.password == password, orElse: () => null);

    if (dummyUser != null) {
      _user = dummyUser;
      notifyListeners();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const GraveyardSelectionPage()),  (route) => false);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid username or password'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }


  void logout() {
    _user = null;
    notifyListeners();
  }

  // dummy user data
  final List<User?> _dummyUsers = [
    User(id: userData[0]['userid'], username: userData[0]['username'], password: userData[0]['password'], role: userData[0]['role']),
    User(id: userData[0]['userid'], username: userData[0]['username'], password: userData[0]['password'], role: userData[0]['role']),
  ];
}