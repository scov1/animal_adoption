import '../../../../core/root_gateway/root_gateway.dart';
import '../../../../data/dto/images.dart';
import '../../../../data/dto/pets.dart';

class HomeApi {
  HomeApi({required this.api});
  final RootGateway api;

  Future<List<Pet>> getDataPets() async {
    final response = await api.gateway.general.get('/v1/breeds', queryParameters: {'limit': 6});
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
