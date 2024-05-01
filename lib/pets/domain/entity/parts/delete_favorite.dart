part of '../pets_enitity.dart';

extension DeleteFavorite on PetsEntity {
  Future<void> _deleteFavorite(DeleteFavoritePetsEvent event, Emitter<PetsState> emit) async {
    try {
      await remoteHome.deleteFavorite(event.pet.favoriteId!);

      event.pet.favoriteId = null;

      emit(InitialPetsState(pets: petsList));
    } catch (e, stackTrace) {
      emit(ErrorPetsState(e, stackTrace));
    }
  }
}
