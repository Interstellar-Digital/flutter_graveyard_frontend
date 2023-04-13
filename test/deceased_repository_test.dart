import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';
import 'package:flutter_graveyard_frontend/models/deceased_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_graveyard_frontend/repository/graveyard_repository.dart';
import 'package:flutter_graveyard_frontend/repository/grave_repository.dart';
import 'package:flutter_graveyard_frontend/repository/deceased_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('GraveRepository', () {
    late GraveyardRepository graveyardRepository;
    late UserRepository userRepository;
    late GraveRepository graveRepository;
    late DeceasedRepository deceasedRepository;
    late String accessToken;
    late String username;
    late String userID;
    String graveyardName = "Test Graveyard";
    bool expectedResponse = true;
    late String? graveyardID;
    late String graveID;

    setUpAll(() async {
      graveyardRepository = GraveyardRepository();
      userRepository = UserRepository();
      graveRepository = GraveRepository();
      deceasedRepository = DeceasedRepository();
      final user = await userRepository.login('newuser', 'newpassword');

      accessToken = user!.accessToken!;
      username = user.username;
      userID = user.userID!;
      final graveyard = await graveyardRepository.getGraveyardByName(graveyardName, accessToken);
      graveyardID = graveyard?.graveyardID;
      // Get a list of graves
      final graves = await graveRepository.getGravesByGraveyardId(graveyardID!, accessToken);
      final randomGrave = graves!.last;
      graveID = randomGrave.graveID;
    });

    test('createDeceased', () async {
      // Arrange
      final name = 'John Doe';
      final dateOfBirth = '1990-01-01';
      final dateOfDeath = '2021-04-01';
      final causeOfDeath = 'Natural Causes';

      print(graveID);
      // Act
      final result = await deceasedRepository.createDeceased(name, dateOfBirth, dateOfDeath, causeOfDeath, graveID, accessToken);

      // Assert
      expect(result, equals(expectedResponse));
    });

    test('getAllDeceased returns a list of deceased', () async {
      // Act
      final result = await deceasedRepository.getAllDeceased(accessToken);

      // Assert
      expect(result, isNotNull);
      expect(result is List<Deceased>, isTrue);
    });

    test('getAllDeceased returns null if the API call fails', () async {
      // Arrange
      final invalidToken = 'invalid_token';

      // Act
      final result = await deceasedRepository.getAllDeceased(invalidToken);

      // Assert
      expect(result, isNull);
    });

  });
}