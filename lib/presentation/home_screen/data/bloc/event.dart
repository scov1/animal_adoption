part of 'bloc.dart';

abstract class HomeEvent {}

class DataHomeEvent extends HomeEvent {}

class AddToFavoriteHomeEvent extends HomeEvent {
  AddToFavoriteHomeEvent({required this.pet});
  final Pet pet;
}

class DeleteFavoriteHomeEvent extends HomeEvent {
  DeleteFavoriteHomeEvent({required this.pet});
  final Pet pet;
}
