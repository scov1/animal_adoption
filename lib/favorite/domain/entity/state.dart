part of 'favorite_entity.dart';

abstract class FavoriteState {}

class InitialFavoriteState extends FavoriteState {}

class LoadingFavoriteState extends FavoriteState {}

class DataFavoriteState extends FavoriteState {
  DataFavoriteState({required this.pets});
  final List<Pet> pets;
}

class ErrorFavoriteState extends BaseBlocError implements FavoriteState {
  ErrorFavoriteState(Object error, StackTrace stackTrace) : super(error, stackTrace);
}
