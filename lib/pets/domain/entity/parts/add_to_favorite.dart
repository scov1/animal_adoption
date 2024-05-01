part of '../pets_enitity.dart';

extension AddToFavorites on PetsEntity {
  Future<void> _addToFavorites(AddToFavoritePetsEvent event, Emitter<PetsState> emit) async {
    try {
      final response = await remoteHome.addToFavorites(event.pet.referenceImageId!);

      final box = await Hive.openBox('pet');
      event.pet.favoriteId = response;

      final pet = box.get(event.pet.id);
      if (pet != null) {
        pet.favoriteId = response;
        await box.put(event.pet.id, pet);
      }

      emit(InitialPetsState(pets: petsList));
    } catch (e, stackTrace) {
      emit(ErrorPetsState(e, stackTrace));
    }
  }
}
