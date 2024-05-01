part of 'home_entity.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class DataHomeState extends HomeState {
  DataHomeState({required this.pets});
  final List<Pet> pets;
}

class ErrorHomeState extends BaseBlocError implements HomeState {
  ErrorHomeState(Object error, StackTrace stackTrace) : super(error, stackTrace);
}
