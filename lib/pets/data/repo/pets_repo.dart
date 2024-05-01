import '../../../../core/root_gateway/root_gateway.dart';
import '../../../data/vo/images.dart';
import '../../../data/vo/pet.dart';
import '../../domain/interface/i_pets_repo.dart';

class PetsRepo implements IPetsRepo {
  PetsRepo({required this.api});
  final RootGateway api;

  @override
  Future<List<Pet>> getSearchPets(String? searchText) async {
    final response =
        await api.gateway.general.get('/v1/breeds/search', queryParameters: {'q': searchText});

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

    return listPets;
  }
}
