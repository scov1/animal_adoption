part of '../bloc.dart';

extension SharePet on DetailsPetBloc {
  Future<void> _onSharePet(ShareDetailsPetEvent event, Emitter<DetailsPetState> emit) async {
    try {
      await Share.share(
        'https://www.vetstreet.com/cats/${event.petId}',
        subject: 'Because everyday is a Caturday.',
      );
    } catch (e, stackTrace) {
      emit(ErrorDetailsPetState(e, stackTrace));
    }
  }
}
