part of '../pets_enitity.dart';

extension NextPagePets on PetsEntity {
  Future<void> _nextPagePets(NextPagePetsEvent event, Emitter<PetsState> emit) async {
    if (_pagination.incrementPage()) {
      try {
        emit(LoadingNextPageState());

        final response = await remoteHome.getDataPets(pagination: _pagination);

        petsList.addAll(response.pets);
        final box = await Hive.openBox('pet');
        for (var i in box.values.toList()) {
          for (var j in petsList) {
            if (i.id == j.id) {
              j.favoriteId = i.favoriteId;
            }
          }
        }
        emit(InitialPetsState(pets: petsList));
      } catch (e, stackTrace) {
        emit(ErrorPetsState(e, stackTrace));
      }
    }
  }
}
