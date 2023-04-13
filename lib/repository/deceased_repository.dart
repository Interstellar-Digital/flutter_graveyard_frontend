import 'package:flutter_graveyard_frontend/models/deceased_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//const String baseUrl = 'https://graveyard-api.onrender.com';
const String baseUrl = 'http://localhost:8080';

class DeceasedRepository {
  Future<List<Deceased>?> getDeceasedByGraveId(
      String graveId, String accessToken) async {
    // code to retrieve all deceased for the grave with the given id from the database
    final response = await http.get(
      Uri.parse('$baseUrl/api/deceaseds?grave_id=$graveId'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Deceased> deceaseds = data.map((json) => Deceased.fromJson(json)).toList();
      return deceaseds;
    } else {
      return null;
    }
  }

  Future<Deceased?> getDeceasedById(
      String deceasedId, String accessToken) async {
    // code to retrieve a deceased with the given id from the database
    final response = await http.get(
        Uri.parse('$baseUrl/api/deceaseds?id=$deceasedId'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      Deceased deceased = Deceased.fromJson(data);
      return deceased;
    } else {
      return null;
    }
  }

  Future<List<Deceased>?> getDeceasedByName(
      String name, String accessToken) async {
    // code to retrieve all deceased with the given name from the database
    final response = await http.get(
        Uri.parse('$baseUrl/api/deceaseds?name=$name'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Deceased> deceaseds = data.map((json) => Deceased.fromJson(json)).toList();
      return deceaseds;
    } else {
      return null;
    }
  }

  Future<List<Deceased>?> getDeceasedByGraveyardId(
      String graveyardId, String accessToken) async {
    // code to retrieve all deceased for the graveyard with the given id from the database
    final response = await http.get(
        Uri.parse('$baseUrl/api/deceaseds?graveyard_id=$graveyardId'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Deceased> deceaseds = data.map((json) => Deceased.fromJson(json)).toList();
      return deceaseds;
    } else {
      return null;
    }
  }

  Future<List<Deceased>?> getAllDeceased(String accessToken) async {
    // code to retrieve all deceased from the database
    final response = await http.get(
        Uri.parse('$baseUrl/api/deceaseds'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Deceased> deceaseds = data.map((json) => Deceased.fromJson(json)).toList();
      return deceaseds;
    } else {
      return null;
    }
  }

  /*
  * How to use this method in the flutter code
  * bool result = await DeceasedRepository().createDeceased(name, dateOfBirth, dateOfDeath, causeOfDeath, graveId, accessToken);
  * if (result) {
  * // Deceased created successfully
  * } else {
  * // Failed to create deceased
  * }
  *
  * */
  Future<bool> createDeceased(String name, String dateOfBirth, String dateOfDeath, String causeOfDeath, String graveId, String accessToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/deceaseds'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'date_of_birth': dateOfBirth,
        'date_of_death': dateOfDeath,
        'cause_of_death': causeOfDeath,
        'grave_id': graveId,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      return false;
    }
  }
}
