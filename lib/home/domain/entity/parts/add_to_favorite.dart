part of '../home_entity.dart';

extension AddToFavorites on HomeEntity {
  Future<void> _addToFavorites(AddToFavoriteHomeEvent event, Emitter<HomeState> emit) async {
    try {
      final response = await remote.addToFavorites(event.pet.referenceImageId!);

      final box = await Hive.openBox('pet');
      event.pet.favoriteId = response;

      final pet = box.get(event.pet.id);
      if (pet != null) {
        pet.favoriteId = response;
        await box.put(event.pet.id, pet);
      }

      emit(DataHomeState(pets: petsList));
    } catch (e, stackTrace) {
      emit(ErrorHomeState(e, stackTrace));
    }
  }
}
