import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';

import '../models/user_model.dart';

const String baseUrl = 'https://graveyard-api.onrender.com/api';
//const String baseUrl = 'http://localhost:8080/api';

class GraveyardRepository {
  Future<List<Graveyard>>? getAllGraveyards(String accessToken, String username) async {
    final response = await http.get(
      Uri.parse('$baseUrl/graveyards'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
        'name': username,
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      final List<Graveyard> graveyards = responseBody
          .map((dynamic item) => Graveyard.fromJson(item))
          .toList();
      return graveyards;
    } else {
      throw Exception('Failed to retrieve graveyards: ${response.statusCode}');
    }
  }

  Future<List<Graveyard>>? getAllGraveyardsForUser(String accessToken, String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/graveyards?owner_id=$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      final List<Graveyard> graveyards = responseBody
          .map((dynamic item) => Graveyard.fromJson(item))
          .toList();
      return graveyards;
    } else {
      throw Exception('Failed to retrieve graveyards: ${response.statusCode}');
    }
  }

  Future<Graveyard?> getGraveyardById(String graveyardId, String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/graveyards?id=$graveyardId'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      final dynamic responseBody = json.decode(response.body);
      return Graveyard.fromJson(responseBody);
    } else {
      throw Exception('Failed to retrieve graveyard');
    }
  }
  Future<Graveyard?> getGraveyardByName(String graveyardName, String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/graveyards?name=$graveyardName'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.isNotEmpty) {
        final graveyardData = json[0];
        final String id = graveyardData['id'];
        final int max_plots = graveyardData['max_plots'];
        final String graveyardName = graveyardData['name'];
        final String graveyardLocation = graveyardData['location'];

        return Graveyard(graveyardID: id, name: graveyardName, location: graveyardLocation, numberOfPlots: max_plots);
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to retrieve graveyard');
    }
  }

  Future<void> saveGraveyard(Graveyard graveyard, String userID, String accessToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/graveyards'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'name': graveyard.name,
        'location': graveyard.location,
        'max_plots': graveyard.numberOfPlots,
        'owner_id': userID,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create graveyard: ${response.statusCode}');
    }
  }

  Future<void> deleteGraveyard(String graveyardId, String accessToken) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/graveyards?id=$graveyardId'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete graveyard');
    }
  }
}