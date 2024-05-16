import 'dart:io' show Directory;
import 'package:animal_adoption/data/vo/pet.dart';
import 'package:animal_adoption/home/domain/services/pets_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

const String kTemporaryPath = 'temporaryPath';
const String kApplicationSupportPath = 'applicationSupportPath';
const String kApplicationDocumentsPath = 'applicationDocumentsPath';

void main() {
  late Directory result;
  late PetsService service;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProviderPlatform();
    result = await getTemporaryDirectory();
    service = PetsService();
    await Hive
      ..initFlutter(result.path)
      ..registerAdapter(PetAdapter());
  });

  group('PetsService', () {
    test(
      'PetService addToFavorite successfully',
      () async {
        try {
          await service.init();

          service.listPets = [];

          await service.addToFavorites(
            Pet(
              id: 'abys',
              name: 'Abyssinian',
              imageUrl: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
            ),
          );

          final data = service.listPets;
          print('Get data: $data');

          expect(
            data[0].name,
            'Abyssinian',
          );
          print('Test successful');
        } catch (e) {
          print('Test failed: $e');
          rethrow;
        }
      },
    );

    test(
      'PetService addToFavorite failed',
      () async {
        try {
          await service.init();

          await service.addToFavorites(
            Pet(
              id: 'aege',
              name: 'Aegean',
              imageUrl: 'https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg',
            ),
          );

          final data = service.listPets;
          print('Retrieved data: $data');

          expect(
            data[0].name,
            isNot('Fluffy'),
          );
          print('Test successful: Actual name did not match expected name');
        } catch (e) {
          print('Test failed: $e');
          rethrow;
        }
      },
    );
    test(
      'PetService removeFromFavorite success',
      () async {
        try {
          await service.init();

          final petToRemove = Pet(
            id: 'abys',
            name: 'Abyssinian',
            imageUrl: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
          );

          if (service.listPets.contains((e) => e.id == petToRemove.id)) {
            await service.removePetFavorites(petToRemove);
          }

          final data = service.listPets;
          print('Retrieved data: $data');

          expect(service.listPets.contains(petToRemove), false);
          print('Test successful: Pet is removed');
        } catch (e) {
          print('Test failed: $e');
          rethrow;
        }
      },
    );
  });
}

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return kTemporaryPath;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return kApplicationSupportPath;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return kApplicationDocumentsPath;
  }
}
