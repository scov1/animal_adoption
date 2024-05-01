import '../../../data/vo/pet.dart';

abstract class IPetsRepo {
  Future<List<Pet>> getSearchPets(String? searchText);
}
