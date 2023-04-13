import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';
import 'package:flutter_graveyard_frontend/models/grave_model.dart';
import 'package:flutter_graveyard_frontend/repository/user_repository.dart';
import 'package:flutter_graveyard_frontend/repository/graveyard_repository.dart';
import 'package:flutter_graveyard_frontend/repository/grave_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

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

    test('getUnavailableGraves', () async {
      final unavailableGraves = await graveRepository.getUnavailableGraves(accessToken);
      expect(unavailableGraves, isA<List<Grave>>());
      expect(unavailableGraves.length, greaterThanOrEqualTo(0));
    });

    test('deleteGrave', () async {
      // Get the graves associated with the user logged in
      final graves = await graveRepository.getGravesByGraveyardId(graveyardID!, accessToken);
      expect(graves, isA<List<Grave>>());

      // Get the graveID associated with the plot number 32
      final grave = graves!.firstWhere((g) => g.plotNumber == 32);
      expect(grave, isNotNull);

      // Delete the grave
      await graveRepository.deleteGrave(grave.graveID, accessToken);
      final updatedGraves = await graveRepository.getGravesByGraveyardId(graveyardID!, accessToken);

      // Check that the deleted grave is no longer in the list of graves
      expect(updatedGraves!.any((g) => g.graveID == grave.graveID), isFalse);
    });

    /// updateGrave test case
    /// It retrieves a list of graves using the getGravesByGraveyardId method.
    /// It chooses a random grave from the list and saves its original date.
    /// It updates the date of the chosen grave using the updateGrave method.
    /// It retrieves the updated grave using the getGraveById method and verifies that its date was updated to the new value.
    /// It reverts the changes made to the grave for future tests.
    test('updateGrave', () async {
      // Get a list of graves
      final graves = await graveRepository.getGravesByGraveyardId(graveyardID!, accessToken);
      expect(graves, isA<List<Grave>>());

      // Choose a random grave to update
      final randomGrave = graves!.first;
      final originalDate = randomGrave.lastBuried;
      final newDate = '2023-04-30';

      // Update the grave
      await graveRepository.updateGrave(randomGrave.graveID, newDate, accessToken);

      // Verify that the grave was updated
      final updatedGrave = await graveRepository.getGraveById(randomGrave.graveID, accessToken);
      expect(updatedGrave, isNotNull);

      // Convert the dates to DateTime objects and compare just the date, month, and year
      final expectedDate = DateTime.parse('2023-04-30');
      //DateFormat('E, dd MMM yyyy HH:mm:ss').parse(updatedGrave!.lastBuried);
      final parsedDate = DateFormat('E, dd MMM yyyy HH:mm:ss').parse(updatedGrave!.lastBuried);
      final actualFormattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
      final expectedFormattedDate = DateFormat('yyyy-MM-dd').format(expectedDate);
      expect(actualFormattedDate, equals(expectedFormattedDate));

      // Revert the changes for future tests
      final originalparsedDate = DateFormat('E, dd MMM yyyy HH:mm:ss').parse(originalDate);
      final originalFormattedDate = DateFormat('yyyy-MM-dd').format(originalparsedDate);
      await graveRepository.updateGrave(randomGrave.graveID, originalFormattedDate, accessToken);
    });

  });
}