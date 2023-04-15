import 'package:flutter_graveyard_frontend/models/customer_model.dart';
import 'package:flutter_graveyard_frontend/models/grave_model.dart';
import 'package:flutter_graveyard_frontend/repository/customer_repository.dart';
import 'package:flutter_graveyard_frontend/repository/reservations_repository.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_graveyard_frontend/repository/grave_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('ReservationsRepository', () {
    late CustomerRepository customerRepository;
    late UserRepository userRepository;
    late GraveRepository graveRepository;
    late ReservationsRepository reservationsRepository;
    late String accessToken;
    late String customerId = "WaJJRDksa3cr9XmvBxjl";
    late String graveId;
    late Grave graveToReserve;
    late String graveyardName = "Test Graveyard";

    setUpAll(() async {
      userRepository = UserRepository();
      customerRepository = CustomerRepository();
      graveRepository = GraveRepository();
      reservationsRepository = ReservationsRepository();
      final user = await userRepository.login('newuser', 'newpassword');
      accessToken = user!.accessToken!;
      final availableGraves = await graveRepository.getAvailableGraves(accessToken);
      graveToReserve = availableGraves.first;
      graveId = graveToReserve.graveID;
    });

    test('createReservation', () async {


      // Create a reservation for the customer
      final now = DateTime.now();
      final reserveDate = "2023-06-06";

      await reservationsRepository.createReservation(accessToken, customerId, reserveDate, graveId);

      // Verify that the reservation was created
      final reservations = await reservationsRepository.getAllReservations(accessToken);
      final reservation = reservations.firstWhere((r) => r.userID == customerId && r.graveID == graveId);
      expect(reservation.userID, customerId);
      expect(reservation.graveID, graveId);
    });

    test('updateReservation', () async {
      // First, create a reservation to update
      final now = DateTime.now();
      final reserveDate = DateFormat('yyyy-MM-dd').format(now.add(Duration(days: 1)));
      await reservationsRepository.createReservation(accessToken, customerId, reserveDate, graveId);

      // Get the created reservation
      final reservations = await reservationsRepository.getAllReservations(accessToken);
      final reservation = reservations.firstWhere((r) => r.userID == customerId && r.graveID == graveId);

      // Update the reservation
      final newReserveDate = DateFormat('yyyy-MM-dd').format(now.add(Duration(days: 2)));
      await reservationsRepository.updateReservation(accessToken, reservation.reservationID, newReserveDate);

      // Verify that the reservation was updated
      final updatedReservations = await reservationsRepository.getAllReservations(accessToken);
      final updatedReservation = updatedReservations.firstWhere((r) => r.userID == customerId && r.graveID == graveId);
      expect(updatedReservation.reservationID, reservation.reservationID);
      DateTime date = DateFormat('E, d MMM yyyy HH:mm:ss zzz').parse(updatedReservation.reservationDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      expect(formattedDate, newReserveDate);
    });

    test('getAllReservations', () async {
      final reservations = await reservationsRepository.getAllReservations(accessToken);
      expect(reservations, isNotEmpty);
    });

    test('deleteReservation', () async {
      // Create a reservation for the customer
      final now = DateTime.now();
      final reserveDate = "2023-09-09";
      await reservationsRepository.createReservation(accessToken, customerId, reserveDate, graveId);

      // Get the created reservation
      final reservations = await reservationsRepository.getAllReservations(accessToken);
      final reservation = reservations.firstWhere((r) => r.userID == customerId && r.graveID == graveId);

      // Delete the reservation
      await reservationsRepository.deleteReservation(reservation.reservationID, accessToken);

      // Verify that the reservation was deleted
      final deletedReservation = await reservationsRepository.getReservationById(accessToken, reservation.reservationID);
      expect(deletedReservation, isNull);
    });



  });
}