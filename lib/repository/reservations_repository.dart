import 'dart:convert';

import 'package:flutter_graveyard_frontend/models/reservation_model.dart';
import 'package:http/http.dart' as http;

//const String baseUrl = 'https://graveyard-api.onrender.com';
const String baseUrl = 'http://localhost:8080';

class ReservationsRepository {
  Future<void> createReservation(String accessToken, String customerId, String reservationDate, String graveId, {String? id}) async {
    final url = Uri.parse('$baseUrl/api/reservations');
    final body = {
      'customer_id': customerId,
      'reservation_date': reservationDate,
      'grave_id': graveId,
    };
    if (id != null) {
      body["id"] = id;
    }
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(body));
    if (response.statusCode == 201) {
      print('Reservation created');
    } else {
      throw Exception('Failed to create reservation');
    }
  }

  Future<Reservation?> getReservationById(String accessToken, String reservationId) async {
    final url = Uri.parse('$baseUrl/api/reservations?id=$reservationId');
    final response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Reservation.fromJson(data);
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to get reservation');
    }
  }

  Future<List<Reservation>> getReservationByCustomerId(String accessToken, String customerId) async {
    final url = Uri.parse('$baseUrl/api/reservations?customer_id=$customerId');
    final response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => Reservation.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Reservation not found');
    } else {
      throw Exception('Failed to get reservations');
    }
  }

  Future<List<Reservation>> getReservationByGraveId(String accessToken, String graveId) async {
    final url = Uri.parse('$baseUrl/api/reservations?grave_id=$graveId');
    final response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => Reservation.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Reservation not found');
    } else {
      throw Exception('Failed to get reservations');
    }
  }

  Future<List<Reservation>> getAllReservations(String accessToken) async {
    final url = Uri.parse('$baseUrl/api/reservations');
    final response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => Reservation.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get reservations');
    }
  }

  Future<void> updateReservation(String accessToken, String reservationId, String reservationDate) async {
    final url = Uri.parse('$baseUrl/api/reservations');
    final body = {
      'id': reservationId,
      'reservation_date': reservationDate,
    };
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(body));
    if (response.statusCode == 200) {
      print('Reservation updated');
    } else if (response.statusCode == 404) {
      throw Exception('Reservation not found');
    } else {
      throw Exception('Failed to update reservation');
    }
  }

  Future<void> deleteReservation(String id, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/reservations?id=$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print('Reservation deleted successfully');
    } else if (response.statusCode == 404) {
      print('Reservation not found');
    } else {
      print('Failed to delete reservation: ${jsonDecode(response.body)['message']}');
    }
  }

}