part of '../bloc.dart';

extension GetDataPets on HomeBloc {
  Future<void> _getDataPets(DataHomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingHomeState());
      final pets = await remote.getDataPets();
      emit(DataHomeState(pets: pets));
    } catch (e) {
      emit(ErrorHomeState(error: errorToString(e)));
    }
  }
}
