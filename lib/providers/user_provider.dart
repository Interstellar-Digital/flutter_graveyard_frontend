import 'package:flutter/foundation.dart';
import 'package:flutter_graveyard_frontend/models/user_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  User? _user;
  String? pageTitle = "";

  User? get user => _user;

  String? get role => _user?.role; // get method for role property
  UserProvider() {
    loadUserFromPrefs(); // add this line
  }

  Future<void> saveUserToPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', _user?.userID ?? '');
    prefs.setString('username', _user?.username ?? '');
    prefs.setString('role', _user?.role ?? '');
    prefs.setString('accessToken', _user?.accessToken ?? '');
  }

  Future<void> login(String username, String password) async {
    final User? user = await _userRepository.login(username, password);
    _user = user;
    print(_user);
    notifyListeners();
  }

  Future<void> logout() async {
    await _userRepository.logout();
    _user = null;
    notifyListeners();
  }

  Future<void> loadUserFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userID = prefs.getString('userID');
    final String? username = prefs.getString('username');
    final String? role = prefs.getString('role');
    final String? accessToken = prefs.getString('accessToken');
    if (userID != null && username != null && role != null && accessToken != null) {
      _user = User(userID: userID, username: username, role: role, accessToken: accessToken);
      notifyListeners();
    }
  }

  void setUser(String? userID, String username, String role, String? accessToken) {
    _user = User(userID: userID, username: username, role: role, accessToken: accessToken);
    saveUserToPrefs();
    notifyListeners();
  }
  void setPageTitle(String? title) {
    pageTitle = title;
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