import '../../../data/vo/pet.dart';
import '../../../pets/domain/vo/pagination.dart';

abstract class IHomeRepo {
  Future<Pets> getDataPets({required Pagination pagination});
  Future<int> addToFavorites(String imageId);
  Future<void> deleteFavorite(int favoriteId);
}
