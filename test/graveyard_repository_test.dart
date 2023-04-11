import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_graveyard_frontend/repository/graveyard_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GraveyardRepository', () {
    late GraveyardRepository graveyardRepository;
    late UserRepository userRepository;
    late String accessToken;
    late String username;
    late String userID;

    setUpAll(() async {
      graveyardRepository = GraveyardRepository();
      userRepository = UserRepository();
      final user = await userRepository.login('newuser', 'newpassword');
      accessToken = user!.accessToken!;
      username = user.username;
      userID = user.userID!;
    });

    test('getAllGraveyards', () async {
      // Act
      final graveyards = await graveyardRepository.getAllGraveyards(accessToken, username);

      // Assert
      expect(graveyards, isA<List<Graveyard>>());
      expect(graveyards!.length, greaterThan(0));
      expect(graveyards.first, isA<Graveyard>());
    });

    test('getGraveyardById', () async {
      // Arrange
      final graveyardId = '3LpEOisBA2XdvfOQeJRe';

      // Act
      final result = await graveyardRepository.getGraveyardById(graveyardId, accessToken);

      // Assert
      expect(result, isA<Graveyard>());
      expect(result!.graveyardID, graveyardId);
      expect(result.name, isNotEmpty);
    });

    test('saveGraveyard', () async {
      // Arrange
      final tempGraveyard = Graveyard(
          name: 'Test Graveyard',
          location: 'Test Location',
          numberOfPlots: 50);

      // Act
      await graveyardRepository.saveGraveyard(tempGraveyard, userID, accessToken);

      // Assert
      final allGraveyards = await graveyardRepository.getAllGraveyards(accessToken, username);
      final savedGraveyard = allGraveyards!.firstWhere(
              (graveyard) => graveyard.name == tempGraveyard.name);
      expect(savedGraveyard.location, equals(tempGraveyard.location));
      expect(savedGraveyard.numberOfPlots, equals(tempGraveyard.numberOfPlots));
    });


  });
}