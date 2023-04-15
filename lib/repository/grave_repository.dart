import 'dart:convert';

import 'package:flutter_graveyard_frontend/models/grave_model.dart';
import 'package:http/http.dart' as http;

//const String baseUrl = 'https://graveyard-api.onrender.com';
const String baseUrl = 'http://localhost:8080';
class GraveRepository {
  Future<List<Grave>?> getGravesByGraveyardId(String graveyardId, String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/graves?graveyard_id=$graveyardId'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> gravesJson = jsonDecode(response.body);
      final List<Grave> graves = gravesJson.map((e) => Grave.fromJson(e)).toList();
      return graves;
    } else {
      throw Exception('Failed to load graves');
    }
  }

  Future<Grave?> getGraveById(String graveId, String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/graves?id=$graveId'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if(response.statusCode == 200){
      final dynamic responseBody = jsonDecode(response.body);
      return Grave.fromJson(responseBody);
    }else{
      throw Exception('Failed to retrieve graveyard');
    }

  }

  Future<void> saveGrave(String plotNumber, String accessToken, String graveyardID) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/graves'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, dynamic>{
        'plot_num': int.parse(plotNumber),
        'graveyard_id': graveyardID,
      }),
    );

    if (response.statusCode == 201) {
      print('Grave created successfully');
    } else {
      throw Exception('Failed to create grave');
    }
  }

  Future<void> deleteGrave(String graveId, String accessToken) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/graves?id=$graveId'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 404) {
      throw Exception('Grave not found');
    } else {
      throw Exception('Failed to delete grave');
    }
  }


  Future<List<Grave>> getAvailableGraves(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/graves/available'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> gravesJson = jsonDecode(response.body);
      final List<Grave> graves = gravesJson.map((e) => Grave.fromJson(e)).toList();
      return graves;
    } else {
      throw Exception('Failed to load available graves');
    }
  }

  Future<List<Grave>> getUnavailableGraves(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/graves/unavailable'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> gravesJson = jsonDecode(response.body);
      final List<Grave> graves =
      gravesJson.map((e) => Grave.fromJson(e)).toList();
      return graves;
    } else {
      throw Exception('Failed to load available graves');
    }
  }


  Future<void> updateGrave(String graveId, String date, String accessToken) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/graves'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, dynamic>{
        'id': graveId,
        'date': date,
      }),
    );

    if (response.statusCode == 200) {
      print('Grave updated successfully');
    } else if (response.statusCode == 404) {
      throw Exception('Grave not found');
    } else {
      throw Exception('Failed to update grave');
    }
  }


}