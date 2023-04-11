import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraveyardProvider with ChangeNotifier {
  String _graveyardID = '';
  String _graveyardName = '';

  String get graveyardID => _graveyardID;
  String get graveyardName => _graveyardName;

  set graveyardID(String id) {
    _graveyardID = id;
    notifyListeners();
  }

  set graveyardName(String name) {
    _graveyardName = name;
    notifyListeners();
  }

  GraveyardProvider() {
    loadGraveyardID();
  }
  Future<void> setGraveyardID(String id, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('graveyardID', id);
    await prefs.setString('graveyardName', name);
    _graveyardID = id;
    _graveyardName = name;
    notifyListeners();
  }

  Future<void> setGraveyardIDAndName(String id, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('graveyardID', id);
    await prefs.setString('graveyardName', name);
    graveyardID = id;
    graveyardName = name;
    notifyListeners();
  }

  Future<void> loadGraveyardID() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('graveyardID') ?? '';
    final name = prefs.getString('graveyardName') ?? '';
    graveyardID = id;
    graveyardName = name;
    notifyListeners();
  }

  Future<void> clearGraveyardIDAndName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('graveyardID');
    await prefs.remove('graveyardName');
    graveyardID = '';
    graveyardName = '';
    notifyListeners();
  }
}