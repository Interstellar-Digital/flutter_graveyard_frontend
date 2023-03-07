import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/models/user.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';

enum UserRole {
  admin,
  employee,
}

class UserProvider with ChangeNotifier {
  User _currentUser = User(userID: "userID", username: "username", password: "password", role: "role");
  final UserRepository _userRepository;

  UserProvider(this._userRepository);

  User get currentUser => _currentUser;

  Future<void> login(String username, String password) async {
    final user = await _userRepository.getUserByUsernameAndPassword(
        username, password);
    if (user != null) {
      _currentUser = user;
      notifyListeners();
    } else {
      throw Exception('Invalid credentials');
    }
  }

  void logout() {
    _currentUser = User(userID: "userID", username: "username", password: "password", role: "role");
    notifyListeners();
  }

  bool canViewGraveyardContent() {
    return _currentUser != null &&
        (_currentUser.role == UserRole.admin ||
            _currentUser.role == UserRole.employee);
  }

  bool canViewDeceasedContent() {
    return _currentUser != null && _currentUser.role == UserRole.admin;
  }
}




