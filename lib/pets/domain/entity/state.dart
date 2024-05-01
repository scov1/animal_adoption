part of 'pets_enitity.dart';

abstract class PetsState {}

class InitialPetsState extends PetsState {
  InitialPetsState({required this.pets});
  final List<Pet> pets;
}

class LoadingPetsState extends PetsState {}

class DataPetsState extends PetsState {
  DataPetsState({required this.pets});
  final List<Pet> pets;
}

class ErrorPetsState extends BaseBlocError implements PetsState {
  ErrorPetsState(Object error, StackTrace stackTrace) : super(error, stackTrace);
}

class LoadingNextPageState extends PetsState {}

class SearchPetsState extends PetsState {
  SearchPetsState(this.pets);
  final List<Pet> pets;
}
