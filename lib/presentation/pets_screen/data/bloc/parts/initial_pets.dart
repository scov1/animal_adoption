part of '../bloc.dart';

extension GetDataPets on PetsBloc {
  Future<void> _initialDataPets(InitialPetsEvent event, Emitter<PetsState> emit) async {
    try {
      emit(LoadingPetsState());
      final response = await remoteHome.getDataPets(pagination: Pagination());

      petsList = response.pets;

      _pagination = Pagination(allCount: response.petsAllCount);
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
