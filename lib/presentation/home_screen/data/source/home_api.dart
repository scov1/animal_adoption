import 'package:dio/dio.dart';

import '../../../../core/root_gateway/root_gateway.dart';
import '../../../../core/utils/logger.dart';
import '../../../../data/dto/images.dart';
import '../../../../data/dto/pet.dart';
import '../../../pets_screen/data/model/pagination.dart';

class HomeApi {
  HomeApi({required this.api});
  final RootGateway api;

  Future<Pets> getDataPets({required Pagination pagination}) async {
    final response = await api.gateway.general.get('/v1/breeds', queryParameters: {
      ...pagination.toMap(),
    });

    final petsAllCount = response.headers['pagination-count'];

    int? petsCount = int.tryParse(petsAllCount?.first ?? '0');

    final listPets = <Pet>[];

    for (var i in response.data) {
      String? imageId = i['reference_image_id'];

      if (imageId != null) {
        final image = await api.gateway.general.get('/v1/images/$imageId');
        Pet pet = Pet.fromJson(i);
        pet.imageUrl = ImageDto.fromJson(image.data).url;
        listPets.add(pet);
      } else {
        listPets.add(Pet.fromJson(i));
      }
    }

    final modelPets = Pets(
      pets: listPets,
      petsAllCount: petsCount,
    );

    return modelPets;
  }

  Future<int> addToFavorites(String imageId) async {
    final response = await api.gateway.general.post('/v1/favourites',
        options: Options(
          headers: {
            'x-api-key': 'live_UJQ5QGMSZAoVxdEIVuhiNCTlQUSjTHnPWI0aRwgqzUV2EtrcII4kOFAxU6rSw90J'
          },
        ),
        data: {'image_id': imageId});

    return response.data['id'];
  }

  Future<void> deleteFavorite(int favoriteId) async {
    final response = await api.gateway.general.delete(
      '/v1/favourites/$favoriteId',
      options: Options(
        headers: {
          'x-api-key': 'live_UJQ5QGMSZAoVxdEIVuhiNCTlQUSjTHnPWI0aRwgqzUV2EtrcII4kOFAxU6rSw90J'
        },
      ),
    );

    Log.w(response.verbose);
  }
}
