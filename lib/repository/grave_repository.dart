import 'package:flutter_graveyard_frontend/models/grave_model.dart';

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