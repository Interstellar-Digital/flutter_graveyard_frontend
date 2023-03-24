
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
