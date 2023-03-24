import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';

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