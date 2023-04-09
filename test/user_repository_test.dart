import 'package:flutter_graveyard_frontend/models/user_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserRepository', () {
    late UserRepository userRepository;

    setUp(() {
      userRepository = UserRepository();
    });

    test('login returns User when successful', () async {
      // Arrange
      final username = 'bob';
      final password = 'password';

      // Act
      final result = await userRepository.login(username, password);

      // Assert
      expect(result, isA<User>());
      expect(result!.username, username);
    });

    test('login throws an exception when unsuccessful', () async {
      // Arrange
      final username = 'wronguser';
      final password = 'wrongpassword';

      // Act & Assert
      expect(
            () => userRepository.login(username, password),
        throwsA(isA<Exception>()),
      );
    });


  });
}