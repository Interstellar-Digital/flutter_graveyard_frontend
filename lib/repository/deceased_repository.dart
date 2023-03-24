import 'package:flutter_graveyard_frontend/models/deceased_model.dart';

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
