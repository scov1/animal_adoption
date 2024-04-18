part of 'bloc.dart';

abstract class DetailsPetState {}

class InitialDetailsPetState extends DetailsPetState {}

class SuccessDetailsPetState extends DetailsPetState {}

class LoadingDetailsPetState extends DetailsPetState {}

class ErrorDetailsPetState extends BaseBlocError implements DetailsPetState {
  ErrorDetailsPetState(Object error, StackTrace stackTrace) : super(error, stackTrace);
}
