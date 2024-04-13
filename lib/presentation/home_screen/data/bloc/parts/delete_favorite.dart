part of '../bloc.dart';

extension DeleteFavorite on HomeBloc {
  Future<void> _deleteFavorite(DeleteFavoriteHomeEvent event, Emitter<HomeState> emit) async {
    try {
      await remote.deleteFavorite(event.pet.favoriteId!);

      final box = await Hive.openBox('pet');
      var keyToDelete;
      for (var entry in box.toMap().entries) {
        var pet = entry.value as Pet;
        if (pet.id == event.pet.id) {
          keyToDelete = entry.key;
          break;
        }
      }
      event.pet.favoriteId = null;
      if (keyToDelete != null) {
        await box.delete(keyToDelete);
      }

      emit(DataHomeState(pets: petsList));
    } catch (e, stackTrace) {
      emit(ErrorHomeState(e, stackTrace));
    }
  }
}
