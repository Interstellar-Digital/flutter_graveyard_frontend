import 'package:flutter_graveyard_frontend/models/billingInformation_model.dart';

class UserRepository {
  Future<User?> getUserById(int userId) async {
    // code to retrieve a user with the given id from the database
    return null;
  }

  Future<User?> getUserByUsernameAndPassword(
      String username, String password) async {
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

class GraveyardRepository {
  Future<List<Graveyard>?> getAllGraveyards() async {
    // code to retrieve all graveyards from the database
    return null;
  }

  Future<Graveyard?> getGraveyardById(int graveyardId) async {
    // code to retrieve a graveyard with the given id from the database
    return null;
  }

  Future<void> saveGraveyard(Graveyard graveyard) async {
    // code to save the graveyard to the database
  }

  Future<void> deleteGraveyard(int graveyardId) async {
    // code to delete the graveyard with the given id from the database
  }
}

class GraveRepository {
  Future<List<Grave>?> getGravesByGraveyardId(int graveyardId) async {
    // code to retrieve all graves for the graveyard with the given id from the database
    return null;
  }

  Future<Grave?> getGraveById(int graveId) async {
    // code to retrieve a grave with the given id from the database
    return null;
  }

  Future<void> saveGrave(Grave grave) async {
    // code to save the grave to the database
  }

  Future<void> deleteGrave(int graveId) async {
    // code to delete the grave with the given id from the database
  }
}

class DeceasedRepository {
  Future<List<Deceased>?> getDeceasedByGraveId(int graveId) async {
    // code to retrieve all deceased for the grave with the given id from the database
    return null;
  }

  Future<Deceased?> getDeceasedById(int deceasedId) async {
    // code to retrieve a deceased with the given id from the database
    return null;
  }

  Future<void> saveDeceased(Deceased deceased) async {
    // code to save the deceased to the database
  }

  Future<void> deleteDeceased(int deceasedId) async {
    // code to delete the deceased with the given id from the database
  }
}
