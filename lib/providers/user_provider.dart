import 'package:flutter/foundation.dart';
import 'package:flutter_graveyard_frontend/models/user_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  User? _user;

  User? get user => _user;

  String? get role => _user?.role; // get method for role property

  Future<void> login(String username, String password) async {
    final User? user = await _userRepository.login(username, password);
    _user = user;
    notifyListeners();
  }

  Future<void> logout() async {
    await _userRepository.logout();
    _user = null;
    notifyListeners();
  }
  // add the setUser method
  void setUser(String username, String role) {
    _user = User(username: username, role: role);
    notifyListeners();
  }


  String? get userId => _user?.userID;

  bool get isAdmin {
    if (_user != null && _user!.role == 'admin') {
      return true;
    } else {
      return false;
    }
  }
}