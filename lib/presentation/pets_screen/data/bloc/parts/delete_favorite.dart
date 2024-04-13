part of '../bloc.dart';

extension DeleteFavorite on PetsBloc {
  Future<void> _deleteFavorite(DeleteFavoritePetsEvent event, Emitter<PetsState> emit) async {
    try {
      await remoteHome.deleteFavorite(event.pet.favoriteId!);

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

      emit(InitialPetsState(pets: petsList));
    } catch (e, stackTrace) {
      emit(ErrorPetsState(e, stackTrace));
    }
  }
}
