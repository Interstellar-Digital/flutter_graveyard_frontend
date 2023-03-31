import 'package:flutter/foundation.dart';
import 'package:flutter_graveyard_frontend/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  String? get role => _user?.role; // get method for role property

  set password(String password) {
    if (_user != null) {
      _user!.password = password;
      notifyListeners();
    }
  }

  set username(String username) {
    if (_user != null) {
      _user!.username = username;
      notifyListeners();
    }
  }

  bool get isAdmin {
    if (_user != null && _user!.role == 'admin') {
      return true;
    } else {
      return false;
    }
  }

  void login(String username, String password) {
    if (username == 'admin' && password == 'password') {
      _user = User(
        userID: '123',
        username: username,
        password: password,
        role: 'admin',
      );
      notifyListeners();
    } else if(username == "user" && password == 'password'){
      _user = User(
        userID: '124',
        username: username,
        password: password,
        role: 'user',
      );
      notifyListeners();
    } else {
      throw Exception('Invalid login credentials');
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}