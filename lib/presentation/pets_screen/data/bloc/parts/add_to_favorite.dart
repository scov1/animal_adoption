part of '../bloc.dart';

extension AddToFavorites on PetsBloc {
  Future<void> _addToFavorites(AddToFavoritePetsEvent event, Emitter<PetsState> emit) async {
    try {
      final response = await remoteHome.addToFavorites(event.pet.referenceImageId!);

      final box = await Hive.openBox('pet');
      event.pet.favoriteId = response;
      await box.add(event.pet);

      emit(InitialPetsState(pets: petsList));
    } catch (e, stackTrace) {
      emit(ErrorPetsState(e, stackTrace));
    }
  }
}
