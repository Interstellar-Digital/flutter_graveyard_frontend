import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_graveyard_frontend/models/user_model.dart';

const String baseUrl = 'https://graveyard-api.onrender.com';

class UserRepository {

  Future<User?> login(String username, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/login'),
        body: jsonEncode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return User.fromJson(json);
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }

  Future<void> logout() async {
    final response = await http.post(Uri.parse('$baseUrl/logout'));

    if (response.statusCode != 200) {
      throw Exception('Failed to logout: ${response.statusCode}');
    }
  }

  Future<User?> signup(String username, String password, String role) async {
    final response = await http.post(Uri.parse('$baseUrl/signup'),
        body: jsonEncode({'username': username, 'password': password, 'role': role}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      throw Exception('Failed to signup: ${response.statusCode}');
    }
  }
  Future<User?> getUserById(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      throw Exception('Failed to get user by id: ${response.statusCode}');
    }
  }

  Future<User?> getUserByUsernameAndPassword(
      String username, String password) async {
    final response = await http
        .get(Uri.parse('$baseUrl/user?username=$username&password=$password'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      throw Exception(
          'Failed to get user by username and password: ${response.statusCode}');
    }
  }

  Future<List<User>?> getAllUsers() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/users'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List<User> users = [];
      for (var user in json) {
        users.add(User.fromJson(user));
      }
      return users;
    } else {
      throw Exception('Failed to get all users: ${response.statusCode}');
    }
  }

  Future<void> saveUser(User user) async {
    final response = await http.post(Uri.parse('$baseUrl/users'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception('Failed to save user: ${response.statusCode}');
    }
  }

  Future<void> deleteUser(int userId) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user: ${response.statusCode}');
    }
  }
}
