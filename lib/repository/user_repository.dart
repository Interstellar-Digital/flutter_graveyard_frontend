import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_graveyard_frontend/models/user_model.dart';

const String baseUrl = 'https://graveyard-api.onrender.com';
//const String baseUrl = 'http://localhost:8080';

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

  Future<User?> getUserByUsername(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/api/users?username=$username'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.isNotEmpty) {
        final userData = json[0];
        final String id = userData['id'];
        final String username = userData['username'];
        final String password = userData['password'];
        int role = userData['role'];
        String newRole = "";
        if (role == 1) {
          newRole = 'admin';
        } else if (role == 2) {
          newRole = 'employee';
        }
        return User(userID: id, username: username, role: newRole);
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to get user by username: ${response.statusCode}');
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
    int newRole = 0;

    if (user.role == 'admin') {
      newRole = 1;
    } else if (user.role == 'employee') {
      newRole = 2;
    }

    final response = await http.post(Uri.parse('$baseUrl/api/users'),
        body: jsonEncode({
          'username': user.username,
          'password': user.password,
          'role': newRole,
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 201) {
      throw Exception('Failed to save user: ${response.statusCode}');
    }
  }

  Future<void> deleteUser(String? id, String token) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/users?id=$id'),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user: ${response.statusCode}');
    }
  }
}
