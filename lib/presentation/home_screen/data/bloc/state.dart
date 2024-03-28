part of 'bloc.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class DataHomeState extends HomeState {
  DataHomeState({required this.pets});
  final List<Pet> pets;
}

class ErrorHomeState extends HomeState {
  ErrorHomeState({required this.error});
  final String error;
}
