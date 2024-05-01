part of 'pets_enitity.dart';

abstract class PetsEvent {}

class InitialPetsEvent extends PetsEvent {}

class NextPagePetsEvent extends PetsEvent {}

class AddToFavoritePetsEvent extends PetsEvent {
  AddToFavoritePetsEvent({required this.pet});
  final Pet pet;
}

class DeleteFavoritePetsEvent extends PetsEvent {
  DeleteFavoritePetsEvent({required this.pet});
  final Pet pet;
}

class SearchPetsEvent extends PetsEvent {
  SearchPetsEvent({required this.searchText});
  final String? searchText;
}
