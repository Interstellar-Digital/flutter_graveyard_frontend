import 'dart:convert';

import 'package:flutter_graveyard_frontend/models/customer_model.dart';
import 'package:http/http.dart' as http;

//const String baseUrl = 'https://graveyard-api.onrender.com';
const String baseUrl = 'http://localhost:8080';

class CustomerRepository {

  Future<List<Customer>> getAllCustomers(String accessTokens) async {
    final response = await http.get(Uri.parse('$baseUrl/api/customers'), headers: {"Authorization": "Bearer $accessTokens"});
    if (response.statusCode == 200) {
      final List<dynamic> customersJson = jsonDecode(response.body);
      return customersJson.map((json) => Customer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  Future<Customer?> getCustomerById(String id, String accessTokens) async {
    final response = await http.get(Uri.parse('$baseUrl/api/customers?id=$id'), headers: {"Authorization": "Bearer $accessTokens"});
    if (response.statusCode == 200) {
      final dynamic customerJson = jsonDecode(response.body);
      return Customer.fromJson(customerJson);
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to load customer');
    }
  }

  Future<List<Customer>> getCustomerByName(String name, String accessTokens) async {
    final response = await http.get(Uri.parse('$baseUrl/api/customers?name=$name'), headers: {"Authorization": "Bearer $accessTokens"});
    if (response.statusCode == 200) {
      final List<dynamic> customersJson = jsonDecode(response.body);
      return customersJson.map((json) => Customer.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Customer not found');
    } else {
      throw Exception('Failed to load customers');
    }
  }

  Future<void> createCustomer(String accessToken, String name, String phoneNumber, String emailAddress, {String? id}) async {
    final Map<String, String> body = {
      "name": name,
      "phone_number": phoneNumber,
      "email_address": emailAddress,
    };
    if (id != null) {
      body["id"] = id;
    }

    final response = await http.post(
      Uri.parse('$baseUrl/api/customers'),
      headers: {"Authorization": "Bearer $accessToken", "Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      return;
    } else if (response.statusCode == 400) {
      throw Exception('Missing parameters or ID already in use');
    } else {
      throw Exception('Failed to create customer');
    }
  }

  Future<void> updateCustomerByPhoneNumber(String accessToken, String id, String phoneNumber) async {
    final Map<String, String> body = {
      "id": id,
      "phone_number": phoneNumber
    };

    final response = await http.put(
      Uri.parse('$baseUrl/api/customers'),
      headers: {"Authorization": "Bearer $accessToken", "Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 400) {
      throw Exception('Missing parameters');
    } else if (response.statusCode == 404) {
      throw Exception('Customer not found');
    } else {
      throw Exception('Failed to update customer');
    }
  }

  Future<void> updateCustomerByEmail(String accessToken, String id, String emailAddress) async {
    final Map<String, String> body = {
      "id": id,
      "email_address": emailAddress
    };

    final response = await http.put(
      Uri.parse('$baseUrl/api/customers'),
      headers: {"Authorization": "Bearer $accessToken", "Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 400) {
      throw Exception('Missing parameters');
    } else if (response.statusCode == 404) {
      throw Exception('Customer not found');
    } else {
      throw Exception('Failed to update customer');
    }
  }

  Future<void> deleteCustomer(String id, String accessToken) async {
    final url = Uri.parse('$baseUrl/api/customers?id=$id');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      print('Customer deleted');
    } else {
      throw Exception('Failed to delete customer');
    }
  }

}