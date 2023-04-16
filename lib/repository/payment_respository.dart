import 'dart:convert';

import 'package:flutter_graveyard_frontend/models/payment_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://graveyard-api.onrender.com';
//const String baseUrl = 'http://localhost:8080';

class PaymentRepository {

  Future<List<Payment>> getAllPayments() async {
    final response = await http.get(Uri.parse('$baseUrl/api/payments'));
    if (response.statusCode == 200) {
      List<dynamic> paymentsJson = jsonDecode(response.body);
      List<Payment> payments = paymentsJson.map((json) => Payment.fromJson(json)).toList();
      return payments;
    } else {
      throw Exception('Failed to load payments');
    }
  }

  Future<Payment> getPaymentById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/payments?id=$id'));
    if (response.statusCode == 200) {
      dynamic paymentJson = jsonDecode(response.body);
      Payment payment = Payment.fromJson(paymentJson);
      return payment;
    } else {
      throw Exception('Failed to load payment');
    }
  }

  Future<List<Payment>> getPaymentsByCustomerId(String customerId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/payments?customer_id=$customerId'));
    if (response.statusCode == 200) {
      List<dynamic> paymentsJson = jsonDecode(response.body);
      List<Payment> payments = paymentsJson.map((json) => Payment.fromJson(json)).toList();
      return payments;
    } else {
      throw Exception('Failed to load payments');
    }
  }

  Future<void> createPayment(Payment payment, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/payments'),
      headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
      body: jsonEncode({
        'customer_id': payment.customerId,
        'user_id': payment.userId,
        'amount': payment.amount,
        'date_created': payment.dateCreated,
        'id': payment.id,
      }),
    );

    if (response.statusCode == 201) {
      print('Payment created successfully');
    } else {
      print('Failed to create payment: ${jsonDecode(response.body)['message']}');
    }
  }

  Future<void> deletePayment(String paymentId, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/payments?id=$paymentId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print('Payment deleted successfully');
    } else {
      print('Failed to delete payment: ${jsonDecode(response.body)['message']}');
    }
  }


}
