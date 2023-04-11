import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';
import 'package:flutter_graveyard_frontend/models/grave_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_graveyard_frontend/repository/graveyard_repository.dart';
import 'package:flutter_graveyard_frontend/repository/grave_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GraveRepository', () {
    late GraveyardRepository graveyardRepository;
    late UserRepository userRepository;
    late GraveRepository graveRepository;
    late String accessToken;
    late String username;
    late String userID;
    String graveyardName = "Test Graveyard";
    late String? graveyardID;

    setUpAll(() async {
      graveyardRepository = GraveyardRepository();
      userRepository = UserRepository();
      graveRepository = GraveRepository();
      final user = await userRepository.login('newuser', 'newpassword');

      accessToken = user!.accessToken!;
      username = user.username;
      userID = user.userID!;
      final graveyard = await graveyardRepository.getGraveyardByName(graveyardName, accessToken);
      graveyardID = graveyard?.graveyardID;
    });

    test('getGravesByGraveyardId', () async {
      final graves = await graveRepository.getGravesByGraveyardId(graveyardID!, accessToken);
      expect(graves, isA<List<Grave>>());
    });

    test('saveGrave', () async {
      final plotNumber = '32';
      await graveRepository.saveGrave(plotNumber, accessToken, graveyardID!);
      final graves = await graveRepository.getGravesByGraveyardId(graveyardID!, accessToken);
      final plotNumbers = graves!.map((g) => g.plotNumber).toList();
      expect(plotNumbers.contains(int.parse(plotNumber)), isTrue);
    });

    test('getAvailableGraves', () async {
      final availableGraves = await graveRepository.getAvailableGraves(accessToken);
      expect(availableGraves, isA<List<Grave>>());
      expect(availableGraves.length, greaterThan(0));
    });

    test('deleteGrave', () async {
      // Get the graves associated with the user logged in
      final graves = await graveRepository.getGravesByGraveyardId(graveyardID!, accessToken);
      expect(graves, isA<List<Grave>>());

      // Get the graveID associated with the plot number 32
      final grave = graves!.firstWhere((g) => g.plotNumber == 32);
      expect(grave, isNotNull);

      // Delete the grave
      await graveRepository.deleteGrave(grave.graveID!, accessToken);
      final updatedGraves = await graveRepository.getGravesByGraveyardId(graveyardID!, accessToken);

      // Check that the deleted grave is no longer in the list of graves
      expect(updatedGraves!.any((g) => g.graveID == grave.graveID), isFalse);
    });

  });
}