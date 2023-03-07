import 'package:flutter_graveyard_frontend/models/user.dart';
class UserRepository {
  Future<User?> getUserById(int userId) async {
    // code to retrieve a user with the given id from the database
    return null;
  }

  Future<User?> getUserByUsernameAndPassword(String username, String password) async {
    // code to retrieve a user with the given username and password from the database

    return null;
  }

  Future<void> saveUser(User user) async {
    // code to save the user to the database
  }

  Future<void> deleteUser(int userId) async {
    // code to delete the user with the given id from the database
  }
}