part of '../bloc.dart';

extension AddToFavorites on HomeBloc {
  Future<void> _addToFavorites(AddToFavoriteHomeEvent event, Emitter<HomeState> emit) async {
    try {
      final response = await remote.addToFavorites(event.pet.referenceImageId!);

      final box = await Hive.openBox('pet');
      event.pet.favoriteId = response;
      await box.add(event.pet);

      emit(DataHomeState(pets: petsList));
    } catch (e, stackTrace) {
      emit(ErrorHomeState(e, stackTrace));
    }
  }
}
