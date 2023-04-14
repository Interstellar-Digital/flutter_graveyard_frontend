import 'package:flutter_graveyard_frontend/models/customer_model.dart';
import 'package:flutter_graveyard_frontend/repository/customer_repository.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('CustomerRepository', () {
    late CustomerRepository customerRepository;
    late UserRepository userRepository;
    late String accessToken;
    late String customerId;

    setUpAll(() async {
      userRepository = UserRepository();
      final user = await userRepository.login('newuser', 'newpassword');
      accessToken = user!.accessToken!;
      customerRepository = CustomerRepository();

    });

    test('getAllCustomers', () async {
      final customers = await customerRepository.getAllCustomers(accessToken);
      expect(customers, isInstanceOf<List<Customer>>());
      expect(customers.length, greaterThan(0));
      expect(customers[0], isInstanceOf<Customer>());
    });

    test('getAllCustomers throws an exception if the access token is invalid', () async {
      final invalidAccessToken = 'invalid-access-token';
      expect(() async => await customerRepository.getAllCustomers(invalidAccessToken), throwsException);
    });

    test('createCustomer', () async {
      final customerName = 'John Doe';
      final customerPhoneNumber = '123-456-7890';
      final customerEmailAddress = 'johndoe@example.com';

      await customerRepository.createCustomer(accessToken, customerName, customerPhoneNumber, customerEmailAddress);

      // Verify that the customer was successfully created by trying to get it
      final allCustomers = await customerRepository.getAllCustomers(accessToken);
      final createdCustomer = allCustomers.firstWhere((customer) => customer.name == customerName);

      expect(createdCustomer, isNotNull);
      expect(createdCustomer.name, equals(customerName));
      expect(createdCustomer.phoneNumber, equals(customerPhoneNumber));
      expect(createdCustomer.emailAddress, equals(customerEmailAddress));
    });

    test('updateCustomerPhoneNumber', () async {
      final customerName = 'John Doe';
      final newPhoneNumber = '132-312-4431';
      final allCustomers = await customerRepository.getAllCustomers(accessToken);
      final customerToUpdate = allCustomers.firstWhere((customer) => customer.name == customerName);
      final customerId = customerToUpdate.id;
      await customerRepository.updateCustomerByPhoneNumber(accessToken, customerId, newPhoneNumber);

      // retrieve the updated customer to check the new phone number
      final updatedCustomer = await customerRepository.getCustomerById(customerId, accessToken);
      expect(updatedCustomer.phoneNumber, newPhoneNumber);
    });

    test('updateCustomerEmail', () async {
      final customerName = 'John Doe';
      final newEmail = 'NewJohn@gmail.com';
      final allCustomers = await customerRepository.getAllCustomers(accessToken);
      final customerToUpdate = allCustomers.firstWhere((customer) => customer.name == customerName);
      final customerId = customerToUpdate.id;
      await customerRepository.updateCustomerByEmail(accessToken, customerId, newEmail);

      // retrieve the updated customer to check the new phone number
      final updatedCustomer = await customerRepository.getCustomerById(customerId, accessToken);
      expect(updatedCustomer.emailAddress, newEmail);
    });


  });
}