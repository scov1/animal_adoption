part of '../bloc.dart';

extension GetDataPets on HomeBloc {
  Future<void> _getDataPets(DataHomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingHomeState());
      final response = await remote.getDataPets(pagination: Pagination(pageSize: 6));
      petsList = response.pets;
      final box = await Hive.openBox('pet');
      for (var i in box.values.toList()) {
        for (var j in petsList) {
          if (i.id == j.id) {
            j.favoriteId = i.favoriteId;
          }
        }
      }
      emit(DataHomeState(pets: petsList));
    } catch (e, stackTrace) {
      emit(ErrorHomeState(e, stackTrace));
    }
  }
}
