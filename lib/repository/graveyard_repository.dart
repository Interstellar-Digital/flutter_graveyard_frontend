import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';

const String baseUrl = 'http://localhost:8080';

class GraveyardRepository {
  Future<List<Graveyard>?> getAllGraveyards() async {
    final response = await http.get(Uri.parse('$baseUrl/graveyards'));
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      final List<Graveyard> graveyards = responseBody
          .map((dynamic item) => Graveyard.fromJson(item))
          .toList();
      return graveyards;
    } else {
      throw Exception('Failed to retrieve graveyards');
    }
  }

  Future<Graveyard?> getGraveyardById(int graveyardId) async {
    final response = await http.get(Uri.parse('$baseUrl/graveyards/$graveyardId'));
    if (response.statusCode == 200) {
      final dynamic responseBody = json.decode(response.body);
      return Graveyard.fromJson(responseBody);
    } else {
      throw Exception('Failed to retrieve graveyard');
    }
  }

  Future<void> saveGraveyard(Graveyard graveyard) async {
    final response = await http.post(
      Uri.parse('$baseUrl/graveyards'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(graveyard.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create graveyard');
    }
  }

  Future<void> deleteGraveyard(int graveyardId) async {
    final response = await http.delete(Uri.parse('$baseUrl/graveyards/$graveyardId'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete graveyard');
    }
  }
}