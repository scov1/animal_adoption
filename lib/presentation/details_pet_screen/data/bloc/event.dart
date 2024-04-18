part of 'bloc.dart';

abstract class DetailsPetEvent {}

class ShareDetailsPetEvent extends DetailsPetEvent {
  ShareDetailsPetEvent({required this.petId});
  final String petId;
}
