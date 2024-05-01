part of '../pets_enitity.dart';

extension SearchPets on PetsEntity {
  Future<void> _searchPets(SearchPetsEvent event, Emitter<PetsState> emit) async {
    try {
      emit(LoadingPetsState());
      final response = await remotePets.getSearchPets(event.searchText);
      petsList = response;
      final box = await Hive.openBox('pet');
      for (var i in box.values.toList()) {
        for (var j in petsList) {
          if (i.id == j.id) {
            j.favoriteId = i.favoriteId;
          }
        }
      }
      emit(SearchPetsState(petsList));
    } catch (e, stackTrace) {
      emit(ErrorPetsState(e, stackTrace));
    }
  }
}
