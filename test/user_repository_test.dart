import 'package:flutter_graveyard_frontend/models/user_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserRepository', () {
    late UserRepository userRepository;

    setUp(() {
      userRepository = UserRepository();
    });

    test('loginUser', () async {
      // Arrange
      final username = 'newuser';
      final password = 'newpassword';

      // Act
      final result = await userRepository.login(username, password);

      // Assert
      expect(result, isA<User>());
      expect(result!.username, username);
    });

    test('loginThrowExcep', () async {
      // Arrange
      final username = 'wronguser';
      final password = 'wrongpassword';

      // Act & Assert
      expect(() => userRepository.login(username, password), throwsA(isA<Exception>()));
    });

    test('saveUser', () async {
      // Arrange
      // final user = User(username: 'emp', password: 'employee', role: 'employee');
      // final user = User(username: 'newuser', password: 'newpassword', role: 'admin');
      final user = User(username: 'admin2', password: 'admin2password', role: 'admin');
      // Act
      await userRepository.saveUser(user);

      // Assert
      final result = await userRepository.getUserByUsername(user.username);
      expect(result, isA<User>());
      expect(result!.userID, isNotNull);
      expect(result.username, user.username);
      expect(result.role, user.role);
    });


    test('deleteUser', () async {
      // Arrange
      final username = 'neweruser';
      final user = await userRepository.login('newuser', 'newpassword');
      final userToDelete = await userRepository.getUserByUsername(username);

      // Act
      final accessToken = user?.accessToken;
      await userRepository.deleteUser(userToDelete?.userID, accessToken!);

      // Assert
      expect(() => userRepository.getUserByUsername(username),
          throwsA(isA<Exception>()));
    });
  });


}